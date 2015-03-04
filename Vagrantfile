VAGRANTFILE_API_VERSION = '2'

# max number of dse nodes this script will generate
MAX_DSE_NODES = 3

# Ubuntu 14.04 LTS
# http://cloud-images.ubuntu.com/locator/ec2/
# "trusty instance-store amd64 aki"
ami_list = {
    'ap-northeast-1' => 'ami-40e1e641',
    'ap-southeast-1' => 'ami-07597455',
    'ap-southeast-2' => 'ami-39086103',
    'eu-west-1' => 'ami-5a4bfb2d',
    'eu-central-1' => 'ami-d21223cf',
    'sa-east-1' => 'ami-798f3e64',
    'us-east-1' => 'ami-92f569fa',
    'us-west-1' => 'ami-71150534',
    'us-west-2' => 'ami-8b84d0bb'
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # disable default synced folder for all machines
    config.vm.synced_folder '.', '/vagrant', disabled: true

    # define the a single-machine setup machine
    config.vm.define 'supernode', autostart: false do |dev|

        # define virtualbox dev machine
        dev.vm.provider :virtualbox do |vb, override|

            # sync this project folder to /cornerstone on the guest machine
            override.vm.synced_folder '.', '/cornerstone', create: true

            # sync this ./cache folder to /cache on the guest machine
            override.vm.synced_folder 'cache', '/cache', create: true

            # set the machine's image and network options
            override.vm.box = 'ubuntu/trusty64'
            override.vm.network :private_network, ip: '192.168.101.7'

            # set the machine's memory and cpu utilization
            vb.memory = 3072
            vb.cpus = 3

            # provision machine
            override.vm.provision :shell, path: 'vagrant/install-jdk8_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/bootstrap-dev-environment_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/install-datastax-enterprise_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/install-bower_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/start-datastax-enterprise_v1.sh',
                                          privileged: false
            # override.vm.provision :shell, path: 'vagrant/install-cornerstone.sh',
            #                               privileged: false
            # override.vm.provision :shell, path: 'vagrant/start-cornerstone.sh',
            #                               privileged: false
        end
    end

    # define the dev machine
    config.vm.define 'dev', autostart: false do |dev|

        # define virtualbox dev machine
        dev.vm.provider :virtualbox do |vb, override|

            # sync this project folder to /cornerstone on the guest machine
            override.vm.synced_folder '.', '/cornerstone', create: true

            # sync this ./cache folder to /cache on the guest machine
            override.vm.synced_folder 'cache', '/cache', create: true

            # set the machine's image and network options
            override.vm.box = 'ubuntu/trusty64'
            override.vm.network :private_network, ip: '192.168.101.9'

            # set the machine's memory and cpu utilization
            vb.memory = 1024
            vb.cpus = 2

            # provision machine
            override.vm.provision :shell, path: 'vagrant/install-jdk8_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/bootstrap-dev-environment_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/install-datastax-enterprise_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/install-bower_v1.sh',
                                          privileged: false
            # override.vm.provision :shell, path: 'vagrant/install-cornerstone.sh',
            #                               privileged: false
            # override.vm.provision :shell, path: 'vagrant/start-cornerstone.sh',
            #                               privileged: false
        end
    end

    # define MAX_DSE_NODES dse machines
    (0..MAX_DSE_NODES).each do |i|
        config.vm.define "dse#{i}" do |dse|

            # define virtualbox dse machines
            dse.vm.provider :virtualbox do |vb, override|

                # sync this ./cache folder to /cache on the guest machine
                override.vm.synced_folder 'cache', '/cache', create: true

                # set the machine's image and network options
                override.vm.box = 'ubuntu/trusty64'
                override.vm.network :private_network, ip: "192.168.101.#{i+10}"

                # set the machine's memory and cpu utilization
                vb.memory = 3072
                vb.cpus = 2

                # install and start dse
                override.vm.provision :shell,
                                      path: 'vagrant/install-datastax-enterprise_v1.sh',
                                      args: ["192.168.101.#{i+10}",
                                             "192.168.101.10,192.168.101.11,192.168.101.12"]
                override.vm.provision :shell,
                                      path: 'vagrant/start-datastax-enterprise_v1.sh',
                                      args: ["192.168.101.#{i+10}", "192.168.101.8"]
            end

            dse.vm.provider :aws do |aws, override|

                # set the machine's image and the default username for the machine
                override.vm.box = 'aws-dummy'
                override.ssh.username = 'ubuntu'

                # setup basic aws configurations
                aws.access_key_id = ENV['DEMO_AWS_ACCESS_KEY']
                aws.secret_access_key = ENV['DEMO_AWS_SECRET_KEY']
                aws.region = ENV['DEMO_AWS_REGION']
                aws.availability_zone = ENV['DEMO_AWS_AZ']
                aws.ami = ami_list[aws.region]
                aws.instance_type = 'm3.medium'

                # setup keypair configuration
                aws.keypair_name = ENV['DEMO_KEYPAIR_NAME']
                override.ssh.private_key_path = ENV['DEMO_KEYPAIR_LOCATION']

                # setup security groups
                aws.security_groups = [ENV['DEMO_SECURITY_GROUP']]

                # setup AWS Tags
                aws.tags = {
                    'Name' => 'vagrant',
                    'Owner' => ENV['DEMO_USER'],
                    'Email' => ENV['DEMO_EMAIL']
                }

                # place the docker credentials
                override.vm.provision :file,
                                      source: 'keys/.dockercfg',
                                      destination: '~/.dockercfg'
                override.vm.provision :shell,
                                      inline: 'sudo mv ~/.dockercfg /root',
                                      privileged: false

                # prepare the /mnt directories
                override.vm.provision :shell,
                                      path: 'vagrant/create-mnt-directories_v1.sh'

                # download the dse container
                override.vm.provision :docker,
                    images: ['datastaxdemos/datastax-enterprise']

                # run the dse container when $CMD is set
                if ENV['CMD'] && ENV['CMD'].length > 0
                    override.vm.provision :docker do |d|

                        # --net host: will use the host's network interface
                        # --volume <host-directory>:<guest-directory>:
                        # provides persistent storage for dse data and logs
                        d.run 'datastaxdemos/datastax-enterprise',
                            cmd: ENV['CMD'],
                            args: '--net host'\
                                  ' --volume /mnt/lib/cassandra:/var/lib/cassandra'\
                                  ' --volume /mnt/log/cassandra:/var/log/cassandra'
                    end
                end
            end
        end
    end

    config.vm.define "opscenter" do |opscenter|
        # define virtualbox dev machine
        opscenter.vm.provider :virtualbox do |vb, override|

            # sync this ./cache folder to /cache on the guest machine
            override.vm.synced_folder 'cache', '/cache', create: true

            # set the machine's image and network options
            override.vm.box = 'ubuntu/trusty64'
            override.vm.network :private_network, ip: '192.168.101.8'

            # set the machine's memory and cpu utilization
            vb.memory = 768
            vb.cpus = 1

            # provision machine
            override.vm.provision :shell, path: 'vagrant/install-opscenter_v1.sh',
                                          privileged: false
            override.vm.provision :shell, path: 'vagrant/start-opscenter_v1.sh',
                                          args: ['192.168.101.10,192.168.101.11,192.168.101.12'],
                                          privileged: false

            override.vm.post_up_message = <<-eos
                Visit:
                    http://192.168.101.8:8888 for OpsCenter
            eos
        end
    end
end
