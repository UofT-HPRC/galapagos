#Makefile for Galapagos

#Author: Naif Tarafdar


# checks that environment variables are set prior to running targets
guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Variable $* not set"; \
		exit 1; \
	fi

all: example 

synth = 1 
pr_tcl = ./hlsTest/dma_example/tclScripts/pr_bd.tcl


hlsExample:
	mkdir -p hlsBuild
	# vivado_hls ./hlsTest/generate_hls.tcl 
	./hlsTest/generate.sh dma_example

example: hlsExample
	mkdir -p projects
	vivado -mode tcl -source ./tclScripts/make_shell.tcl -tclargs --project_name example --pr_tcl ${pr_tcl} --start_synth ${synth}

app_dev: guard-PROJECTNAME
	mkdir -p projects
	vivado -mode gui -source ./tclScripts/make_shell.tcl -tclargs --project_name ${PROJECTNAME}

clean:
	rm -rf projects/project_name
