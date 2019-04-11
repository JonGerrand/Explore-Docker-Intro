FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 \
    python3-pip

RUN pip3 install jupyter

RUN useradd -ms /bin/bash jupyter

USER jupyter

WORKDIR /home/jupyter

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0"]
