name 'asf'
maintainer 'Tyler Wong'
maintainer_email 'ty-w@live.com'
license 'Apache 2.0'
description 'Installs/Configures ArchiSteamFarm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'
issues_url 'https://github.com/T-Wong/asf/issues' if respond_to?(:issues_url)
source_url 'https://github.com/T-Wong/asf' if respond_to?(:source_url)

supports 'centos', '>= 7.0'
supports 'debian', '>= 7.0'
supports 'fedora', '>= 21.0'
supports 'freebsd', '>= 9.0'
supports 'opensuse', '>= 13.0'
supports 'opensuseleap', '>= 13.0'
supports 'redhat', '>= 7.0'
supports 'ubuntu', '>= 12.04'

depends 'poise-service', '~> 1.4.2'
depends 'apt', '~> 5.0.1'
depends 'yum', '~> 4.1.0'
depends 'zypper', '~> 0.3.0'
