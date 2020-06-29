# frozen_string_literal: true

# Inspec test for recipe codenamephp_php::phpstorm

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'jetrbains-toolbox-1.0' do
  title 'Install Jetrbains Toolbox'
  desc 'Download and install the jetbrains toolbox'

  describe directory('/usr/share/jetbrains-toolbox') do
    it { should exist }
  end

  describe file('/usr/share/jetbrains-toolbox/archive') do
    it { should exist }
  end

  describe directory('/usr/share/jetbrains-toolbox/extracted') do
    it { should_not exist }
  end

  describe file('/usr/share/jetbrains-toolbox/app') do
    it { should exist }
    its('mode') { should cmp '0757' }
  end

  describe file('/etc/X11/Xsession.d/100-jetbrains-toolbox') do
    it { should exist }
    its('content') { should match(%r{/usr/share/jetbrains-toolbox/app}) }
  end

  describe file('/etc/xdg/autostart/jetbrains-toolbox.desktop') do
    it { should exist }
    its('content') { should match(%r{/usr/share/jetbrains-toolbox/app}) }
  end
end
