#package 'Install NFS' do
#  case node[:platform]
#  when 'redhat', 'centos'
#    package_name 'nfs-utils'
#  when 'ubuntu', 'debian'
#    package_name 'nfs-common'
#  end
#end
package 'nfs-utils'

az = node['ec2']['placement_availability_zone']
region = az[0..-2] # trim last char
file_system_id = 'fs-f54b4cbc'
efs_uri = "#{file_system_id}.efs.#{region}.amazonaws.com:/" 

directory '/efs' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

mount '/efs' do
	device efs_uri
    fstype 'nfs4'
	options 'nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2'
	action [:mount, :enable]
end
