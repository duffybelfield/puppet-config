#Run on non-master node to add checks
class icinga::observed {

 include icinga::packages

  #Prefix to prepend to each check name
  $prefix="PG"
  #${hostname}
  ##Basic checks added for each provisioned host

   #Ping check
   @@nagios_host { "$fqdn":
       ensure => present,
       alias => $hostname,
       address => $ec_public,
       use => "generic-host",
       require => Class['icinga::packages']
  }

 @@nagios_hostextinfo { $fqdn:
        ensure => present,
        icon_image_alt => $operatingsystem,
        icon_image => "base/$operatingsystem.png",
        statusmap_image => "base/$operatingsystem.gd2",
	require => Class['icinga::packages']
      }

  #SSHd Check
  @@nagios_service { "check_ssh_${hostname}":
       check_command => "check_ssh!$fqdn",
       use => "generic-service",
       host_name => "$fqdn",
       service_description => "SSH",
       require => Class['icinga::packages']
  }

 #Check HTTP
 @@nagios_service { "check_http_${hostname}":
       check_command => "check_http!$fqdn",
       use => "generic-service",
       host_name => "$fqdn",
       service_description => "HTTP",
       require => Class['icinga::packages']
  }

 #Check Users
 @@nagios_service { "check_users_${hostname}":
       check_command => "check_users!20!50",
       use => "generic-service",
       host_name => "$fqdn",
       service_description => "Check Users",
       require => Class['icinga::packages']
  }
 
 #Check Load   
 @@nagios_service { "check_load_${hostname}":
       check_command => "check_load!5.0!4.0!3.0!10.0!6.0!4.0",
       use => "generic-service",
       host_name => "$fqdn",
       service_description => "Check Load",
       require => Class['icinga::packages']
  }

#Check Processes  
 @@nagios_service { "check_procs_${hostname}":
       check_command => "check_procs!250!400",
       use => "generic-service",
       host_name => "$fqdn",
       service_description => "Total Processes",
       require => Class['icinga::packages']
  }

#Check Diskspace
 @@nagios_service { "check_diskspace_${hostname}":
       check_command => "check_all_disks!20%!10%",
       use => "generic-service",
       host_name => "$fqdn",
       service_description => "Check Disk Space",
       require => Class['icinga::packages']
  }

}
