service 'httpd stop' do
  service_name 'apache2'
  supports :status => true
  stop_command 'service apache2 stop && sleep 50'
  action :stop
end


execute 'echo' do
  command "echo 'Starting service after 10 seconds delay' "
  action :run
end

service 'apache start' do
  service_name 'apache2'
  supports :status => true
  action :start
end
