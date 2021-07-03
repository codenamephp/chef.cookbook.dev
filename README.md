# Chef Cookbook Dev
[![Build Status](https://travis-ci.com/codenamephp/chef.cookbook.dev.svg?branch=main)](https://travis-ci.com/codenamephp/chef.cookbook.dev)

Cookbook that contains recipes for dev tools, like vscode, chrome, openjdk ...

## Requirements

### Supported Platforms

- Debian Buster
- (Probably works still works for older debian versions but this is not tested)

### Chef

- Chef 15.3+

## Tools
- [Google Chrome][chrome_url]
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

Note that the default recipe is a No-Op, so you need to add the tools you want. This cookbook is moving to resources and most recipes are only
shortcuts for those resources so the preferred way is to create a wrapper cookbook and just resources since it is more flexible and stable that way.

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

### Chrome
The `codenamephp_dev_chrome` resource installs or uninstalls the [Google Chrome][chrome_url] Browser and its apt repository.

#### Actions
- `:install`: Adds the apt repository and installs the browser via apt
- `:remove`: Removes the apt repository and the chrome package via apt

#### Examples
```ruby
# Minmal parameters
codenamephp_dev_chrome 'install chrome'

# Uninstall
codenamephp_dev_chrome 'install chrome' do
  action :remove
end
```
## Recipes
The recipes are just shortcuts for simple use cases so the tools can be installed e.g. with the chef server gui. For more complex use cases the resources
should be used.

### Default
The default cookbook (as stated multiple times) is a No-Op. Pick and choose the tools you want via the recipes.

### Chrome
Adds the google apt repository and installs [Google Chrome][chrome_url] from package.

### gnome-terminal
Just installs the gnome-terminal from package.

### Unzip
Just installs unzip from package (no gui client is installed)

### Jetbrains Toolbox
The `jetbrains_toolbox` recipe installs the jetbrains toolbox to a shared location and adds an X-Server startup script so it will be installed for each user on first
login.

[chrome_url]: https://www.google.de/chrome
[gnome-terminal_url]: https://en.wikipedia.org/wiki/GNOME_Terminal
[google_dns_url]: https://developers.google.com/speed/public-dns/
[virtualbox_url]: https://www.virtualbox.org/
[jetbrains_toolbox_url]: https://www.jetbrains.com/toolbox-app/
