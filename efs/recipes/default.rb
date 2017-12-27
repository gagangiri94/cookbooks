
package node['efs']['nfs-package']

package 'nfs-utils'

directory '/efs' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

mount_efs '/efs'  do
  fsid 'fs-938b8fda'
  options ['rsize=1048576', 'wsize=1048576', 'hard', 'timeo=600', 'retrans=2']
end

#node['efs']['mounts'].each do |mount_point, attribs|
#  mount_efs mount_point do
#    fsid attribs['fsid']
#    options attribs['options']
#    action :mount
#  end
#end

#ruby_block 'remove unspecified efs mounts' do
#  only_if { node['efs']['remove_unspecified_mounts'] }
#  block do
#    EFS::Mount.remove_unspecified_mounts(node['efs']['mounts'], run_context)
#  end
#end
