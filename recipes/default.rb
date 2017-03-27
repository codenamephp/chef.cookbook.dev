#
# Cookbook:: dev
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "dev::gedit"
include_recipe "dev::chrome"
include_recipe "dev::fileroller"
include_recipe "dev::openjdk8"
include_recipe "dev::dnsmasq"
include_recipe "dev::git"
