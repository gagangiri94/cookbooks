execute 'apt update' do
  command 'apt-get update'
  action :run
end

package 'nfs-kernel-server' do
	action :install
end	

directory '/nfs' do
  owner 'nobody'
  group 'nogroup'
  action :create
end 

cookbook_file '/tmp/exports' do
  source 'exports'
end

bash 'append_to_exportfile' do
 user 'root'
 code <<-EOH
 cat /tmp/exports >> /etc/exports
 rm /tmp/exports
 EOH
 not_if 'grep -q \'/nfs\' /etc/exports'
end


execute 'restart nfs' do
  command 'service nfs-kernel-server restart'
  action :run
end
