# frozen_string_literal: true

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

    it 'installs vscode using the resource' do
      expect(chef_run).to install_sc_vscode_installer('install vscode')
    end
  end

  context 'When users and extensions are set' do
    default_attributes['codenamephp']['dev']['vscode']['extensions'] = { 'user1' => %w[ext1 ext2], 'user2' => %w[ext2 ext3] }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs extensions for each user using the resource' do
      expect(chef_run).to install_sc_vscode_extension('install extension ext1 for user user1').with(extension_name: 'ext1', user: 'user1')
      expect(chef_run).to install_sc_vscode_extension('install extension ext2 for user user1').with(extension_name: 'ext2', user: 'user1')
      expect(chef_run).to install_sc_vscode_extension('install extension ext2 for user user2').with(extension_name: 'ext2', user: 'user2')
      expect(chef_run).to install_sc_vscode_extension('install extension ext3 for user user2').with(extension_name: 'ext3', user: 'user2')
    end
  end
end
