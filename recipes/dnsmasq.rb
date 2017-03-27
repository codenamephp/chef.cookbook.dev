include_recipe 'resolver' 

package 'purge avahi-deamon' do
  action :purge
  only_if 'dpkg -l avahi-deamon' 
end

package 'install dnsmasq' do
  package_name 'dnsmasq'
  action :install
  not_if 'dpkg -l dnsmasq' 
end

template 'update dnsmasq config' do
  path '/etc/dnsmasq.conf'
  source 'dnsmasq.conf.erb'
  verify 'dnsmasq --test'
end

service 'dnsmasq' do
  action [:enable, :start]
  supports :reload => false
  subscribes :restart, 'template[update dnsmasq config]', :delayed
  subscribes :restart, 'template[/etc/resolv.conf]', :delayed
end
