FROM ruby:2.2
RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list && apt-get update && apt-get install -y git/testing vim git-svn
WORKDIR /root/
CMD ["/bin/bash"]
