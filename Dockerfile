FROM ubuntu:latest



WORKDIR /home
RUN apt-get update && apt-get install -y g++

COPY ./main.cpp ./
COPY ./calc_word.s ./

RUN g++ main.cpp -c -o main.o
RUN as calc_word.s -o calc_word.o
RUN g++ main.o calc_word.s -o prog

RUN rm main.o calc_word.o
CMD ./prog
