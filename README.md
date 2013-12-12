Zprezto-user Cookbook
================
Provides a simple definition for installing zsh for specific users

Requirements
------------
#### Packages
- git
- zsh

Usage
-----
#### zprezto_user

This will install zsh and prezto for a given user:

```ruby
include_recipe 'zprezto-user'

zprezto_user 'username' do
    action :install
end
```

Attributes
----------

Default attributes:

```ruby
node['zprezto-user']['repository']  # zprezto repository (default: https://github.com/sorin-ionescu/prezto.git) 
node['zprezto-user']['reference']   # zprezto repository reference revision sha1 (default: master) 
```

Contributing
------------

Make a pull request

License and Authors
-------------------
Authors: Primož Verdnik
