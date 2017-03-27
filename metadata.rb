name 'chef.cookbook.dev'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache v2.0'
description 'Installs all dev tools for infomax project development like browsers, git, openjdk, ...'
long_description 'Installs all dev tools for infomax project development like browsers, git, openjdk, ...'
version '0.1.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.dev/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.dev' if respond_to?(:source_url)

depends 'libarchive'
depends 'resolver'
depends 'git', '~> 6.0'