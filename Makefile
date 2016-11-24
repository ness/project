.PHONY: all develop

print-%  : ; @echo $* = $($*)
binaries = $(shell find ./bin -type f)

all:

install:
	cp bash/project.sh ~/.bash.d/
	mkdir -p ~/.local/lib/project/
	cp lib/project.sh ~/.local/lib/project/
	cp bin/project_create ~/bin/
	chmod 744 ~/bin/project_create
	cp bin/project_do ~/bin/
	chmod 744 ~/bin/project_do
	mkdir -p ~/.local/share/project/
	cp -r share/* ~/.local/share/project/

develop: bin_develop hooks_develop

bin_develop: $(binaries)
	for f in $?; do rm ~/bin/$$(basename $$f) ;ln -s $$(pwd)/$$f ~/bin; done

hooks_develop:
	rm -fr ~/.local/share/project
	ln -s $$(pwd)/share ~/.local/share/project
