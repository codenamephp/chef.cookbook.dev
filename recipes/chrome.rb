include_recipe 'chef.cookbook.dev::gdebi'

remote_file 'Get package from google' do
  action :nothing
  path '/tmp/google-chrome-stable.deb'
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  not_if "dpkg -l google-chrome-stable"
  subscribes :create, 'package[add gdebi package]', :immediately
  notifies :run, 'execute[add chrome from package]', :immediately
end

execute 'add chrome from package' do
  command 'sudo gdebi --n /tmp/google-chrome-stable.deb'
  action :nothing
  notifies :delete, 'file[Delete package download]', :immediately
end

file 'Delete package download' do
  action :nothing
  path '/tmp/google-chrome-stable.deb'
  backup false
  only_if { ::File.exist?('/tmp/google-chrome-stable.deb') }
end