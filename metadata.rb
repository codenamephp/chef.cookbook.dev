# frozen_string_literal: true

name 'codenamephp_dev'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'Installs all dev tools for infomax project development like browsers, git, openjdk, ...'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.2.0'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.dev/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.dev' if respond_to?(:source_url)

supports 'debian', '~>10.0'

depends 'sc_vscode', '~>1.0'
depends 'resolver', '~>2.0'
