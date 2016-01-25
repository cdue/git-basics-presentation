# git-basics-presentation

A presentation about Git basics - including a slideshow created with reveal.js and a storyboard for a little live coding session.
Everything is **Dockerized** so don't worry about installing [reveal.js](http://lab.hakim.se/reveal-js), we are just using it in order to modify this slideshow during a live coding session, and see what happen.

### Table of content
- [Installation](#installation): step-by-step instruction to getting this presentation running on your computer.
- [Storyboard](#storyboard): see what this presentation is about and how the coding session goes.

## Installation

1. Clone this repository
```sh
$ git clone https://github.com/cdue/git-basics-presentation.git
```
For windows users using docker-machine (not for those using docker inside a Linux based VM) :
Take care to clone this repository in your Windows User directory (example: /c/Users/[username]/my_projects/), otherwise the project directory won't be available as a mounted volume in the reveal.js docker container, which won't allow you to see live what you are modifying (too bad for a live coding session...).

Note: for windows users (using docker-machine), no need to use 'sudo' in the following commands.

2. Get the Docker image :
* easy way:
```sh
$ sudo docker pull cdue/revealjs:latest
```

* or a bit more complicated (build it from the given DockerFile):
```sh
$ sudo docker build -t "cdue/revealjs:latest" .
```

3. Run the Docker container
```
$ docker run -d -v $(pwd):/slides/ -p 8000:8000 "cdue/revealjs:latest"
```
This will also mount a volume (/slides/) on your container so that reveal.js can use the content of current directory.

Note: Windows user may add a '/' before $(pwd)

4. Verify installation
Now that you ran the reveal.js container, you should be able to load the slideshow in your web browser.

If your OS is Linux based, you can access your slides at :
http://127.0.0.1:8000

But if your running Windows, you need to get the docker-machine VM IP with:
```sh
$ docker-machine ip [your VM: default / my-default / ...]
```
and then use it:
for example:
http://192.168.59.103:8000

If you don't know your VM name, use:
```sh
$ docker-machine ls
```
5. Command line access to your container
If for any reason you need to access you reveal.js container, just follow these steps:
- retreive your container ID or name using:
```sh
$ docker ps -a
```
- and then run a bash on it with:
```sh
$ sudo docker exec -i -t [id or name] bash
```

## Presentation

### Speaker notes
If you used the provided DockerFile then you're running reveal.js on a local web server, which mean you can use the Speaker notes mode.
Press 'S' key on your keyboard and you'll get another browser window containing the slide you're presenting, a preview of next slide, a timer, and (wait for it...) you speaker notes!

### Storyboard
