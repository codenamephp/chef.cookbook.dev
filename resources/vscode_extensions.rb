# frozen_string_literal: true

deprecated 'The codenamephp_dev_vscode_extensions resource has been deprecated and will be moved to its own dedicated cookbook. This resource will be removed with the next major release.'

property :users_extensions, Hash, required: true, description: 'A hash where the username is the key and the value is an array with extension names as string for that user'

action :install do
  user_loop(new_resource.users_extensions, :install)
end

action :uninstall do
  user_loop(new_resource.users_extensions, :uninstall)
end

action_class do
  def user_loop(users_extensions, action)
    users_extensions.each do |user_name, extensions|
      extensions.each do |extension_name|
        sc_vscode_extension "#{action == :install ? 'Install' : 'Uninstall'} extension #{extension_name} for user #{user_name}" do
          extension_name extension_name
          user user_name
          action action
        end
      end
    end
  end
end
