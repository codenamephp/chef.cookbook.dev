# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Spec:: vscode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev_vscode' do
  step_into :codenamephp_dev_vscode

  context 'Install without extensions' do
    recipe do
      codenamephp_dev_vscode 'Install vscode'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs vscode using the resource' do
      expect(chef_run).to install_sc_vscode_installer('install vscode')
    end
  end

  context 'When users and extensions are set' do
    recipe do
      codenamephp_dev_vscode 'Install vscode and extensions' do
        users_extensions 'user1' => %w[ext1 ext2], 'user2' => %w[ext2 ext3]
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs extensions for each user using the resource' do
      expect(chef_run).to install_codenamephp_dev_vscode_extensions('Install vscode extensions').with(users_extensions: { 'user1' => %w[ext1 ext2], 'user2' => %w[ext2 ext3] })
    end
  end
end
