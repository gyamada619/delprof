# Delprof2 Cookbook

Installs Delprof2 and can optionally configire a scheduled task.

## Requirements

- Chef 14.0+

### Platforms

- Windows

### Dependencies

- [libarchive](https://supermarket.chef.io/cookbooks/libarchive)

## Usage

Add `recipe[delprof::default]` to your run list, if you wish to use the default settings:

- Installs Delprof2.exe to C:\delprof\Delprof 1.6.0\DelProf2.exe
- Creates a scheduled task to run it weekly to clean profiles, excluding the built-in administrator

### Properties

This cookbook exposes a 'delprof' resource for inclusion in other cookbooks. 

Property                                            | Description                                                                               | Type    | Default
---------------------------------------------------- | ----------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------------------------------
`install_dir`                                        | Root directory to extract DelProf2 to                                  | String | nil
`frequency`                                        | Can be `:minute`, `:daily`, etc. Sets frequency of scheduled task                                 | Symbol | nil
`frequency_modifier`                                        | Can be `1-365`, `1-52`, etc.                                  | String | nil
`flags`                                        | Flags to modify DelProf2 run. (`/d`, `/ed`)                                  | String | nil

```ruby
delprof 'Install' do
    install_dir 'C:\\delprof\\'
    action :install
end
```


See [the DelProf2 docs](https://helgeklein.com/free-tools/delprof2-user-profile-deletion-tool/) for more info.

## Testing

Testing was performed on Windows 10 v1803, Windows 10 v1803, and Windows Server 2019.

## License & Maintainer

Maintainer: Garrett Yamada (me@garrettyamada.com)

License: MIT

DelProf2 is a project of Helge Klein (© 2019 Helge Klein. All Rights Reserved.)
