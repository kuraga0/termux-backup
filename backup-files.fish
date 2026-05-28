#!/usr/bin/env fish

set termux_dir /data/data/com.termux
set exclude_file "exclude.txt"

set -l custom_exclude ""

for i in (seq (count $argv))
    if test "$argv[$i]" = "--exclude"
        set custom_exclude $argv[(math $i + 1)]
    end
end

function usage
    echo "Usage: fish backup.fish [backup|restore] [archive]"
    echo "  backup  <dir>    - create new backup"
    echo "  restore <file>   - restore from archive"
    exit 1
end

switch $argv[1]
    case backup
        set -l out_dir (realpath "$argv[2]")
        set -l out_file "$out_dir/$(date +%Y_%m_%d_%H-%M).tar.zst"

        tar -cv \
            --ignore-failed-read \
            --warning=no-file-changed \
            --exclude="$out_dir/*.tar.zst" \
            (test -n "$custom_exclude"; and echo --exclude-from=$custom_exclude; or test -f $exclude_file; and echo --exclude-from=$exclude_file) \
            $termux_dir | zstd -T0 -4 -o $out_file

    case restore
        if test -z "$argv[2]"
            usage
        end

        set archive $argv[2]

        if not test -f "$archive"
            echo "File not found: $archive"
            exit 1
        end

        zstd -d -c "$archive" | tar -xv -C $termux_dir

    case '*'
        usage
end
