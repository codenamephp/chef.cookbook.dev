include_recipe 'resolver'

package 'purge avahi-deamon' do
  action :purge
end

package 'install dnsmasq' do
  package_name 'dnsmasq'
end

template 'update dnsmasq config' do
  path '/etc/dnsmasq.conf'
  source 'dnsmasq.conf.erb'
  verify 'dnsmasq --test'
end

service 'dnsmasq' do
  action %i[enable start]
  supports reload: false
  subscribes :restart, 'template[update dnsmasq config]', :delayed
  subscribes :restart, 'template[/etc/resolv.conf]', :delayed
end