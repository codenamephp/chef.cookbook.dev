require 'spec_helper'

describe 'OpenJDK 8 is installed and configured as default alternative' do
  describe package('openjdk-8-jdk') do
    it { should be_installed }
  end

  describe command('java -version') do
    its(:stderr) { should match /openjdk version "1.8/ }
    its(:exit_status) { should eq 0 }
  end
end