package node['efs']['nfs-package']

directory '/efs' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
