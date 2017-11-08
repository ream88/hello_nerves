# HelloNerves

My first [Built with Nerves](http://nerves-project.org) project running on [Andre's](https://github.com/mcandy007) Raspberry Pi he has given me a long time
ago.

## Goals

My goals for this project are:

- [x] Build and run an OTP application on the Raspberry Pi.
- [x] Start communication via Morse code. (I'm currently lacking any
HDMI-enabled display).
- [ ] Provide some form of communication via LAN. Maybe `iex` over LAN?

## Things I've learned so far

- SD's are crap. Even from brands like Kingston. For hours I was wondering why
my code wasn't working which was very cumbersome without a display connected to
the Raspberry Pi. Sometimes even the included examples failed to run. Switching
to my SanDisk SD fixed all these problems.

- Appearantly OSes are compensating lots of the above mentioned problems. All
of the SD's I have are working correctly with macOS.

- Testing (as far as possible) is better done on a Linux system. I still receive
errors, however more files and devices are at their expected places. I switched
therefore to Docker for testing (and it's never bad to refresh the Docker
knowledge).

## Setup

Build the Docker image with the following command.

```sh
docker build . -t hello_nerves
```

## Usage

Creates and starts the container with `iex -S mix` in the foreground. Due to the
`--rm` argument, the container is cleaned up after exiting. The
`-v $(pwd):/home` allows code changes without rebuilding the image.

```sh
docker run -i -t -v $(pwd):/home --rm hello_nerves
```
