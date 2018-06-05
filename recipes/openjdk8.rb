package 'Install openjdk8' do
  package_name 'openjdk-8-jdk'
  notifies :run, 'execute[Set java alternatives]', :immediately
end

execute 'Set java alternatives' do
  action :nothing
  command 'sudo update-java-alternatives --set java-1.8.0-openjdk-amd64'
end
