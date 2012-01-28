# Sysfs puppet module

Manage sysfs-settings on Debian/Ubuntu, it will reload sysfsutils
automatically

## Dependencies
  - [https://github.com/ripienaar/puppet-concat|puppet-concat]

## Example

    # enable ksm
    sysfs::setting {
        "kernel/mm/ksm/run":
            value => 1;
    }
