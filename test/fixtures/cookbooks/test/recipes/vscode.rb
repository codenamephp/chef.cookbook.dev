# frozen_string_literal: true

include_recipe '::init_users'

codenamephp_dev_vscode 'Install vscode and extensions' do
  users_extensions 'user1' => %w(eamodio.gitlens chef-software.chef), 'user2' => %w(davidanson.vscode-markdownlint)
end

codenamephp_dev_vscode_extensions 'Install extensions' do
  users_extensions 'user2' => %w(github.vscode-pull-request-github)
end
