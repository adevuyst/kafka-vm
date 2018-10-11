#!/bin/bash

set -e

if [ ! -d /tmp/vagrant-downloads ]; then
    mkdir -p /tmp/vagrant-downloads
fi
chmod a+rw /tmp/vagrant-downloads

if [ -z `which javac` ]; then
    apt-get -y update
    apt-get install -y software-properties-common python-software-properties
    add-apt-repository -y ppa:webupd8team/java
    apt-get -y update

    # Try to share cache. See Vagrantfile for details
    mkdir -p /var/cache/oracle-jdk8-installer
    if [ -e "/tmp/oracle-jdk8-installer-cache/" ]; then
        find /tmp/oracle-jdk8-installer-cache/ -not -empty -exec cp '{}' /var/cache/oracle-jdk8-installer/ \;
    fi

    /bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    apt-get -y install oracle-java8-installer oracle-java8-set-default

    if [ -e "/tmp/oracle-jdk8-installer-cache/" ]; then
        cp -R /var/cache/oracle-jdk8-installer/* /tmp/oracle-jdk8-installer-cache
    fi
fi

chmod a+rw /opt

if [ ! -e /mnt ]; then
    mkdir /mnt
fi
chmod a+rwx /mnt

# Install CP
pushd /opt/
if [ ! -e confluent ]; then
    pushd /tmp/vagrant-downloads
    if [ ! -e confluent-3.0.1-2.11.tar.gz ]; then
        wget http://packages.confluent.io/archive/5.0/confluent-5.0.0-2.11.zip
    fi
    popd

    tar xvzf /tmp/vagrant-downloads/confluent-5.0.0-2.11.zip
fi
ln -s /opt/confluent-5.0.0 /opt/confluent
popd

# Copy .profile and change owner to vagrant
cp /vagrant/.profile /home/vagrant/
chown vagrant:vagrant /home/vagrant/.profile

cp -r /vagrant/etc /mnt/
chown -R vagrant:vagrant /mnt/etc
mkdir -p /mnt/logs
chown -R vagrant:vagrant /mnt/logs

cp /vagrant/setup.sh /home/vagrant
chown vagrant:vagrant /home/vagrant/setup.sh
chmod +x /home/vagrant/setup.sh

cp /vagrant/start.sh /home/vagrant
chown vagrant:vagrant /home/vagrant/start.sh
chmod +x /home/vagrant/start.sh

cp /vagrant/clean_up.sh /home/vagrant
chown vagrant:vagrant /home/vagrant/clean_up.sh
chmod +x /home/vagrant/clean_up.sh
