class MemoryPartitioner:
    def __init__(self, max_memory=16*1024*1024*1024):
        self.max_memory = max_memory
        self.current_addr = 0
        self.partitions = []

    def parse_size(self, size_str):
        size_str = size_str.upper()
        if size_str.endswith("K"):
            return int(size_str[:-1]) * 1024
        elif size_str.endswith("M"):
            return int(size_str[:-1]) * 1024 * 1024
        elif size_str.endswith("G"):
            return int(size_str[:-1]) * 1024 * 1024 * 1024
        else:
            raise ValueError("Invalid size format. Please use K, M, or G")

    def allocate_partition(self, size_str):
        size_in_bytes = self.parse_size(size_str)
        if self.current_addr + size_in_bytes > self.max_memory:
            raise MemoryError("Not enough memory to allocate this partition")

        start_addr = self.current_addr
        end_addr = start_addr + size_in_bytes - 1
        self.partitions.append((start_addr, end_addr))
        self.current_addr += size_in_bytes

        return (start_addr, end_addr)

    def get_partitions(self):
        return self.partitions

    def memory_addition(self, size_mem1, size_mem2):
        size_mem2_in_bytes = self.parse_size(size_mem2)
        result_in_bytes = size_mem1 + size_mem2_in_bytes

        return result_in_bytes