#
# Cookbook:: chef.cookbook.dev
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef.cookbook.dev::chrome' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'adds google apt repo' do
      expect(chef_run).to add_apt_repository('google-chrome')
    end

    it 'installs google chrome' do
      expect(chef_run).to install_package('Install google chrome')
    end
  end
end
