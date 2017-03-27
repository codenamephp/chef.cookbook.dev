include_recipe "libarchive::default"

remote_file 'Get package from aptana' do
  path '/home/wwwdev/Desktop/aptanaStudio.zip'
  source 'https://github.com/aptana/studio3/releases/download/v3.6.1/Aptana_Studio_3_Setup_Linux_x86_64_3.6.1.zip'
  notifies :extract, 'libarchive_file[extract aptana archive]', :immediately
  not_if { ::File.directory?('/home/wwwdev/Desktop/aptanaStudio') }
end

libarchive_file 'extract aptana archive' do
  action :nothing
  path '/home/wwwdev/Desktop/aptanaStudio.zip'
  extract_to '/home/wwwdev/Desktop/aptanaStudio'
  group 'wwwdev'
  owner 'wwwdev'
  notifies :delete, 'file[Delete aptana package download]', :immediately
end

file 'Delete aptana package download' do
  action :nothing
  path '/home/wwwdev/Desktop/aptanaStudio.zip'
  backup false
  only_if { ::File.exist?('/home/wwwdev/Desktop/aptanaStudio.zip') }
end
