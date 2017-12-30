all: clean build run
build:
	clang test.c -o a.out -O3
	clang test.c -o a.s -O3 -S
	clang test.c -S -emit-llvm -o test.ll -O3

clean:
	-rm a.out

run:
	sudo perf stat -d ./a.out
