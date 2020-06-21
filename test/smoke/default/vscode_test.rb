# frozen_string_literal: true

# Inspec test for recipe codenamephp_dev::vscode

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'vscode-1.0' do
  title 'Make sure vscode is installed'
  desc 'Make sure vscode is installed as stable package'

  describe package('code') do
    it { should be_installed }
  end

  describe command('sudo -uuser1 code --list-extensions') do
    its('stdout') { should match(/chef-software\.chef/i) }
  end
  describe command('sudo -uuser1 code --list-extensions') do
    its('stdout') { should match(/eamodio\.gitlens/i) }
  end
  describe command('sudo -uuser2 code --list-extensions') do
    its('stdout') { should match(/davidanson\.vscode-markdownlint/i) }
  end
  describe command('sudo -uuser2 code --list-extensions') do
    its('stdout') { should match(/github\.vscode-pull-request-github/i) }
  end
end
