define sysfs::setting($value) {

    include sysfs

    concat::fragment {
        "${name}":
            target => "/etc/sysfs.conf",
            content => "${name}=${value}\n";
    }
}
