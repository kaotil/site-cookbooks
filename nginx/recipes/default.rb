#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_repository 'nginx' do
  description 'Nginx.org Repository'
  baseurl     'http://nginx.org/packages/centos/6/$basearch/'
  gpgcheck    false
  priority    '1'
  action :create
end
