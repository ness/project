. ~/.local/lib/project/project.sh

project_activate () {
	project_dir=$(find_project_dir)
	if [ -d $project_dir/.project/bin ]; then
		. $project_dir/.project/bin/activate
	fi
}

cdp () {
	cd $(dirname $PROJECT_DIR)
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
