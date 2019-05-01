#
# Cookbook:: delprof
# Recipe:: default
#
# Copyright:: 2019, Garrett Yamada, All Rights Reserved.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

return unless platform?('windows') 

# Path for install_dir must include trailing slash, like this:
# C:\\delprof\\

delprof 'Install' do
    install_dir 'C:\\delprof\\'
    action :install
end

# Available flags:

# /d   Delete only profiles not used in x days
# /ed  Exclude profile directories whose name matches this pattern
#      Wildcard characters * and ? can be used in the pattern
#      May be used more than once and can be combined with /id
# /id  Include only profile directories whose name matches this pattern
#      Wildcard characters * and ? can be used in the pattern
#      May be used more than once and can be combined with /ed
# /i   Ignore errors, continue deleting

delprof 'Task' do
    flags '/ed:Administrator' # /q is on by default
    frequency :weekly
    frequency_modifier '1'
    action :configure_task
end
