# frozen_string_literal: true

# Inspec test for recipe codenamephp_dev::chrome

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'chrome-1.0' do
  title 'Make sure chrome is installed'
  desc 'Make sure Google Chrome is installed as stable package'

  describe package('google-chrome-stable') do
    it { should be_installed }
  end
end
