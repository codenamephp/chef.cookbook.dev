# Chef Cookbook Dev

The default cookbook gets the environment ready to develop infomax projects.

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.0+

### Cookbook Depdendencies

- resolver

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'chef.cookbook.dev', :github 'codenamephp/chef.cookbook.dev'
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