#
# Cookbook:: codenamephp_dev
# Recipe:: vscode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'vscode' do
  uri 'https://packages.microsoft.com/repos/vscode'
  repo_name 'vscode'
  arch 'amd64'
  distribution 'stable'
  components ['main']
  key 'https://packages.microsoft.com/keys/microsoft.asc'
end

package 'Install vscode' do
  package_name 'code'
end
