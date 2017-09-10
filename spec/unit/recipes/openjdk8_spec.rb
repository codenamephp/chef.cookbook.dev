#
# Cookbook:: chef.cookbook.dev
# Spec:: openjdk8
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef.cookbook.dev::openjdk8' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'installs openjdk8' do
      expect(chef_run).to install_package('Install openjdk8')
    end
    
    it 'install notifies command to set jdk as alternative' do
      expect(chef_run.package('Install openjdk8')).to notify('execute[Set java alternatives]').to(:run).immediately
    end
  end
end
