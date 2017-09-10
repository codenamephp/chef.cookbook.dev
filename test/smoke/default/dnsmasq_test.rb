# # encoding: utf-8

# Inspec test for recipe chef.cookbook.dev::dnsmasq

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control "dnsmasq-1.0" do
  title "DNSMasq"
  desc "Install dnsmasq, configure it to resolve local tld to localhost and
        make sure it is started and enabled"
  
  describe service('dnsmasq') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
  
  describe host('test.local') do
    it { should be_resolvable }
    its('ipaddress') { should include '127.0.0.1' }
  end
end