Capstone project

# Vagrant

## VirtualBox

```bash
vagrant up dse0 dse1 dse2 dev
```

## AWS

```bash
unset $CMD
vagrant up --provider=aws dse0 dse1 dse2
DSE0=$(vagrant awsinfo -m dse0 -k private_ip)
DSE1=$(vagrant awsinfo -m dse1 -k private_ip)
DSE2=$(vagrant awsinfo -m dse2 -k private_ip)

export CMD="--spark --seeds ${DSE0},${DSE1},${DSE2}"
vagrant provision dse0 dse1 dse2
```
