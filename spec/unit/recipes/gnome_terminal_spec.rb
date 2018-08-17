#
# Cookbook:: codenamephp_dev
# Spec:: gnome_terminal
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev::gnome_terminal' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end
    let(:service) { chef_run.service('dnsmasq') }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs gnome-terminal form package' do
      expect(chef_run).to install_package('gnome-terminal')
    end
  end
end
