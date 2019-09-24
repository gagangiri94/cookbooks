service 'apache stop' do
  case node['platform']
  when 'redhat', 'centos', 'scientific', 'fedora', 'amazon'
    service_name 'httpd'
  when 'debian', 'ubuntu', 'suse'
    service_name 'apache2'
  end
  supports :status => true
  stop_command 'service apache2 stop && sleep 10'
  action :stop
end


# service 'httpd stop' do
#   service_name 'apache2'
#   supports :status => true
#   stop_command 'service apache2 stop && sleep 50'
#   action :stop
# end


execute 'echo' do
  command "echo 'Starting service after 10 seconds delay' "
  action :run
end
#
# service 'apache start' do
#   service_name 'apache2'
#   supports :status => true
#   action :start
# end

service 'apache start' do
  case node['platform']
  when 'redhat', 'centos', 'scientific', 'fedora', 'amazon'
    service_name 'httpd'
  when 'debian', 'ubuntu', 'suse'
    service_name 'apache2'
  end
  supports :status => true
  #start_command 'service apache2 stop && sleep 10'
  action :start
end
