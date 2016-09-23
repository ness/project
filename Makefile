.PHONY: all

all:

install:
	cp bash/project.sh ~/.bash.d/
	mkdir -p ~/.local/lib/project/
	cp lib/project.sh ~/.local/lib/project/
	cp bin/project_create ~/bin/
	chmod 744 ~/bin/project_create
	cp bin/project_do ~/bin/
	chmod 744 ~/bin/project_do
