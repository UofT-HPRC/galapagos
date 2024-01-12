all: multiplierA multiplierB

.PHONY : multiplierA multiplierB clean

multiplierA:
	if [ ! -d multiplierA ] || [ ! -f multiplierA/indicator.txt ] ; then \
	rm -f Namefile.txt && \
	echo 'multiplierA' > Namefile.txt && \
	rm -f Speed_grade.txt && \
	echo '3' > Speed_grade.txt && \
	rm -rf multiplierA && \
	mkdir multiplierA && \
	vivado_hls hls_builder.tcl && \
	rm -f vivado_hls.log && \
	rm -f Namefile.txt && \
	rm -f Speed_grade.txt && \
	echo 'done' > multiplierA/indicator.txt; \
	fi

multiplierB:
	if [ ! -d multiplierB ] || [ ! -f multiplierB/indicator.txt ] ; then \
	rm -f Namefile.txt && \
	echo 'multiplierB' > Namefile.txt && \
	rm -f Speed_grade.txt && \
	echo '3' > Speed_grade.txt && \
	rm -rf multiplierB && \
	mkdir multiplierB && \
	vivado_hls hls_builder.tcl && \
	rm -f vivado_hls.log && \
	rm -f Namefile.txt && \
	rm -f Speed_grade.txt && \
	echo 'done' > multiplierB/indicator.txt; \
	fi

clean:
	rm -rf multiplierA multiplierB
