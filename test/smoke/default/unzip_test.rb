# Inspec test for recipe codenamephp_dev::unzip

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'unzip-1.0' do
  title 'Make sure unzip is installed'
  desc 'Make sure vscode is unzip as stable package'

  describe package('unzip') do
    it { should be_installed }
  end
end
