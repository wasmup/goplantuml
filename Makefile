all:
	go install -ldflags=-s ./...
	which goplantuml
	file $(which goplantuml)

zip:	
	7z a -mx9 ${GOTMPDIR}/linux-x86-64.7z $(which goplantuml)

init:
	git remote -v
	go mod init github.com/jfeliu007/goplantuml
	go mod tidy