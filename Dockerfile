FROM ubuntu:16.04
LABEL maintainer="IDgis bv"

COPY cleanup.sh /

RUN apt-get update && \
    apt-get install -y bzip2 bsdtar build-essential curl git python && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get --purge autoremove -y && \
    apt-get clean

# Install Meteor
RUN (curl https://install.meteor.com/?release=1.7.0.5| sh)

# Install Node
RUN bash -c 'curl "https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.gz" > /tmp/required-node-linux-x64.tar.gz' \
  && cd /usr/local \
  && tar --strip-components 1 -xzf /tmp/required-node-linux-x64.tar.gz \
  && rm /tmp/required-node-linux-x64.tar.gz

# Create the meteor user
RUN useradd -M --uid 3000 --shell /bin/false meteor

# Expose default port 3000
EXPOSE 3000
ENV PORT 3000
