name 'chef.cookbook.dev'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'Installs all dev tools for infomax project development like browsers, git, openjdk, ...'
long_description 'Installs all dev tools for infomax project development like browsers, git, openjdk, ...'
version '0.1.3'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.dev/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.dev' if respond_to?(:source_url)

depends 'libarchive'
depends 'resolver'
depends 'git', '~> 6.0'

supports 'debian', '~>9.1'