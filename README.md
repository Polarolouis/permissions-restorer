# permissions-restorer
permissions-restorer.sh is an utility script to restore permissions recursively in a folder.
To use it you **MUST HAVE A BACKUP** with correct permissions to act as a reference.

*If you are looking to restore deleted files check out **PhotoRec** and **TestDisk**.* 

## How to use?
First you must clone the repository so run:

```bash
git clone https://github.com/Polarolouis/permissions-restorer.git
```

Go in the folder and chmod the script to make it executable:

```bash
chmod +x permissions-restorer.sh
```

Then you can use the script as follows:

```
permissions-restorer.sh REFERENCE TARGET

Arguments:
REFERENCE: the root folder with corrects permissions
TARGET: the root folder for which the permissions needs to be adjusted
```