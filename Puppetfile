# ens-puppet puppetfile
#
# For more information, see:
# https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd

# The directory into which modules will be pulled
moduledir 'modules'

# Specify what modules to pull down.
# NOTE: We won't use Puppet Forge for any modules. Instead, fork them
# to our Github and add those as Git modules.

# Pull a module from github over HTTPS:
# Community modules
mod 'accounts',
    git: 'https://github.com/camptocamp/puppet-accounts.git',
    tag: '1.5.1'

mod 'apache',
    git: 'https://github.com/puppetlabs/puppetlabs-apache.git',
    tag: '1.6.0'

mod 'apt',
    git: 'https://github.com/Ensighten/puppetlabs-apt',
    tag: '2.2.0'

mod 'augeasproviders_core',
    git: 'https://github.com/hercules-team/augeasproviders_core.git',
    tag: '2.1.2'

mod 'ca_cert',
    git: 'https://github.com/pcfens/puppet-ca_cert.git',
    tag: 'v1.1.1'

mod 'concat',
    git: 'https://github.com/puppetlabs/puppetlabs-concat.git',
    tag: '1.2.4'

mod 'firewall',
    git: 'https://github.com/puppetlabs/puppetlabs-firewall.git',
    tag: '1.7.1'

mod 'gcc',
    git: 'https://github.com/puppetlabs/puppetlabs-gcc.git',
    tag: '0.3.0'

mod 'git',
    git: 'https://github.com/puppetlabs/puppetlabs-git.git',
    tag: '0.4.0'

mod 'hiera',
    git: 'https://github.com/hunner/puppet-hiera.git',
    tag: '1.3.1' # Do not use 1.3.2, see:
# https://github.com/hunner/puppet-hiera/commit/1377728fab6c693137445a709b0f9da32517f1c1
# https://github.com/hunner/puppet-hiera/commit/fc5395450b53999ea0f5fa16135eec28d02e4dec
# https://github.com/hunner/puppet-hiera/compare/1.3.1...1.3.2

mod 'inifile',
    git: 'https://github.com/puppetlabs/puppetlabs-inifile.git',
    tag: '1.4.2'

mod 'java',
    git: 'https://github.com/puppetlabs/puppetlabs-java.git',
    tag: '1.4.3'

mod 'logrotate',
    git: 'https://github.com/yo61/puppet-logrotate.git',
    tag: 'v1.3.0'

mod 'make',
    git: 'https://github.com/croddy/puppet-make.git',
    tag: 'v0.0.5'

mod 'monit',
    git: 'https://github.com/Ensighten/puppet-monit.git',
    ref: '24bd3562a5426d1fdfa2d828b74eda6cb986724f'
    # Using hash until upstream merges changes
    #tag: 'v0.0.4'

# mod 'mongodb',
#     git: 'https://github.com/puppetlabs/puppetlabs-mongodb.git',
#     tag: '0.11.0'

# required to support mongo repos for >= 3.x
# https://github.com/puppetlabs/puppetlabs-mongodb/pull/234
mod 'mongodb',
    git: 'https://github.com/olbat/puppetlabs-mongodb.git',
    ref: 'bf40a53200973e4068cf4c07790fef2bb5a99bb2' # apt_repo_mongo3

mod 'nginx',
    git: 'https://github.com/jfryman/puppet-nginx',
    ref: 'c2571e563fc4ff341afcb60c623e72bb9c14de9b'
    #tag: 'v0.2.7'
    # pinned master as of 2015-12-17 #

mod 'nodejs',
    git: 'https://github.com/puppet-community/puppet-nodejs',
    tag: '1.2.0'

mod 'ntp',
    git: 'https://github.com/puppetlabs/puppetlabs-ntp.git',
    tag: '4.1.0'

mod 'openssl',
    git: 'https://github.com/Ensighten/puppet-openssl.git',
    ref: '51a492430ae41bb80266e83721900ff279e4dfce'
    # waiting on https://github.com/camptocamp/puppet-openssl/pull/53
    #git: 'https://github.com/camptocamp/puppet-openssl.git',
    #tag: '1.5.1'

mod 'ossec',
    git: 'https://github.com/Ensighten/ossec-puppet.git',
    ref: 'client_hostname'
    # pending https://github.com/wazuh/ossec-puppet/pull/3
    #git: 'https://github.com/wazuh/ossec-puppet.git',
    #ref: '00de4e91a0b97bd71d19fdb11df1df540f477557'

mod 'pe_gem',
    git: 'https://github.com/puppetlabs/puppetlabs-pe_gem.git',
    tag: '0.1.1'

# we require parameters only available in head, pinned to commit from 2015-10-31
mod 'php',
    git: 'https://github.com/jippi/puppet-php.git',
    ref: '89e5c1623d24b4a36b0ec66d32974e69eb48d4ea'

mod 'portage',
    git: 'https://github.com/gentoo/puppet-portage.git',
    tag: '2.3.0'

mod 'postgresql',
    git: 'https://github.com/puppetlabs/puppetlabs-postgresql.git',
    tag: '4.6.0'

mod 'puppet',
    git: 'https://github.com/theforeman/puppet-puppet.git',
    tag: '4.2.0'

mod 'puppetboard',
    git: 'https://github.com/puppet-community/puppet-module-puppetboard.git',
    tag: '2.7.3'

mod 'puppetdb',
    git: 'https://github.com/puppetlabs/puppetlabs-puppetdb.git',
    tag: '5.0.0'

mod 'puppetserver_gem',
    git: 'https://github.com/puppetlabs/puppetlabs-puppetserver_gem.git',
    tag: '0.1.0'

mod 'python',
    git: 'https://github.com/stankevich/puppet-python.git',
    tag: '1.9.8'

mod 'r10k',
    git: 'https://github.com/acidprime/r10k.git',
    tag: 'v3.2.0'

mod 'ruby',
    git: 'https://github.com/puppetlabs/puppetlabs-ruby.git',
    tag: '0.4.0'

mod 'sensu',
    # revert to https://www.github.com/sensu/sensu-puppet.git once updated past 1.5.5
    git: 'https://github.com/Ensighten/sensu-puppet.git',
    tag: 'v1.5.5-hotfix'

mod 'augeasproviders_ssh',
    git: 'https://github.com/hercules-team/augeasproviders_ssh.git',
    tag: '2.5.0'

mod 'stdlib',
    git: 'https://github.com/puppetlabs/puppetlabs-stdlib.git',
    tag: '4.9.0'

mod 'sudo',
    git: 'https://github.com/arnoudj/puppet-sudo.git',
    ref: 'be4438e0b109018d4c608ca00dc6c66ee113581e'

mod 'sysctl',
    git: 'https://github.com/hercules-team/augeasproviders_sysctl.git',
    tag: '2.0.2'

mod 'vcsrepo',
    git: 'https://github.com/puppetlabs/puppetlabs-vcsrepo.git',
    tag: '1.3.1'

mod 'wget',
    git: 'https://github.com/maestrodev/puppet-wget.git',
    tag: 'v1.7.1'

# Ensighten public modules
mod 'daemontools',
    git: 'https://github.com/Ensighten/puppet-daemontools.git',
    tag: '0.2.0-ens'

# forked due to having a git module claim the resource.
mod 'rbenv',
    git: 'https://github.com/Ensighten/puppet-rbenv.git',
    tag: '2.1.0-ens'

# Ensighten private modules
mod 'asg_hostname',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-asg_hostname.git',
    tag: '0.1.1'

mod 'ens_app',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-ens_app.git',
    tag: '0.1.0'

mod 'eximsimple',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-eximsimple.git',
    tag: '1.0.2'

mod 'iptables',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-iptables.git',
    tag: '0.1.1'

mod 'ldap',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-ldap.git',
    tag: '0.1.1'

mod 'logsync',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-logsync.git',
    tag: '0.1.3'

mod 'nexus_filesystem',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-nexus_filesystem.git',
    tag: '0.1.3'

mod 'pam',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-pam.git',
    tag: '0.1.1'

mod 'ssh',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-ssh.git',
    tag: '0.1.4'

mod 'users',
    git: 'git@bitbucket.org:ensighten-ondemand/puppet-users.git',
    tag: '0.1.1'
