git_client 'default' do
  action :install
end

git_config 'Set username' do
  key 'user.name'
  value 'Bastian Schwarz'
  user 'wwwdev'
end

git_config 'Set user email' do
  key 'user.email'
  value 'bastian@codename-php.de'
  user 'wwwdev'
end