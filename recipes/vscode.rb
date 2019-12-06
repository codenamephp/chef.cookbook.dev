# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Recipe:: vscode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

sc_vscode_installer 'install vscode'

node['codenamephp']['dev']['vscode']['extensions'].each do |user_name, extensions|
  extensions.each do |extension_name|
    sc_vscode_extension "install extension #{extension_name} for user #{user_name}" do
      extension_name extension_name
      user user_name
    end
  end
end
