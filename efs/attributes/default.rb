default['efs']['rsize'] = 1_048_576
default['efs']['wsize'] = 1_048_576
default['efs']['behavior'] = 'hard'
default['efs']['timeout'] = 600
default['efs']['retrans'] = 2
default['efs']['mounts'] = { "/efs" =>  { "fsid" => "fs-f54b4cbc" }
}



default['efs']['remove_unspecified_mounts'] = false

default['efs']['nfs-package'] = case node['platform']
                                when 'ubuntu', 'debian'
                                  'nfs-common'
                                when 'redhat'
                                  'nfs-utils'
                                end
