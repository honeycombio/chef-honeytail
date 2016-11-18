include_recipe 'chef-honeytail::daemon'
include_recipe 'chef-honeytail::download'

# honeytail will run as the honeytail user. Please make sure the honeytail user
# has read access to any log files honeytail will need to read
user 'honeytail' do
  action :create
  system true
end

template '/etc/init.d/honeytail' do
  source 'honeytail.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :additional_flags => node['honeytail']['additional_flags'],
  )
  notifies :restart, 'service[honeytail]'
end

# honeytail will store statefiles here
directory '/var/lib/honeytail' do
  owner 'honeytail'
  group 'root'
  mode '0755'
  action :create
end

# honeytail will store its pidfile here
directory '/var/run/honeytail' do
  owner 'honeytail'
  group 'root'
  mode '0755'
  action :create
end

template "/usr/local/etc/honeytail.conf" do
  source "honeytail.conf.erb"
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :parser => node['honeytail']['parser'],
    :writekey => node['honeytail']['writekey'],
    :logfiles => node['honeytail']['logfiles'],
    :dataset => node['honeytail']['dataset'],
    :app_opts => node['honeytail']['application_options'].to_hash,
    :tail_opts => node['honeytail']['tail_options'].to_hash,
    :nginx_opts => node['honeytail']['nginx'].to_hash,
    :json_opts => node['honeytail']['json'].to_hash,
    :mysql_opts => node['honeytail']['mysql'].to_hash,
    :mongo_opts => node['honeytail']['mongo'].to_hash,
  )
  notifies :restart, "service[honeytail]"
end

service 'honeytail' do
  supports :status => true, :restart => true
  action [:start, :enable]
end
