SGDK_VERSION=2.11
UID=$(shell id -u)
GID=$(shell id -g)
DOCKER_IMAGE=registry.gitlab.com/doragasu/docker-sgdk:v${SGDK_VERSION}

.PHONY: compile
compile:
	docker run -it --rm --user ${UID}:${GID} -v "${PWD}":/workdir -w /workdir --platform linux/amd64 ${DOCKER_IMAGE}

shell:
	docker run -it --rm -v "${PWD}":/workdir -w /workdir --entrypoint=/bin/bash  --platform linux/amd64 ${DOCKER_IMAGE}

clean:
	rm -rf out/* build/* src/boot/*

format:
	clang-format -i src/main.c

RETROARCH=/Applications/RetroArch.app/Contents/MacOS/RetroArch
RETROARCH_CORE=~/Library/Application\ Support/RetroArch/cores/genesis_plus_gx_libretro.dylib
run:
	${RETROARCH} -L ${RETROARCH_CORE} out/rom.bin
