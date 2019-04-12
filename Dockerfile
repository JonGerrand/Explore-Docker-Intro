# Import the base OS used for the container. Here we choose a linux IS
# known as Ubuntu. We use the 'latest' tag here to get the newest release
# of the OS. Note that in many cases we will actually want to choose a specific
# version (eg. "16.04") in order to provide a fixed enviroment for our
# dependencies.
FROM ubuntu:latest

# These commands install python and the associated PyPi (pip)
# package manager into our container.
RUN apt-get update && apt-get install -y python3 \
    python3-pip

# We now use pip to install Jupyter server into the container. Note that each
# command within the dockerfile is executed sequentially, and as such, ordering
# of the commands we issue matters.
RUN pip3 install jupyter

# We now create the default user for the container. We call the user 'jupyter'
# and use the '-ms' flag to create a home dir for this user.
RUN useradd -ms /bin/bash jupyter

# We now assiciate the default user of the container as the user account
# we've just created.
USER jupyter

# We set the default working directory of our container. Unless specified
# through a command, all work we perform will take place within this folder.
# Remember, however, that this is in fact a temporary directory, and a
# directory from the host OS needs to be mounted here in order to persist and
# files we create/modify.
WORKDIR /home/jupyter

# As a final command, we tell the container to run
# "jupyter notebook --ip=0.0.0.0"  whenever it is started up from its parent
# image. The "--ip=0.0.0.0" flag tells the notebook server to bind to all
# available network addresses within the container. 
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0"]
