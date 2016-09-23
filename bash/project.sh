. ~/.local/lib/project/project.sh

project_activate () {
	project_dir=$(find_project_dir)
	if [ -d $project_dir/.project/bin ]; then
		. $project_dir/.project/bin/activate
	fi
}
