FROM alpine:latest
MAINTAINER Tin Lai <oscar@tinyiu.com>

# NOTE: openssh is only required for testing connection to built docker using the built mosh-server
RUN apk update \
	&& apk add alpine-sdk autoconf automake protobuf-dev ncurses ncurses-dev ncurses-static libutempter-dev zlib-static openssl-libs-static openssl-dev
#RUN	apk add openssh 

#RUN git clone https://github.com/mobile-shell/mosh.git \
#	&& cd mosh \
#	&& ./autogen.sh \
#	&& LDFLAGS="-static" ./configure --prefix=/usr \
#	&& make \
#	&& make install \
#	&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
#	&& ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
#	&& adduser -D mosh \
#	&& echo 'mosh:m0sh-st@t1c' | chpasswd

RUN wget https://mosh.org/mosh-1.3.2.tar.gz \
  && tar xvf mosh-1.3.2.tar.gz \
	&& cd mosh-1.3.2 \
	&& LDFLAGS="-static" ./configure --prefix=/usr \
	&& make \
	&& make install
#	&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
#	&& ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
#	&& adduser -D mosh \
#	&& echo 'mosh:m0sh-st@t1c' | chpasswd

#EXPOSE 22

ENTRYPOINT sh
#ENTRYPOINT /usr/sbin/sshd \
#	&& sh
