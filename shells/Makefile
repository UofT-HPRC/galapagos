#Makefile for Galapagos

#Author: Naif Tarafdar


# checks that environment variables are set prior to running targets
guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Variable $* not set"; \
		exit 1; \
	fi

all: example 

synth = 0 
pr_tcl = ./hlsTest/dma_example/tclScripts/pr_bd.tcl

dma_example:
	vitis_hls ./hlsTest/dma_example/generate_hls.tcl
# vivado_hls  ./hlsTest/dma_example/generate_hls.tcl (Kartavya's comment: No idea who changed this to Vitis. My version had vivado_hls but I am not using the demo so I changed it back before pushing my commit)
	vivado -mode gui -source ./tclScripts/make_shell.tcl -tclargs --project_name dma_example --pr_tcl ${pr_tcl} --start_synth ${synth}

hlsExample:
	mkdir -p hlsBuild
	vitis_hls ./hlsTest/generate_hls.tcl 
# vivado_hls  ./hlsTest/generate_hls.tcl  (Kartavya's comment: No idea who changed this to Vitis. My version had vivado_hls but I am not using the demo so I changed it back before pushing my commit)
	./hlsTest/generate.sh dma_example

example: hlsExample
	mkdir -p projects
	vivado -mode tcl -source ./tclScripts/make_shell.tcl -tclargs --project_name example --pr_tcl ${pr_tcl} --start_synth ${synth}

app_dev: guard-PROJECTNAME
	mkdir -p projects
	vivado -mode gui -source ./tclScripts/make_shell.tcl -tclargs --project_name ${PROJECTNAME}

clean:
	rm -rf projects/project_name
