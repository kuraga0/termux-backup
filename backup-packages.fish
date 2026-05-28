#!/usr/bin/env fish

function usage
    echo "Usage: fish backup-packages.fish [backup|restore]"
    echo "  backup  <dir>    - create new backup"
    echo "  restore <file>   - restore from archive"
    exit 1
end

switch $argv[1]
    case backup
			  if test -z "$argv[2]"
            usage
        end
        dpkg --get-selections | grep -v deinstall | awk '{print $1}' > $argv[2]/termux_packages_(date +%Y-%m-%d_%H-%M).txt
    case restore
        if test -z "$argv[2]"
            usage
        end
        set file $argv[2]
        if not test -f "$file"
            echo "File not found: $file"
            exit 1
        end
        xargs apt install -y < "$file"

    case '*'
        usage
end
