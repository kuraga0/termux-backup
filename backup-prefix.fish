#!/usr/bin/env fish

set backup_dir /sdcard/Termux/Backups
set termux_dir /data/data/com.termux
set exclude_file /sdcard/Termux/exclude.txt

function usage
    echo "Usage: backup.fish [backup|restore] [archive]"
    echo "  backup           - create new backup"
    echo "  restore <file>   - restore from archive"
    exit 1
end

switch $argv[1]
    case backup
        cd $termux_dir
        tar -cv \
            --ignore-failed-read \
            --warning=no-file-changed \
            --exclude-from=$exclude_file \
            ./ | zstd -T0 -4 -o $backup_dir/(date +%Y_%m_%d_%H-%M).tar.zst

    case restore
        if test -z "$argv[2]"
            usage
        end
        set archive $argv[2]
        if not test -f $archive
            echo "File not found: $archive"
            exit 1
        end
        zstd -d -c $archive | tar -xv -C $termux_dir

    case '*'
        usage
end

#tar -cv --ignore-failed-read --warning=no-file-changed --exclude-from=$HOME/backup-stuff/exclude.txt $HOME/../.. | zstd -T0 -5 -o /sdcard/Termux/Backup/(date +%Y_%m_%d_%H-%M).tar.zst
