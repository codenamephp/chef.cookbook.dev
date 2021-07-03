# frozen_string_literal: true

deprecated 'This cookbook is depreacted. The resources will be moved to dedicated cookbooks'

unified_mode true

action :install do
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
end

action :remove do
  apt_repository 'google-chrome' do
    action :remove
    repo_name 'google-chrome'
  end

  package 'Remove google chrome' do
    package_name 'google-chrome-stable'
    action :remove
  end
end
