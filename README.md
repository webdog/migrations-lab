## Docker Image for running *Migrating to GitHub Enterprise* lab

#### create Dockerfile
copy `Dockerfile` to your machine or create an empty `Dockerfile` and copy the following into the file >

```bash
FROM ruby:2.2
RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list && apt-get update && apt-get install -y git/testing vim git-svn
WORKDIR /root/
CMD ["/bin/bash"]
```

#### Build Container Image

perform a `docker build` against the `Docker file` to create a locally cached image

```bash
# run command from the directory where the Dockerfile resides
docker build -t ghe-migration-lab .

# output
Sending build context to Docker daemon 2.048 kB
Step 1 : FROM ruby:2.2
 ---> e5512053c1ef
Step 2 : RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list && apt-get update && apt-get install -y git/testing vim git-svn
 ---> Running in a8af7803ce1b
Get:1 http://security.debian.org jessie/updates InRelease [63.1 kB]
Get:2 http://ftp.us.debian.org testing InRelease [251 kB]
Ign http://httpredir.debian.org jessie InRelease
...
Removing intermediate container 8052fc39eb39
Step 4 : CMD /bin/bash
 ---> Running in aab7986a984a
 ---> 42a744f21d38
Removing intermediate container aab7986a984a
Successfully built 42a744f21d38
```

#### Run Container
create and then attach to container to run the lab

```bash
# create the container
docker run -itd --name lab ghe-migration-lab

# attach to the container
docker exec -it lab /bin/bash
```
