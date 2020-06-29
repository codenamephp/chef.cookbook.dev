# frozen_string_literal: true

name 'codenamephp_dev'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'Installs all dev tools for infomax project development like browsers, git, openjdk, ...'
version '2.5.0'
chef_version '>= 13.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.dev/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.dev'

supports 'debian'

depends 'sc_vscode', '~>1.0'
depends 'resolver', '~>2.0'
