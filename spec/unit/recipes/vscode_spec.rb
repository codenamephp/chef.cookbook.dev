#
# Cookbook:: codenamephp_dev
# Spec:: vscode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev::vscode' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds vscode apt repo' do
      expect(chef_run).to add_apt_repository('vscode')
    end

    it 'installs vscode' do
      expect(chef_run).to install_package('Install vscode')
    end
  end
end
