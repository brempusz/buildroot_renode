#!/bin/bash

RENODE_BOARD_DIR="$(dirname "$0")"
DEFCONFIG_NAME="$(basename "$2")"

if [[ "${DEFCONFIG_NAME}" =~ ^"renode_*" ]]; then
    # Not a Renode defconfig
    exit 0
fi

CFG="${DEFCONFIG_NAME%%_defconfig}"

cp -v ${RENODE_BOARD_DIR}/${CFG}_readme.txt  "${BINARIES_DIR}/${CFG}_readme.txt"

# TODO: compile dts to dtb
cp -v ${RENODE_BOARD_DIR}/${CFG}.dts         "${BINARIES_DIR}/${CFG}.dts"
cp -v ${RENODE_BOARD_DIR}/${CFG}.dtb         "${BINARIES_DIR}/${CFG}.dtb"

cp -v ${RENODE_BOARD_DIR}/${CFG}.repl        "${BINARIES_DIR}/${CFG}.repl"
cp -v ${RENODE_BOARD_DIR}/${CFG}.resc        "${BINARIES_DIR}/${CFG}.resc"

cp -v ${RENODE_BOARD_DIR}/start-${CFG}.sh    "${BINARIES_DIR}/start-${CFG}.sh"
chmod +x "${BINARIES_DIR}/start-${CFG}.sh"

