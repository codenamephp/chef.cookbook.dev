apt_repository 'jessie-backports' do
  uri        'http://http.debian.net/debian'
  repo_name 'jessie-backports'
  distribution 'jessie-backports'
  components ['main']
  not_if 'dpkg -l openjdk-8-jdk'
  notifies :install, 'package[Install openjdk 8]', :immediately
end

package 'Install openjdk 8' do
  action :nothing
  package_name 'openjdk-8-jdk'
  options '-t jessie-backports'
  notifies :run, 'execute[Set java alternatives]', :immediately
end

execute "Set java alternatives" do
  action :nothing
  command "sudo update-java-alternatives --set java-1.8.0-openjdk-amd64"
end