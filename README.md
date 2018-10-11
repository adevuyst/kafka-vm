# kafkademo

## Libraries

## Local Kafka Cluster
To setup a local kafka cluster we are going to use Vagrant and Virtual box and an image.
### Installing Vagrant
1st make sure vagrant is installed by following the link [here](https://www.vagrantup.com/downloads.html) or if you are using MacOsx you can use brew to install
```bash
brew cask install vagrant
```
### Installing VirtualBox and Extensions
```bash
brew cask install virtualbox
brew cask isntall virtualbox-extension-pack
```
### Create an Kafka Virtual Machine 
#### Create a Kafka VM Directory
Vagrant requires each virtual machine to have its own working directory. You can create the working directory anywhere, but for new users, we recommend the following:
```bash
mkdir ~/kafka-vm && cd ~/kafka-vm
```
#### Initialize the Kafka Virtual Machine
To initialize the virtual machine, enter the following at the command prompt:
```bash
vagrant init aerospike/aerospike-ce
```
The image will be downloaded from Vagrant Cloud.
