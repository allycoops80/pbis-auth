#
# Cookbook Name:: pbis-auth
# Recipe:: install 
# Author:: Alan Cooper <alan@avontoun.co.uk>
#
# Based on the ad-auth cookbook: Copyright 2012,  Tim Smith and Peter Crossly
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

package "pbis-open"

# Pull the necessary creds from the appropriate authorization databag depending on the ad_network attributei
#ad_config = data_bag_item('authorization', node['authorization']['ad_auth']['ad_network'])
#ad_config = data_bag_item('authorization', node.chef_environment)

if node['authorization']['ad_auth']['ad_network']
	ad_config = data_bag_item('authorization', node['authorization']['ad_auth']['ad_network'])
else
	ad_config = data_bag_item('authorization', node.chef_environment)
end

# Join the primary_domain if we aren't a member already
execute 'AD Domain Join' do
  command "/usr/bin/domainjoin-cli join #{ad_config['primary_domain']} #{ad_config['auth_domain_user']} \"#{ad_config['auth_domain_password']}\""
  only_if ("test -z `/opt/pbis/bin/domainjoin-cli query | grep Domain | awk -F \" \" '{ print $3 }'`")
  # not_if ("/usr/bin/domainjoin-cli query | grep \"Distinguished Name =\"")
end

