# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_dev::chrome' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'calls the resource' do
      expect(chef_run).to install_codenamephp_dev_chrome('install google chrome')
    end
  end
end
