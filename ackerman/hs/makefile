all: clean build run

clean:
	-rm a.out
	-rm *.hi
	-rm *.o

build:
	ghc -O3 main.hs -o a.out -ddump-stg -ddump-cmm -ddump-to-file
	# ghc -O3 main.hs -o a.out -ddump-stg -ddump-cmm -ddump-to-file -fplugin=Sxhc.Plugin
run:
	./a.out

