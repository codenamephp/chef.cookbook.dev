# Inspec test for recipe codenamephp_dev::vscode

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'vscode-1.0' do
  title 'Make sure vscode is installed'
  desc 'Make sure vscode is installed as stable package'

  describe package('code') do
    it { should be_installed }
  end
end
