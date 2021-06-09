.PHONY: build
build:
	@docker build -t cuda-with-conda:latest .

.PHONY: up
up:
	@docker run --rm --name cuda-conda -v `pwd`:/home -it cuda-with-conda

.PHONY: run
run:
	@docker run --rm -w /home  --name cuda-conda -v `pwd`:/home -it cuda-with-conda 