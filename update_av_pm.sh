#!/bin/bash

# Simple script I use to call UBCD's antivirus update package-creation scripts and then copy them over to my non-UBCD pmagic tree.

if [ -d /M/UBCD ]; then
	M='/M'
elif [ -d /media/MULTIBOOT/multiboot/UBCD ]; then
	M='/media/MULTIBOOT/multiboot'
else
	echo 'Cannot find /media/MULTIBOOT/multiboot/UBCD!'
	exit 1
fi

cd $M/UBCD/ubcd/tools/linux/antivirus

bash clamav.sh
bash fprot.sh

echo '===============================================================
Finished updating txz packages of antivirus definitions.
Syncing them with non-UBCD "partedmagic/" tree...'

rsync -av $M/UBCD/pmagic/pmodules/*.txz $M/partedmagic/pmagic/pmodules/

echo 'DONE!'
