# Explore-Docker-Intro

## Overview
Following [today's talk](https://docs.google.com/presentation/d/1BkBVuS_2vu25zMqLlbezFJntudp5o-Uxj35scJlM0bI/edit?usp=sharing) entitled: "Containerisation: An introductory overview", this repo presents minimal material which can be used to gain further practical experience with Docker and containers.
In this regard, a simple dockerfile which can be used to build and run your first Docker container is supplied.

## 1) Installing Docker onto your host machine
The following links provide steps to installing docker upon your personal machine. Please follow the link associated with your **Host OS**:

### Windows
- [Windows Desktop Application](https://docs.docker.com/docker-for-windows/install/) (requires Windows 10)

### Linux
- [CentOS](https://docs.docker.com/v17.12/install/linux/docker-ce/centos/)
- [Debian](https://docs.docker.com/v17.12/install/linux/docker-ce/debian/)
- [Fedora](https://docs.docker.com/v17.12/install/linux/docker-ce/fedora/)
- [Ubuntu](https://docs.docker.com/v17.12/install/linux/docker-ce/ubuntu/)

### Mac OS
- [MacOS Desktop Application](https://docs.docker.com/v17.12/docker-for-mac/install/)

## 2) Building the dockerfile
Once you've successfully installed Docker onto your host machine, clone or download this repository to a location for which you have read/write privelages. Navigate to the root of the repository, and issue the following command*:

```bash
docker build . -t my_first_docker_container:jupyter-server
```

\* **Note:** You will need to run this via the command line in Linux. For MacOS and Windows, this will be done the docker-bash which is accessible via the Docker Desktop Application.  

## 3) Run the container
Having built the dockerfile into an image, we can now proceed to run it:

```bash
docker run -it --rm -p 8888:8888 my_first_docker_container:jupyter-server
```
Hopefully you should now see the standard `jupyter server` output, with instructions directing you to connect to the newly started server.

## 4) Attaching an external volume
Once you've had some fun playing around in your containerised notebook session, close the container and restart it again with the same `run` command as above.

You should notice that none of the work which you've done has persisted. To rectify this situation, instead use the following command when starting up your container, where `<local/dir/to/mount>` is replaced by the (absolute) path to the directory which you want to mount:

```bash
docker run -it --rm -p 8888:8888 -v <local/dir/to/mount>:/home/jupyter my_first_docker_container:jupyter-server
```

Now any work you perform in the container (Jupyter notebook server) will be persisted in the mounted directory on your host machine.

## 5) Homework
Now that you can successfully build and run a Docker container, try and modify your dockerfile by getting it to add `last-nights-supper.jpg` within the container definition. Having done this, you will always have access to limitless leftovers, Horay!!

![last-nights-supper.jpg](https://i1.wp.com/makingmommas.com/wp-content/uploads/2016/04/ranch-pork-chops.jpg?fit=660%2C440&ssl=1)

Note, a hint on how to do this can be found [here](https://gist.github.com/adamveld12/4815792fadf119ef41bd). Happy coding :)
