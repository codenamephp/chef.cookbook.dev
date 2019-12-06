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

[chrome_url]: https://www.google.de/chrome
[vscode_url]: https://code.visualstudio.com/
[dnsmasq_url]: https://wiki.archlinux.de/title/Dnsmasq
[gnome-terminal_url]: https://en.wikipedia.org/wiki/GNOME_Terminal
[resolver_url]: https://supermarket.chef.io/cookbooks/resolver
[avahi_url]: https://wiki.ubuntuusers.de/Avahi/
[google_dns_url]: https://developers.google.com/speed/public-dns/
[virtualbox_url]: https://www.virtualbox.org/
[sc_vscode_url]:  https://github.com/sous-chefs/vscode