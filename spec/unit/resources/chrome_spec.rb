# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev::chrome' do
  step_into :codenamephp_dev_chrome

  context 'Install' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    recipe do
      codenamephp_dev_chrome 'install chrome'
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

  context 'Remove' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    recipe do
      codenamephp_dev_chrome 'install chrome' do
        action :remove
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds google apt repo' do
      expect(chef_run).to remove_apt_repository('google-chrome')
    end

    it 'removes google chrome' do
      expect(chef_run).to remove_package('Remove google chrome')
    end
  end
end
