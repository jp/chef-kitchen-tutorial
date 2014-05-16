#
# Cookbook Name:: base_setup
# Recipe:: default
#
# Copyright 2014, Julien Pellet
#
#

# set vm.swapiness to 0 via sysctl_param LWRP
sysctl_param 'vm.swappiness' do
  value 0
  notifies :run, 'ruby_block[save-sysctl-params]', :delayed
end

# disable IPv6
sysctl_param 'net.ipv6.conf.all.disable_ipv6' do
  value 1
  notifies :run, 'ruby_block[save-sysctl-params]', :delayed
end

# disable IPv6
sysctl_param 'net.ipv6.conf.default.disable_ipv6' do
  value 1
  notifies :run, 'ruby_block[save-sysctl-params]', :delayed
end

# disable IPv6
sysctl_param 'net.ipv6.conf.lo.disable_ipv6' do
  value 1
  notifies :run, 'ruby_block[save-sysctl-params]', :delayed
end
