#
# Author::  Anthony Goddard (<anthony@anthonygoddard.com>)
# Cookbook Name:: nginx-passenger
# Recipe:: default
#
# Copyright 2011, Woods Hole Marine Biological Laboratory
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "libcurl4-openssl-dev"

gem_package "passenger" do
  action :install
# TODO version if version set
end

nginx_src = "/tmp/nginx-#{node[:nginx][:source][:version]}"

# download nginx source
remote_file "#{nginx_src}.tar.gz" do
  source "#{node[:nginx][:source][:url]}#{node[:nginx][:source][:version]}.tar.gz"
  checksum node[:nginx][:source][:checksum]
end

# extract source
execute "extract nginx" do
  command "tar -C /tmp -xzf #{nginx_src}.tar.gz"
  not_if { File.exists?(nginx_src) }
end

execute "compile nginx with passenger" do
  compile_options = Array.new
  node[:nginx][:compile_options].each do |option,value|
    value == true ? compile_options << "--#{option}" : compile_options << "--#{option}=#{value}"
  end
  command "passenger-install-nginx-module --auto --prefix=#{default[:nginx][:prefix_dir]} --nginx-source-dir=#{nginx_src} --extra-configure-flags=\"#{compile_options.join(" ")}\""
  # notifies :restart, resources(:service => "nginx")
  creates "#{default[:nginx][:prefix_dir]}/nginx"
  # not_if "nginx -V"
  # TODO add check for specific passenger version her
end

