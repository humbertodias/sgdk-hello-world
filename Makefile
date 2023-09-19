download:
	if ! test -d SGDK; then git clone https://github.com/Stephane-D/SGDK ; fi

docker-sgdk:	download
	cd SGDK && docker build . -t sgdk

.PHONY: build
build:
	docker run -it --rm -v "${PWD}":/src sgdk

clean:
	rm -rf out/*
