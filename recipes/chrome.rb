# frozen_string_literal: true

#
# Cookbook:: codenamephp_dev
# Recipe:: chrome
#
# Copyright:: 2017, The Authors, All Rights Reserved.

log 'This recipe is deprecated. Use the resource instead.' do
  level :warn
end

codenamephp_dev_chrome 'install google chrome'
