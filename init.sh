#!/usr/bin/env bash

# Given the Xilinx FPGA part number, this finds the appropriate FPGA family,
# which is appended to the provided configFile
echo $configFile
find_family () {
  configFile=$1
  part=$2

  FPGA_family="${part:2:1}"
  if [[ $FPGA_family == 'k' ]]; then
    FPGA_family='Kintex'
  elif [[ $FPGA_family == 'v' ]]; then
    FPGA_family='Virtex'
  elif [[ $FPGA_family == '7' ]]; then
    FPGA_family='7series'
  elif [[ $FPGA_family == 'u' ]]; then
    FPGA_family='useries'
  else
    FPGA_family="${part:2:2}"
    if [[ $FPGA_family != 'zu' ]]; then
      return 1
    fi
  fi

  if [[ $FPGA_family == '7series' ]]; then
    FPGA_type="${part:3:1}"
    if [[ $FPGA_type == 'k' ]]; then
      FPGA_type='Kintex'
    elif [[ $FPGA_type == 'v' ]]; then
      FPGA_type='Virtex'
    elif [[ $FPGA_type == 'u' ]]; then
      FPGA_type='u'
    elif [[ $FPGA_type == 'z' ]]; then
      FPGA_type='Zynq'
    else
      return 2
    fi
  else
    FPGA_type="${part%%-*}"
    FPGA_type="${FPGA_type: -1}"
    if [[ $FPGA_type == 'p' ]]; then
      FPGA_type='Ultrascale_Plus'
    else
      FPGA_type='Ultrascale'
    fi
  fi

  if [[ $FPGA_family == 'zu' ]]; then
    Solution='Zynq_Ultrascale_Plus'
  else
    Solution=${FPGA_family}_${FPGA_type}
  fi

  echo "export GALAPAGOS_PART_FAMILY=$Solution" >> $configFile

  return 0
}

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
  if [[ "$#" > 5 ]]; then
    part=$6
    board_name=$7
  fi
  if [[ "$#" > 7 ]]; then
    board=$8
  fi
else
  operation=$1
fi

# TODO prefix all "shells" with galapagos_
configFile=~/.galapagos

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
} >> $configFile

if [[ "$#" > 5 ]]; then
  echo "export GALAPAGOS_PART=$part" >> $configFile
  echo "export GALAPAGOS_BOARD_NAME=$board_name" >> $configFile
  echo "export GALAPAGOS_BANDWIDTH=$interfaceBandwidth" >> $configFile
fi
if [[ "$#" == 8 ]]; then
  echo "export GALAPAGOS_BOARD=$board" >> $configFile
fi

{
  echo "export LOGICALFILE=$repoPath/logical.xml"
  echo "export MAPFILE=$repoPath/map.xml"
} >> $configFile



# TODO print supported boards as help
cat >> $configFile <<EOF

galapagos-update-board() {
  if [[ "\$#" != 1 || \$1 == '--h' || \$1 == '-help' ]]; then
    echo "Usage: galapagos-update-board board"
    return 1
  fi

  if [[ \$1 == "pynq-z2" ]]; then
    partName=xc7z020clg400-1
    board=tul.com.tw:pynq-z2:part0:1.0
  elif [[ \$1 == "zedboard" ]]; then
    partName=xc7z020clg484-1
    board=em.avnet.com:zed:part0:1.3
  elif [[ \$1 == "sidewinder" ]]; then
    partName=xczu19eg-ffvc1760-2-i
    board=fidus.com:sidewinder100:part0:1.0
  elif [[ \$1 == "adm-8k5" ]]; then
    partName=xcku115-flva1517-2-e
    board="NULL"
  elif [[ \$1 == "adm-8k5-debug" ]]; then
    partName=xcku115-flva1517-2-e
    board="NULL"
  elif [[ \$1 == "u200" ]]; then
    partName=xcu200-fsgd2104-2-e
    board="NULL"
  elif [[ \$1 == "u250" ]]; then
    partName=xcu250-figd2104-2l-e
    board="NULL"
  elif [[ \$1 == "adm-8k5-debug" ]]; then
    partName=xcu280-fsvh2892-2l-e
    board="NULL"
 
  else
    echo "Unknown board \$1 specified. No changes made to galapagos"
    return 1
  fi

  boardName=\$1


  if [[ \$board != "NULL" ]]; then
    source \$GALAPAGOS_PATH/init.sh \\
      \$GALAPAGOS_PATH \\
      $vitisPath \\
      $hlsPath \\
      \$GALAPAGOS_VITIS_VERSION \\
      \$GALAPAGOS_HLS_VERSION \\
      \$GALAPAGOS_SET_FREQUENCY \\
      \$GALAPAGOS_ACTUAL_FREQUENCY \\
      \$partName \\
      \$boardName \\
      \$board
  else
    source \$GALAPAGOS_PATH/init.sh \\
      \$GALAPAGOS_PATH \\
      $vitisPath \\
      $hlsPath \\
      \$GALAPAGOS_VITIS_VERSION \\
      \$GALAPAGOS_HLS_VERSION \\
      \$GALAPAGOS_SET_FREQUENCY \\
      \$GALAPAGOS_ACTUAL_FREQUENCY \\
      \$partName \\
      \$boardName
  fi
}

galapagos-update-versions() {
  if [[ "\$#" != 2 || \$1 == '--h' || \$1 == '-help' ]]; then
    echo "Usage: galapagos-update-versions vitis_version vitis_hls_version"
    return 1
  fi

  configFile=$configFile
  vitisPath=$vitisPath

  # replace only lines starting with GALAPAGOS_*
  sed -i "/^export GALAPAGOS_VITIS_VERSION=/ s/export GALAPAGOS_VITIS_VERSION=.*/export GALAPAGOS_VITIS_VERSION=\$1/" \$configFile
  sed -i "/^export GALAPAGOS_HLS_VERSION=/ s/export GALAPAGOS_HLS_VERSION=.*/export GALAPAGOS_HLS_VERSION=\$2/" \$configFile

  source \$configFile
  export PATH=$vitisPath_append/bin:$PATH
}
EOF

source $configFile
export PATH=$vitisPath_append/bin:$PATH

