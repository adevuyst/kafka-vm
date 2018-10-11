# kafka-vm

## Local Kafka Cluster
To setup a local kafka cluster we are going to use Vagrant and Virtual box and an image.
### Installing Vagrant
1st make sure vagrant is installed by following the link [here](https://www.vagrantup.com/downloads.html) or if you are using MacOsx you can use brew to install
```bash
$ brew cask install vagrant
```
### Installing VirtualBox and Extensions
```bash
$ brew cask install virtualbox
$ brew cask isntall virtualbox-extension-pack
```
### Create a Kafka Virtual Machine and Initialize
Vagrant requires each virtual machine to have its own working directory. You can create the working directory anywhere, but for new users, we recommend doing this in your user folder.  This can be accomplished by just cloning the repo:
```bash
$ cd ~/
$ git clone https://github.com/adevuyst/kafka-vm.git
```
After you have pulled down the vagrant files you can start your Kafka VM:
```bash 
$ cd kafka-vm
$ vagrant up
```
### Verifying The Kafka Setup and Interacting with Vagrant
SSH Into your vm
```bash
$ vagrant ssh 
```
Verify that ZooKeeper is running, then hit Ctrl C:
```bash
$ telnet localhost 2181 
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
^CConnection closed by foreign host.
```
Verify that the Kafka test-topic exists and the broker is running: 
```bash
$ kafka-topics --list --zookeeper localhost:2181
__confluent.support.metrics
_schemas
test-topic 
```
### What's Next?
You are ready to do local development against your local Kafka install and schema repository.