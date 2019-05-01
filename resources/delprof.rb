#
# Cookbook:: delprof
# Resource:: delprof_install
#
# Copyright:: 2019, Garrett Yamada, All Rights Reserved.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

resource_name :delprof
provides :delprof, :os => 'windows'
default_action :install

property :install_dir, String
property :frequency, Symbol
property :frequency_modifier, String
property :flags, String

action :install do 
    install
end

action :configure_task do 
    configure_task
end

action_class do

    def install

        remote_file 'C:/Delprof2 1.6.0.zip' do
            source 'https://helgeklein.com/downloads/DelProf2/current/Delprof2%201.6.0.zip'
            action :create
        end

        archive_file "Delprof2 1.6.0.zip" do
            path "C:/Delprof2 1.6.0.zip"
            extract_to "#{new_resource.install_dir}"
            action :extract
        end

        $exepath = ::File.join("#{new_resource.install_dir}", 'Delprof2 1.6.0\\Delprof2.exe')
        
    end

    def configure_task
        
        windows_task 'delprof' do
            command "#{$exepath} /q #{new_resource.flags}"
            frequency new_resource.frequency
            frequency_modifier new_resource.frequency_modifier
            run_level :highest
            action :create
            not_if "if(Get-ScheduledTask delprof){return 0}"
        end

    end

end
