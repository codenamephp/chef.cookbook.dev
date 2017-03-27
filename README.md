# Chef Cookbook Dev

The default cookbook gets the environment ready to develop infomax projects.

## Requirements

### Supported Platforms

- Debian Jessie

### Chef

- Chef 12.1+

### Cookbook Depdendencies

- libarchive
- resolver
- git

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'chef.cookbook.dev', '~> 0.1.0', :github 'codenamephp/chef.cookbook.dev'
```

Add the cookbook to your runlist, e.g. in a role:

```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[chef.cookbook.dev]"
  ]
}
```