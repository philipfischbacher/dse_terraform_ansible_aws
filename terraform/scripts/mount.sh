#!/bin/sh
mkfs -t xfs /dev/xvdf
mkdir -p /data
echo '/dev/xvdf  /data  xfs  defaults,nofail 0 0' >> /etc/fstab
mount -t xfs /dev/xvdf /data
