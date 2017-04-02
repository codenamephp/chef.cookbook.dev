git_client 'default' do
  action :install
end

#TODO just use a template for ~/.gitconfig
#TODO move to users cookbook

git_config 'Set username' do
  key 'user.name'
  value 'Bastian Schwarz'
  user 'wwwdev'
  only_if 'getent passwd wwwdev'
end

git_config 'Set user email' do
  key 'user.email'
  value 'bastian@codename-php.de'
  user 'wwwdev'
  only_if 'getent passwd wwwdev'
end