.PHONY: all zip gen init

all:
	go install -ldflags=-s ./...
	which goplantuml

zip:	
	7z a -mx9 ${GOTMPDIR}/linux-x86-64.7z $(GOBIN)/goplantuml

gen:
	goplantuml -show-connection-labels -show-aggregations -recursive -ignore="./testingsupport/" -title="Parser Class Diagram" ./parser > ClassDiagram.puml

init:
	git remote -v
	go mod init github.com/jfeliu007/goplantuml
	go mod tidy