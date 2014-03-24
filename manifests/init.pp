class sysfs {

    include concat::setup

    package {
        "sysfsutils":
            ensure => installed;
    }

    exec {
        "sysfsutils":
            command     => "/usr/sbin/service sysfsutils restart",
            refreshonly => true,
            subscribe   => File["/etc/sysfs.conf"];
    }

    concat {
        "/etc/sysfs.conf":
            owner   => root,
            group   => root,
            mode    => 644,
            require => Package["sysfsutils"];
    }
}
