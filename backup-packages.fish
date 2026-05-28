#!/usr/bin/env fish

set backup_dir /sdcard/Termux/Backups

function usage
    echo "Usage: fish backup-packages.fish [backup|restore]"
    echo "  backup           - create new backup"
    echo "  restore <file>   - restore from archive"
    exit 1
end

switch $argv[1]
    case backup
        dpkg --get-selections | grep -v deinstall | awk '{print $1}' > /sdcard/Termux/Backups/packages_(date +%Y_%m_%d_%H-%M).txt
    case restore
        if test -z "$argv[2]"
            usage
        end
        set archive $argv[2]
        if not test -f $archive
            echo "File not found: $archive"
            exit 1
        end
        xargs apt install -y < $archive

    case '*'
        usage
end
