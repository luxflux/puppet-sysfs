class sysfs {

    ensure_packages(["sysfsutils"])

    case $osfamily {
    /^(Debian|Ubuntu)$/: {
      exec {
        "sysfsutils":
          command     => "/usr/sbin/service sysfsutils restart",
          refreshonly => true,
          subscribe   => Concat["/etc/sysfs.conf"];
      } 
    }

    'RedHat': { 
        exec { 'sysfsutils_reload_rhel':
          command => '/usr/bin/awk -F= \'/([^[:space:]]+)[[:space:]]*=([^[:space:]]+)/{cmd=sprintf("/bin/echo %s > /sys/%s",$2, $1); system(cmd)}\' /etc/sysfs.conf',
          refreshonly => true,
          subscribe => Concat['/etc/sysfs.conf'];
        } 
      } 
    }

    concat {
        "/etc/sysfs.conf":
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            require => Package["sysfsutils"];
    }
}
