# HelloNerves

My first [Built with Nerves](http://nerves-project.org) project running on [Andre's](https://github.com/mcandy007) Raspberry Pi he has given me a long time
ago.

## Goals

My goals for this project are:

- [x] Build and run an OTP application on the Raspberry Pi.
- [x] Start communication via Morse code.
- [ ] Enable the network interface.
- [ ] Provide some form of communication via LAN. Maybe `iex` over LAN?

## Things I've learned so far

- SD cards are crap. Even from brands like Kingston. For hours I was wondering
why my code wasn't working which was very cumbersome without a display connected
to the Raspberry Pi. Sometimes even the included examples failed to run.
Switching to my SanDisk SD card fixed all these problems.

- Apparently OS’es are compensating lots of the above mentioned problems. All
of the SD cards I have are working correctly with macOS.

- Testing (as far as possible) is better done on a Linux system. I still receive
errors, however more files and devices are at their expected places. I switched
therefore to Docker for testing (and it's never bad to refresh the Docker
knowledge).

- Did I say SD cards are crap? The SanDisk microSDHC stopped working too.
Bought a new SanDisk card, looks promising right now.

- Debugging without a monitor is a pain in the butt, probably due to the faulty
SD cards. Bought a small display as I didn't have any HDMI enabled one or TV
lying around. Even with a monitor it is hard if you try to work with a German
keyboard layout, so I ordered a keyboard with a US layout as well. This
playground is getting expensive, just look at the list below.

## Requirements

- [SD card](https://www.amazon.de/gp/product/B014IX02KC)
- [Display](https://www.amazon.de/gp/product/B0716PPC2N)
(It looks like they updated it, I got the previous one.)
- [Keyboard with US Layout](https://www.amazon.de/gp/product/B002BOUA6M)

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
