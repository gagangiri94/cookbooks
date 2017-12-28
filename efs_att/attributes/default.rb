default['efs']['nfs-package'] = case node['platform']
                                when 'ubuntu', 'debian'
                                  'nfs-common'
                                when 'redhat'
                                  'nfs-utils'
                                end
