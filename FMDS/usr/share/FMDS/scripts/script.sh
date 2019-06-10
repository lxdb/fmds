FILENAME=`cat $HOME/.cache/fmds_path`
exiftool $FILENAME | grep "File Modification Date" | awk '{print}' | sed s'/:/_/g' | sed s'/+.....//g' > $HOME/.cache/fmds_mime
exiftool $FILENAME | grep "File Name" | awk '{print}' | sed s'/:/_/g' | sed s'/+.....//g' >> $HOME/.cache/fmds_mime
exiftool $FILENAME | grep "MIME Type" | awk '{print}' | sed s'/:/_/g' | sed s'/+.....//g' >> $HOME/.cache/fmds_mime
exit 1
