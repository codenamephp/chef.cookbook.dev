# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Recipe:: chrome
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'google-chrome' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  repo_name 'google-chrome'
  arch 'amd64'
  distribution 'stable'
  components ['main']
  key 'https://dl.google.com/linux/linux_signing_key.pub'
end

package 'Install google chrome' do
  package_name 'google-chrome-stable'
end
