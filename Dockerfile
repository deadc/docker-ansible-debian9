FROM debian:9

RUN apt-get update
RUN apt-get -y install sudo systemd python-pip python-dev curl && apt-get clean
RUN pip install --upgrade pip
RUN pip install --upgrade PyOpenSSL cryptography ansible
RUN curl -fsSL https://goss.rocks/install | sh

# fix "mesg: ttyname failed: Inappropriate ioctl for device" warning
RUN cp /etc/profile /root/.profile

WORKDIR /ansible

CMD ["/lib/systemd/systemd"]
