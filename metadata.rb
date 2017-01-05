name 'asf'
maintainer 'Tyler Wong'
maintainer_email 'ty-w@live.com'
license 'all_rights'
description 'Installs/Configures ArchiSteamFarm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
depends 'poise-service', '~> 1.4.2'
depends 'apt', '~> 5.0.1'
depends 'yum', '~> 4.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/asf/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/asf' if respond_to?(:source_url)
