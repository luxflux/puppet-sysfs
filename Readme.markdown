# Sysfs puppet module

Manage sysfs-settings on Debian and Red Hat based systems, it will reload sysfsutils
automatically

## Dependencies
  - [puppet-concat](https://github.com/ripienaar/puppet-concat)

## Example

    # enable ksm
    sysfs::setting {
        "kernel/mm/ksm/run":
            value => 1;
    }
