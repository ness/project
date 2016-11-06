upsearch () {
  if test -e "$1"; then
    echo "$PWD"
  else
    if [ "$PWD" = "/" ]; then
      return 1;
    else
      pushd .. > /dev/null
      upsearch "$1"
      exit_status=$?
      popd > /dev/null
      return "$exit_status"
    fi
  fi
}

find_project_dir () {
	echo $(upsearch ".project")
}	

is_project () {
	if [ -n "${PROJECT_DIR+set}" ]; then
		return 0
	fi
	return 1
}
