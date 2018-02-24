#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Author: Peter Sosnowski

# install JDK
node.default['java']['jdk_version'] = 7
include_recipe "java::default"

# install tomcat
#package 'tomcat7' do
package node.default['tomcat']['tomcat_package'] do
  action :install
end

# stop tomcat
#service 'tomcat7' do
service node.default['tomcat']['tomcat_package'] do
  action :stop
end

#deploy war file
remote_file "#{node.default['tomcat']['tomcat_path']}/#{node.default['tomcat']['tomcat_package']}/webapps/sample.war" do
  source 'https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war'
end

# copy over keystore
cookbook_file "/tmp/tomcat.ks" do
  source "tomcat.ks"
  mode "0755"
end

#apply changes to server.xml
template "#{node.default['tomcat']['tomcat_path']}/#{node.default['tomcat']['tomcat_package']}/conf/server.xml" do
  source 'server.xml.erb'
  mode '0644'
  owner 'root'
  group node.default['tomcat']['tomcat_package']
end

# start tomcat
service node.default['tomcat']['tomcat_package'] do
  action [:enable, :start]
end

