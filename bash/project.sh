. ~/.local/lib/project/project.sh

project_activate () {
	eval $(project_environment activate)
	hash -r
	echo $(dirname $PROJECT_DIR)
	if [ -d $project_dir/.project/bin ]; then
		$project_dir/.project/bin/activate
	fi
}

project_deactivate () {
	eval $(project_environment deactivate)
	hash -r
}

cdp () {
	cd $(dirname $PROJECT_DIR)
}

__ps1_project () {
	$(is_project)
	if [ $? ]; then
		echo $(basename $(dirname $PROJECT_DIR))
	fi
}

