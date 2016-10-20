. ~/.local/lib/project/project.sh

project_activate () {
	if [ -n "${1+set}" ]; then
		project_dir=$1
	else
		project_dir=$(find_project_dir)
	fi
	echo $project_dir
	if [ -d $project_dir/.project/bin ]; then
		. $project_dir/.project/bin/activate
	fi
	export PATH="$PROJECT_DIR"/bin:$PATH
	hash -r
}

project_deactivate () {
	if ! $(__ps1_is_project); then
		return
	fi
	__remove_from_path "$PROJECT_DIR"/bin
	hash -r
	unset PROJECT_DIR
}

cdp () {
	cd $(dirname $PROJECT_DIR)
}

__remove_from_path () {
	export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`;
}

__ps1_project () {
	$(__ps1_is_project)
	if [ $? ]; then
		echo $(basename $(dirname $PROJECT_DIR))
	fi
}

__ps1_is_project () {
	if [ -n "${PROJECT_DIR+set}" ]; then
		return 0
	fi
	return 1
}
