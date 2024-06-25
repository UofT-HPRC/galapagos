#!/usr/bin/env bash

# Given the Xilinx FPGA part number, this finds the appropriate FPGA family,
# which is appended to the provided configFile
echo $configFile
if [[ "$#" != 1 && "$#" != 5 && "$#" != 7 && "$#" != 9 && "$#" != 10 ]]; then
  echo "5,7 or 8 arguments expected, got $#"
  echo "Usage: init.sh /abs/path/to/galapagos/repository /abs/path/to/vitis /abs/path/to/vitis_hls vitis_version vitis_hls_version [part name] [board name] [board] "
  echo "Usage: source init.sh OPERATION"
  return 1
fi

if [[ "$#" != 1 ]]; then
  repoPath=$(readlink -f "$1")
  vitisPath=$(readlink -f "$2")
  hlsPath=$(readlink -f "$3")
  echo $vitisPath
  vitisVersion=$4
  hlsVersion=$5
fi
# TODO prefix all "shells" with galapagos_
configFile=~/.galapagos

if [[ "$#" == 1 ]]; then
  if [[ $operation == "switch" ]]; then
    unset "${!GALAPAGOS@}"
    sed -i '/# added by galapagos/s/^/#/' ~/.bashrc

    sed -i '/# added by shells/s/^#//' ~/.bashrc
    source $configFile
    return 0
  else
    echo "Unknown operation: $operation"
    return 1
  fi
fi

if [[ -f $configFile ]]; then
  echo "Updating galapagos initialization..."
  unset GALAPAGOS_BOARD
  rm $configFile
fi

# TODO make versions into a list and print supported versions on 'else' path
hlsPath_append=$hlsPath/$hlsVersion

if [[ "$#" > 5 ]]; then
  # https://stackoverflow.com/a/2264537
  part=$(echo "$part" | tr '[:upper:]' '[:lower:]') # convert to lower-case

  find_family $configFile $part
  if [[ $? != 0 ]]; then
    echo "Error $?: Unable to identify FPGA family from part $part"
    return 1
  fi
fi

vitisPath_append=$vitisPath/$vitisVersion

interfaceBandwidth="100G"

{
  echo "export GALAPAGOS_PATH=$repoPath"
  echo "export GALAPAGOS_VITIS_PATH=$vitisPath_append"
  echo "export GALAPAGOS_HLS_PATH=$hlsPath_append"
  echo "export GALAPAGOS_VITIS_VERSION=$vitisVersion"
  echo "export GALAPAGOS_HLS_VERSION=$hlsVersion"
  echo "source $vitisPath_append/settings64.sh"
  echo "export GALAPAGOS_BANDWIDTH=$interfaceBandwidth" >> $configFile
} >> $configFile


source $configFile
export PATH=$vitisPath_append/bin:$PATH
