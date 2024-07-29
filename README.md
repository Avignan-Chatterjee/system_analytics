# setups
## Various virtual setup configurations

Download vagrant from:
https://developer.hashicorp.com/vagrant/install

Do a binary download if required.

## Install libvirt plugin for vagrant.
vagrant plugin install vagrant-libvirt

## Install vagrant boxes.
List of boxes with libvirt provider can be found here
https://app.vagrantup.com/boxes/search?provider=libvirt

```js
vagrant box add generic/ubuntu1804 --provider=libvirt
vagrant box add bento/ubuntu-24.04 --provider=libvirt
```

## Start virtual setup using vagrant.
### On newly created directory:

```js
mkdir setup1
Vagrant init
```

Edit Vagrantfile and update the following to one of the downloaded box imgaes, like this.
    config.vm.box = "bento/ubuntu-24.04"

```js
Vagrant up
Vagrant ssh
```