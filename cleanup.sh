#!/bin/bash

# Run this script from the child Dockerfile to un-install the programs needed to build Meteor app and install npm packages
apt-get remove --purge -y bzip2 bsdtar build-essential curl git python && apt-get --purge autoremove -y && apt-get clean
