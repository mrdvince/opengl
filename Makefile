.PHONY : build clean runonly run

all: | build

clean:
	@rm -rf cmake-build-debug

build:
	@mkdir cmake-build-debug
	@cd cmake-build-debug && cmake .. && make

runonly:
	@cmake-build-debug/learn_opengl

run: | all runonly
