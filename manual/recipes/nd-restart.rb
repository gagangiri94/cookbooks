service 'apache stop' do
  case node['platform']
  when 'redhat', 'centos', 'scientific', 'fedora', 'amazon'
    service_name 'httpd'
  when 'debian', 'ubuntu', 'suse'
    service_name 'apache2'
  end
  supports :status => true
  action :stop
end

execute 'message' do
  command "echo 'Waiting 10 seconds after service stop' "
  action :run
end

execute 'sleep' do
  command 'sleep 10'
  action :run
end

execute 'start message' do
  command "echo 'Starting service' "
  action :run
end


service 'apache start' do
  case node['platform']
  when 'redhat', 'centos', 'scientific', 'fedora', 'amazon'
    service_name 'httpd'
  when 'debian', 'ubuntu', 'suse'
    service_name 'apache2'
  end
  supports :status => true

  action :start
end
