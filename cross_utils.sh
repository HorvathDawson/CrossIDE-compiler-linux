#!/bin/bash


source ./setup.sh

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
