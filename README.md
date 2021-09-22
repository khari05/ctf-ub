## CTF UB
This is my Ubuntu image for cybersecurity CTF competitions. I plan to update this as the season progresses.

## Configuration

### Setup

Install [Docker Desktop](https://www.docker.com/products/docker-desktop) ~~(obviously)~~

Download the image with docker pull.
```bash
$ docker pull khari05/ctf-ub
```
### Run with Docker
`--rm` makes the container auto remove on exit

`-i` keeps the image open when no process is running

`-t` opens the shell

`-v` maps volumes
```bash
$ docker run --rm -it -v <path-to-your-shared-dir>:/stuff khari05/ctf-ub bash
```

### Run with Docker Compose

Create a `docker-compose.yml` using the image.
```yaml
version: '3'

services:
  vm:
    image: khari05/ctf-ub:latest
    volumes:
      - '<path-to-your-shared-directory>:/stuff'
```
With Docker, the user can map as many volumes as they want. Make sure to map your directory to `/stuff` inside of the container since the Docker image drops the user into the `/stuff` directory upon launch.

#### Launch

After configuring the image, it can be run by opening the directory in terminal then opening the service's bash shell.
```bash
$ docker-compose run vm bash
```