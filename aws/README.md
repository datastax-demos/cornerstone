# Installer AWS Provider

    vagrant plugin install vagrant-aws

# Clear Living Nodes

    vagrant destroy -f

# Start AWS Nodes

    vagrant up --provider aws dev0
    
# Find IP Address

    vagrant awsinfo -m dev0 -k public_ip

# SSH into Node

    vagrant ssh dev0
