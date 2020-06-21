# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Recipe:: vscode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

log 'The codenamephp_dev::vscode recipe is deprecated. Just use the resources in a wrapper cookbook' do
  level :warn
end

codenamephp_dev_vscode 'Install vscode and extensions' do
  users_extensions node['codenamephp']['dev']['vscode']['extensions']
end
