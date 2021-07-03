# frozen_string_literal: true

#
# Just installs the gnome-terminal (my favorite terminal) from package
#
# Cookbook:: codenamephp_dev
# Recipe:: gnome_terminal
#
# Copyright:: 2017, The Authors, All Rights Reserved.

log 'This cookbook is deprecated. Use the dedicated cookbooks instead.' do
  level :warn
end

package 'gnome-terminal'
