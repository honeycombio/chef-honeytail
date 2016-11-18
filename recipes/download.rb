# download the honeytail binary, verify it, and put it in place.

# write the binary to a versioned location to avoid redownloads and allow
# verification prior to use
remote_file "/usr/local/bin/honeytail-#{node['honeytail']['download']['version']}" do
	source "#{node['honeytail']['download']['URL']}/#{node['honeytail']['download']['version']}"
	owner 'ubuntu'
	group 'ubuntu'
	mode '0755'
	action :create
	not_if  do
		File.exist?("/usr/local/bin/honeytail-#{node['honeytail']['download']['version']}")
	end
end
# symlink it in to place, but only if the checksum is good
link "/usr/local/bin/honeytail" do
	to "/usr/local/bin/honeytail-#{node['honeytail']['download']['version']}"
	not_if {
		require 'digest'
		checksum = Digest::SHA256.file("/usr/local/bin/honeytail-#{node['honeytail']['download']['version']}").hexdigest
		if checksum != node['honeytail']['download']['sha256_checksum']
			raise "Downloaded honeytail Checksum #{checksum} does not match expected checksum #{node['honeytail']['download']['sha256_checksum']}"
		end
	}
end
