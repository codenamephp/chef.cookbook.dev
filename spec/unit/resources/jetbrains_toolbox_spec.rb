# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_dev_jetbrains_toolbox' do
  step_into :codenamephp_dev_jetbrains_toolbox

  context 'Install with minimal properties' do
    recipe do
      codenamephp_dev_jetbrains_toolbox 'install toolbox'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates xdg template' do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/usr/share/jetbrains-toolbox/app').and_return(true)

      expect(chef_run).to create_template('install jetbrains toolbox run on boot with xdg autostart').with(
        source: 'jetbrains_toolbox/xdg.erb',
        cookbook: 'codenamephp_dev',
        path: '/etc/xdg/autostart/jetbrains-toolbox.desktop',
        owner: 'root',
        group: 'root',
        mode: '0777',
        variables: {
          toolbox_path: '/usr/share/jetbrains-toolbox',
        }
      )
    end
  end

  context 'Uninstall with minimal properties' do
    recipe do
      codenamephp_dev_jetbrains_toolbox 'install toolbox' do
        action :uninstall
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'deletes xdg script' do
      expect(chef_run).to delete_file('delete xdb script').with(
        path: '/etc/xdg/autostart/jetbrains-toolbox.desktop'
      )
    end
  end
end
