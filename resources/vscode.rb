# frozen_string_literal: true

property :users_extensions, Hash, default: {}, description: 'A hash where the username is the key and the value is an array with extension names as string for that user'

action :install do
  sc_vscode_installer 'install vscode'

  codenamephp_dev_vscode_extensions 'Install vscode extensions' do
    users_extensions new_resource.users_extensions
  end
end

action :uninstall do
  sc_vscode_installer 'uninstall vscode' do
    action :uninstall
  end
end