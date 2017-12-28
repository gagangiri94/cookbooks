package 'nfs' do
  package_name node['efs']['nfs-package']
  action :install
end

directory '/efs' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
execute 'efs_mount' do
  command 'sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-f54b4cbc.efs.us-east-1.amazonaws.com:/ /efs'
end
