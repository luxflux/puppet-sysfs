class sysfs {

    include concat::setup

    ensure_packages(["sysfsutils"])

    case $osfamily {
    /^(Debian|Ubuntu)$/: {
      exec {
        "sysfsutils":
          command     => "/usr/sbin/service sysfsutils restart",
          refreshonly => true,
          subscribe   => File["/etc/sysfs.conf"];
      } 
    }

    'RedHat': { 
        exec { 'sysfsutils_reload_rhel':
          command => '/usr/bin/awk -F= \'/(\S+)\s*=(\S+)/{cmd=sprintf("/bin/echo %s > /sys/%s",$2, $1); system(cmd)}\' /etc/sysfs.conf',
          refreshonly => true,
          subscribe => File['/etc/sysfs.conf'];
        } 
      } 
    }

    concat {
        "/etc/sysfs.conf":
            owner   => root,
            group   => root,
            mode    => 644,
            require => Package["sysfsutils"];
    }
}
