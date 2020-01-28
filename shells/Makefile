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
# This file does not exist...
pr_tcl = ./hlsTest/dma_example/tclScripts/pr_bd.tcl

# This target is completely broken
dma_example:
	vivado_hls ./hlsTest/dma_example/generate_hls.tcl
	vivado -mode gui -source ./tclScripts/make_shell.tcl -tclargs --project_name dma_example --pr_tcl ${pr_tcl} --start_synth ${synth}

# None of these files exist
hlsExample:
	mkdir -p hlsBuild
	vivado_hls ./hlsTest/generate_hls.tcl 
	./hlsTest/generate.sh dma_example

example:
	mkdir -p projects
	vivado -mode batch -source ./tclScripts/make_shell.tcl -tclargs --project_name example --start_synth ${synth}
	# Get rid of references to nonexistent files
	# vivado -mode tcl -source ./tclScripts/make_shell.tcl -tclargs --project_name example --pr_tcl ${pr_tcl} --start_synth ${synth}

# I think this is the target that gets called when you build a project
app_dev: guard-PROJECTNAME
	mkdir -p projects
	vivado -mode gui -source ./tclScripts/make_shell.tcl -tclargs --project_name ${PROJECTNAME}
	# Why do we always make a projects directory?

clean:
	rm -rf projects/project_name
