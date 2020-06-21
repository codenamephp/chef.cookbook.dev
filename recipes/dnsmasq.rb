# frozen_string_literal: true

log 'This recipe is deprecated and will be removed without replacement. Have a look at the chef cookbook instead.' do
  level :warn
end

include_recipe 'resolver'

package 'purge avahi-deamon' do
  action :purge
end

package 'install dnsmasq' do
  package_name 'dnsmasq'
end

template 'update dnsmasq local config' do
  path '/etc/dnsmasq.d/local'
  source 'dnsmasq/local.erb'
  verify 'dnsmasq --test'
end

service 'dnsmasq' do
  action %i[enable start]
  supports reload: false
  subscribes :restart, 'template[update dnsmasq local config]', :delayed
  subscribes :restart, 'template[/etc/resolv.conf]', :delayed
end
