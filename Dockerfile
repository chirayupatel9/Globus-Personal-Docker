FROM ubuntu:noble

RUN apt-get update && apt-get install -y x11-apps


CMD ["xeyes"]

###

#docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw"  xeyes
