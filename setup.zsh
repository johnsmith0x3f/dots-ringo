#!/usr/bin/env zsh

function stow() {
	if (( $# != 2 )); then
		return 2
	fi

	local source_path="${1:A}"
	local target_path="${2:A}"

	if [[ ! -d "${target_path:h}" ]]; then
		return 1
	fi

	if [[ ! -d "$target_path" ]]; then
		ln -s "$source_path" "$target_path"
		return 0
	fi

	for source_file in "$source_path"/**/*(N); do
		target_file="${source_file/#$source_path/$target_path}"
		if [[ ! -e "$target_file" ]]; then
			ln -fns "$source_file" "$target_file"
		fi
	done
}

function unstow() {
	if (( $# != 2 )); then
		return 2
	fi

	local source_path="${1:A}"
	local target_path="${2:A}"

	if [[ ! -d "${target_path:h}" ]]; then
		return 1
	fi

	if [[ -L "$target_path" ]]; then
		rm "$target_path"
		return 0
	fi

	for source_file in "$source_path"/**/*(N); do
		target_file="${source_file/#$source_path/$target_path}"
		if [[ -L "$target_file" ]]; then
			rm "$target_file"
		fi
	done
}

root_dir="${0:A:h}"

[[ "$1" == "install" ]] && stow "$root_dir/home" "$HOME" || unstow "$root_dir/home" "$HOME"
