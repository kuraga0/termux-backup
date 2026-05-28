# Termux backup scripts

## Installation
``` sh
git clone https://github.com/kuraga0/termux-backup.git /sdcard/Termux/
mkdir -p /sdcard/Termux/Backups
```

## Usage
Backup termux files (`/data/data/com.termux`)
*note: some directories, including 
./files/usr/bin 
./files/usr/lib 
./files/usr/share 
are in exclude.txt by default to save space
*
``` sh
fish backup-prefix.fish backup
```
Restore termux files:
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
