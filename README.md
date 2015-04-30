# Cornerstone

The Cornerstone project was developed out of the need for streamlining
the development process using DataStax Enterprise for demos, proof of concepts,
and standalone applications.


## Prerequisites

### Vagrant

Vagrant can be downloaded here:
https://www.vagrantup.com/downloads.html

Vagrant will be used to orchestrate launching machines in all supported platforms.

#### Vagrant AWS Provider Plugin

In order to get AWS support through Vagrant, the following commands must be run:

    vagrant plugin install vagrant-aws
    vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

#### Vagrant Azure Provider Plugin

In order to get Azure support through Vagrant, the following commands must be run:

    vagrant plugin install vagrant-azure
    vagrant box add azure https://github.com/msopentech/vagrant-azure/raw/master/dummy.box

### VirtualBox

VirtualBox can be downloaded here:
https://www.virtualbox.org/wiki/Downloads

VirtualBox will be the main virtual machine provider of the Cornerstone project.
This will enable free orchestration across all platforms for all users.

## Setup

`set_credentials.sh.template` must be copied and configured using the filename
`set_credentials.sh` within Cornerstone's base directory.

## Starting a Demo

Any demo can be started locally by running the appropriate file located in the
`run/` directory.

To start the base Cornerstone project, run:

    ./run/datastax/cornerstone/run

**Note**: In some setups, VirtualBox's main application must be closed in order to
complete a successful launch.

## Interacting with a Demo

The last message of a successful run of the Cornerstone project will look similar
to this:

    ==> singlenode: Machine 'singlenode' has a post `vagrant up` message. This is a message
    ==> singlenode: from the creator of the Vagrantfile, and not from Vagrant itself:
    ==> singlenode:
    ==> singlenode:                 Visit:
    ==> singlenode:                     http://192.168.101.7:5000 for Cornerstone

Following the mentioned URLs will allow access to the web interface.

Running the following command will allow access to the development machine:

    vagrant ssh singlenode

### Important Paths

The base directory of the Cornerstone project, `.`, on the host machine will
always be mapped to the `/cornerstone` directory on the guest VM.

The `cache/` directory within the base directory of the Cornerstone project on
the host machine will also be mapped to the `/cache` directory on the guest VM.

This functionality is provided by Vagrant's
[synced folders](http://docs.vagrantup.com/v2/synced-folders/basic_usage.html)
which allows local changes on the host machine to automatically be replicated to
the guest VM.

#### Caveats with Synced Folders

When running in the cloud, synced folders will be disabled and git clones of the
Cornerstone repo will be used.

If the existing cache becomes a problem, deleting the entire `cache/` directory
will force a full download on the next `vagrant up` command.

## Destroying a Demo

To destroy all machines launched from the current directory, run:

    vagrant destroy -f [machine-name]

## Contributing

To contribute to the Cornerstone project, or to fork the
Cornerstone project for other projects, take a look at the documentation
provided in the [contributing guide](CONTRIBUTING.md) and the
[documentation](docs/datastax/cornerstone) directory.
