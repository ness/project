. ~/.local/lib/project/project.sh

project_activate () {
	project_dir=$(find_project_dir)
	if [ -d $project_dir/.project/bin ]; then
		. $project_dir/.project/bin/activate
	fi
	export PATH="$PROJECT_DIR"/bin:$PATH
	hash -r
}

project_deactivate () {
	$(__ps1_is_project)
	if [ ! $? ]; then
		return
	fi
	__remove_from_path "$PROJECT_DIR"/bin
	hash -r
	unset ROJECT_DIR
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
		exit 0
	fi
	exit 1
}
