class awstats {
	package { "awstats":
          ensure => "installed"
     	}

      file { "/etc/apache2/conf.d/awstats.conf":
    ensure => present,
    content => template("awstats/apache.conf.erb"),
     }

	file { "/etc/awstats/awstats.conf":
		ensure => $ensure,
		content => template("awstats/awstats.conf.erb"),
		owner   => root,
		group   => root,
		mode    => 0644,
	}	
}

