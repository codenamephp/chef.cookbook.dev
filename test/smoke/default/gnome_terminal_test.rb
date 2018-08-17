# Inspec test for recipe codenamephp_dev::gnome_terminal

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'gnome-terminal-1.0' do
  title 'gnome-terminal'
  desc 'Install gnome-terminal from package'

  describe package('gnome-terminal') do
    it { should be_installed }
  end
end
