#
# Cookbook:: codenamephp_dev
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev::dnsmasq' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end
    let(:service) { chef_run.service('dnsmasq') }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'purges avahi-deamon' do
      expect(chef_run).to purge_package('purge avahi-deamon')
    end

    it 'installs dnsmasq' do
      expect(chef_run).to install_package('install dnsmasq')
    end

    it 'updates the dnsmasq config' do
      expect(chef_run).to create_template('update dnsmasq local config').with(
        path:   '/etc/dnsmasq.d/local',
        source:  'dnsmasq/local.erb',
        # verify: 'dnsmasq --test' # verify does not seem to be supported in rspec
      )
    end

    it 'starts and enables the dnsmasq service' do
      expect(chef_run).to start_service('dnsmasq')
      expect(chef_run).to enable_service('dnsmasq')
    end

    it 'delayed restarts the service when the template or reslv.conf changes' do
      expect(service).to subscribe_to('template[update dnsmasq local config]').on(:restart).delayed
      expect(service).to subscribe_to('template[/etc/resolv.conf]').on(:restart).delayed
    end
  end
end
