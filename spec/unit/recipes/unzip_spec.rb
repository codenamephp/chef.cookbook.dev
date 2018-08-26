#
# Cookbook:: .
# Spec:: unzip
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev::unzip' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs unzip' do
      expect(chef_run).to install_package('unzip')
    end
  end
end
