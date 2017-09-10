# # encoding: utf-8

# Inspec test for recipe chef.cookbook.dev::openjdk8

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control "openjdk8-1.8" do
  title "OpenJDK8"
  desc "OpenJDK8 should be installed in version 1.8"
  
  describe package('openjdk-8-jdk') do
    it { should be_installed }
  end

  describe command('java -version') do
      its(:stderr) { should match /openjdk version "1.8[\.\d_]+"/ }
      its(:exit_status) { should eq 0 }
  end
end