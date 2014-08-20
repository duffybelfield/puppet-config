node 'puppet'{
    include icinga::icinga
 #   class { 'apache':  }
 #   include 'awstats'
}



node default{	
    include icinga::observed
 #   class { 'apache':  }
 #   include 'awstats'
}
