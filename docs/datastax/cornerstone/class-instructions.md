When using cornerstone in an in-class environment these steps need to be followed:

### Setup ssh key

Move `classkey.pub` into `keys/`.

### Install AWS Provider

    vagrant plugin install vagrant-aws

### Clear Living Nodes

    vagrant destroy -f

### Start AWS Nodes

Run these commands in a separate terminals to avoid a single command failing
and you having to re-run all commands over again. Also, do be aware that AWS
may rate limit, so don't try provisioning too many instances in parallel.

    vagrant up --provider aws singlenode[0-20]

### Find IP Address

Hand out the following IP addresses, as well as `classkey.pem`, to the students:

    vagrant awsinfo -m singlenode[0-20] -k public_ip

### SSH into Node using Vagrant

    vagrant ssh singlenode[0-20]

### Student SSH Access

    ssh -i /path/to/classkey.pem ubuntu@ip-address
