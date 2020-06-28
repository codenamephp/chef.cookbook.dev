# frozen_string_literal: true

property :toolbox_path, String, default: '/usr/share/jetbrains-toolbox', description: 'The path where the files are downloaded to, extracted, ...'

action :install do
  directory 'create app directory' do
    path new_resource.toolbox_path
    recursive true
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  remote_file 'download toolbox app' do
    source 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA'
    path "#{new_resource.toolbox_path}/archive"
    owner 'root'
    group 'root'
    mode '0755'
    action :create_if_missing
    notifies :extract, 'archive_file[extract toolbox]', :immediately
  end

  archive_file 'extract toolbox' do
    path "#{new_resource.toolbox_path}/archive"
    destination "#{new_resource.toolbox_path}/extracted"
    overwrite true
    action :nothing
  end

  file 'copy toolbox app to unversioned folder' do
    path "#{new_resource.toolbox_path}/app"
    owner 'root'
    group 'root'
    mode 0o757
    content lazy {
      versioned_directory = Mixlib::ShellOut.new("find #{new_resource.toolbox_path}/extracted -maxdepth 1 -type d -name jetbrains-toolbox-\* -print | head -n1").run_command.stdout.strip
      ::File.open("#{versioned_directory}/jetbrains-toolbox").read
    }
    only_if { ::File.directory?("#{new_resource.toolbox_path}/extracted") }
    action :create
  end

  directory 'delete unpacked toolbox folder' do
    path "#{new_resource.toolbox_path}/extracted"
    recursive true
    action :delete
  end

  template 'install jetrbains toolbox run on boot' do
    source 'jetbrains_toolbox/xsession.erb'
    cookbook 'codenamephp_dev'
    path '/etc/X11/Xsession.d/100-jetbrains-toolbox'
    owner 'root'
    group 'root'
    mode '0777'
    variables(
      toolbox_path: new_resource.toolbox_path
    )
    action :create
    only_if { ::File.exist?("#{new_resource.toolbox_path}/app") }
  end
end

action :uninstall do
  file 'delete xsession script' do
    path '/etc/X11/Xsession.d/100-jetbrains-toolbox'
    action :delete
  end

  directory 'delete toolbox folder' do
    path new_resource.toolbox_path.to_s
    recursive true
    action :delete
  end
end
