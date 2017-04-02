#
# Cookbook:: dev
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "chef.cookbook.dev::gedit"
include_recipe "chef.cookbook.dev::chrome"
include_recipe "chef.cookbook.dev::fileroller"
include_recipe "chef.cookbook.dev::openjdk8"
include_recipe "chef.cookbook.dev::dnsmasq"
include_recipe "chef.cookbook.dev::git"
