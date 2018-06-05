# Chef Cookbook Dev
[![Build Status](https://travis-ci.org/codenamephp/chef.cookbook.dev.svg?branch=dev)](https://travis-ci.org/codenamephp/chef.cookbook.dev)

Cookbook that contains recipes for dev tools, like vscode, chrome, openjdk ...

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.0+

### Cookbook Depdendencies

- [resolver][resolver_url]

## Tools
- [Google Chrome][chrome_url]
- [Visual Studio Code][vscode_url]
- [DNS Masq][dnsmasq_url]
- [OpenJDK 8][openjdk_url]

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
	  "recipe[chef.cookbook.dev::chrome]"
  ]
}
```

Note that the default recipe is a No-Op, so you need to add the tools you want

[chrome_url]: https://www.google.de/chrome
[vscode_url]: https://code.visualstudio.com/
[dnsmasq_url]: https://wiki.archlinux.de/title/Dnsmasq
[openjdk_url]: http://openjdk.java.net/
[resolver_url]: https://supermarket.chef.io/cookbooks/resolver