name             'pbis-auth'
maintainer       'Alan Cooper'
maintainer_email 'alan@avontoun.co.uk'
license          'Apache 2.0'
description      'Configures Active Directory authentication support using PBIS Open 7.x'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

depends          'sudo'

%w{ centos }.each do |os|
  supports os
end
