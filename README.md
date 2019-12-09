# Chef Cookbook Dev
[![Build Status](https://travis-ci.org/codenamephp/chef.cookbook.dev.svg?branch=dev)](https://travis-ci.org/codenamephp/chef.cookbook.dev)

Cookbook that contains recipes for dev tools, like vscode, chrome, openjdk ...

## Requirements

### Supported Platforms

- Debian Buster
- (Probably works still works for older debian versions but this is not tested)

### Chef

- Chef 13.0+

### Cookbook Depdendencies

- [resolver][resolver_url]
- [sc_vscode][sc_vscode_url]

## Tools
- [Google Chrome][chrome_url]
- [Visual Studio Code][vscode_url]
- [DNS Masq][dnsmasq_url]
- [gnome-terminal][gnome-terminal_url]

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'codenamephp_dev'
```

Add the tools cookbook to your runlist, e.g. in a role:

```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[codenamephp_dev::chrome]"
  ]
}
```

Note that the default recipe is a No-Op, so you need to add the tools you want

### Attributes

#### resolver
- `['resolver']['nameservers']` The array of ips to add to the resolver config. Defaults to `['127.0.0.1', '8.8.8.8', '8.8.4.4', '10.0.2.3']`
- `['codenamephp']['dev']['vscode']['extensions']` Is a hashmap with the usernames as keys and the extensions for each users as array. Defaults to `{}` so no extensions are installed.
Example: `['codenamephp']['dev']['vscode']['extensions'] = {'user1' => ['ext1', 'ext2']}`

## Resources

### Jetbrains Toolbox
The `codenamephp_dev_jetrbains_toolbox` resource installs or uninstalls the [Jetbrains toolbox][jetbrains_toolbox_url] which can then be used to manage the Jetbrains products.

#### Actions
- `:install`: Downloads the toolbox to a shared location and adds an X11 session script that installs the toolbox for the logged in user
- `:uninstall`: Deletes the shared script and the login script. Already installed apps for the users are not removed

#### Properties
- `toolbox_path`: The path where the files are downloaded to, extracted, ..., default: '/usr/share/jetbrains-toolbox'. If you have a custom path you need to provide it as well for the uninstall action.

#### Examples
```ruby
# Minmal parameters
codenamephp_dev_jetbrains_toolbox 'install jetbrains-toolbox'

# Custom source and path
codenamephp_dev_jetbrains_toolbox 'install jetbrains-toolbox' do
  toolbox_path '/my/custom/executable/path'
end

# Uninstall
codenamephp_dev_jetbrains_toolbox 'uninstall jetbrains-toolbox' do
  toolbox_path '/my/custom/executable/path'
end
```

## Recipes

### Default
The default cookbook (as stated multiple times) is a No-Op. Pick and choose the tools you want via the recipes.

### Chrome
Adds the google apt repository and installs [Google Chrome][chrome_url] from package.

### DNSMasq
Purges the [Avahi Deamon][avahi_url] which is installed at least on Ubuntu and tends to occupy ports. Also the [resolver Cookbook][resolver_url]
is used to add localhost, [Google DNS][google_dns_url] and `10.0.2.3` which is needed in [VirtualBox][virutalbox_url] for network operations to work.
The IPs can be overridden/added to via the attributes.

At last, [DNSMasq][dnsmasq_url] is installed and the local domain and all subdomains is resolved to `127.0.0.1`.

### gnome-terminal
Just installs the gnome-terminal from package.

### Unzip
Just installs unzip from package (no gui client is installed)

### VSCode
Installs [VSCode][vscode_url] from package using the [Sous Chefs vscode cookbook][sc_vscode_url]. Extensions can also be installed by giving the users and extensions
as hashmap in the attributes.

### Jetbrains Toolbox
The `jetbrains_toolbox` recipe installs the jetbrains toolbox to a shared location and adds an X-Server startup script so it will be installed for each user on first
login.

[chrome_url]: https://www.google.de/chrome
[vscode_url]: https://code.visualstudio.com/
[dnsmasq_url]: https://wiki.archlinux.de/title/Dnsmasq
[gnome-terminal_url]: https://en.wikipedia.org/wiki/GNOME_Terminal
[resolver_url]: https://supermarket.chef.io/cookbooks/resolver
[avahi_url]: https://wiki.ubuntuusers.de/Avahi/
[google_dns_url]: https://developers.google.com/speed/public-dns/
[virtualbox_url]: https://www.virtualbox.org/
[sc_vscode_url]:  https://github.com/sous-chefs/vscode
[jetbrains_toolbox_url]: https://www.jetbrains.com/toolbox-app/