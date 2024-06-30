#!/bin/sh

BINARIES_DIR="${0%/*}/"
# shellcheck disable=SC2164
cd "${BINARIES_DIR}"

# TODO: use path to host renode package

mode_console=false
while [ "$1" ]; do
    case "$1" in
    --console) mode_console=true; shift;;
    --) shift; break;;
    *) echo "unknown option: $1" >&2; exit 1;;
    esac
done

EXTRA_ARGS=""

if ${mode_console}; then
	EXTRA_ARGS="${EXTRA_ARGS} --console"
fi

exec renode renode_riscv32_virt.resc ${EXTRA_ARGS} "$@"

