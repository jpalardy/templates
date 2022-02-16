
TARGET ?= 75

solve:
	docker run -v "$$PWD:/minizinc" -ti --rm minizinc/minizinc:edge-alpine minizinc /minizinc/coins.mzn -D target=$(TARGET) -a

