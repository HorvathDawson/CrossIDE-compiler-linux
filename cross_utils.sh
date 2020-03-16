#!/bin/bash
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
asm_compiler=$script_dir"/Call51/Bin/a51.exe"
qrt_stp=$(locate --regex quartus/bin/quartus_stp$)
load_script=$script_dir"/Load_Script.tcl"

function hexcompile {

	local filename=$(winepath -w $1)
	local cross_path_compiler=$asm_compiler
	local win_compiler=$(winepath -w $cross_path_compiler)
	wine $win_compiler -l $filename
	return 

}

function flash {
	$qrt_stp -t $load_script $1
	return
}

return
