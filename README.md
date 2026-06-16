# Termux backup scripts

## Installation
``` sh
git clone https://github.com/kuraga0/termux-backup.git
cd termux-backup
```

## Usage
Backup termux files (`/data/data/com.termux`)
> note: some directories, including
/data/data/com.termux/files/usr/bin
/data/data/com.termux/files/usr/lib
/data/data/com.termux/files/usr/share
are in exclude.txt by default to save space

> caution: create the directory before backuping

``` sh
fish backup-files.fish backup ./Backups/ # optional: --exclude exclude.txt
```
Restore termux files:
``` sh
fish backup-files.fish restore Backups/<file>
```

Backup packages:
``` sh
fish backup-packages.fish backup ./Backups
```
Restore packages:
``` sh
fish backup-packages.fish restore Backups/<file>
```
