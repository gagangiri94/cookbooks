package 'httpd' do
  action :install
end

service 'httpd' do
  supports :status => true
  action [:enable, :start]
end
