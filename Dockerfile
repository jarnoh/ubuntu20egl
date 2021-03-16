FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install software-properties-common curl \
	build-essential git clang rsync cmake \
	libegl1-mesa libgles2-mesa vainfo mesa-utils xvfb \
	zlib1g-dev libegl1-mesa-dev libgles2-mesa-dev

WORKDIR /work
COPY . .

RUN gcc eglintro.c -lEGL -oeglintro

CMD xvfb-run ./eglintro
