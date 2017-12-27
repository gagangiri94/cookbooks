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
