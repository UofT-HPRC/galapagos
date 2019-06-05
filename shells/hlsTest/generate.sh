#!/usr/bin/env bash

if [[ "$#" != 1 ]]; then
    echo "Syntax: script moduleName"
    exit 1
fi

old_path=$PWD
file=$1

if [[ ! -z $GALAPAGOS_PATH ]]; then
    root_path=$GALAPAGOS_PATH/shells
    hls_version=$GALAPAGOS_HLS_VERSION
    part_family=$GALAPAGOS_PART_FAMILY
elif [[ ! -z $SHELLS_PATH ]]; then
    root_path=$SHELLS_PATH
    hls_version=$SHELLS_HLS_VERSION
    part_family=$SHELLS_PART_FAMILY
else
    echo "No root path found: have you sourced init.sh?"
    return 1
fi

projectPath=$root_path/hlsBuild/$hls_version
solutionPath=$projectPath/$file/$part_family
ipPath=$solutionPath/impl/ip
prefixedName=${file}_${file}

mkdir -p $projectPath
cd $projectPath
vivado_hls -f $root_path/hlsTest/generate.tcl $file
vivado_return=$?
if [[ $vivado_return != 0 ]]; then
    exit $vivado_return
fi
cat $solutionPath/syn/report/${file}_csynth.rpt
sed -i "s/\b$prefixedName\b/${file}/g" $ipPath/run_ippack.tcl
sed -i "s/set DisplayName \"${file^}_${file}\"/set DisplayName \"${file}\"/g" \
    $ipPath/run_ippack.tcl
sed -i "s/\b$prefixedName\b/${file}/g" \
    $ipPath/hdl/vhdl/${file}_${file}.vhd
sed -i "s/\b$prefixedName\b/${file}/g" \
    $ipPath/hdl/verilog/${file}_${file}.v
sed -i "s/\b$prefixedName\b/${file}/g" \
    $ipPath/bd/bd.tcl
mv $ipPath/hdl/vhdl/${file}_${file}.vhd \
    $ipPath/hdl/vhdl/${file}.vhd
mv $ipPath/hdl/verilog/${file}_${file}.v \
    $ipPath/hdl/verilog/${file}.v
cd $ipPath 
./pack.sh
cd $old_path
