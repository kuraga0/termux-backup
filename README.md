# Termux backup scripts

## Installation
``` sh
mkdir -p /sdcard/Termux/Backups
git clone https://github.com/kuraga0/termux-backup.git /sdcard/Termux/
```

## Usage
Backup prefix (`/data/data/com.termux`)
``` sh
fish backup-prefix.fish backup
```
Restore prefix:
``` sh
fish backup-prefix.fish restore Backups/<file>
```

Backup packages:
``` sh
fish backup-packages.fish backup
```
Restore packages:
``` sh
fish backup-packages.fish restore Backups/<file>
```

By default all scripts use `/sdcard/Termux/Backups`.
To change that, edit `backup_dir` in scripts code.
