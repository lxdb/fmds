#!/bin/bash

case $1 in
  
  rename)
     echo "rename"
     ;;
  move)
     echo "move"
     ;;
esac     


#--------------------------3gp-----------------------------#
set -x
PWD=`pwd`

tmp=`find -maxdepth 1 -mindepth 1 -type f | sed 's/\.\///1' | grep -i .3GP`
VIDEOARRAY=($tmp)

for ((i=0; i<=${#VIDEOARRAY[*]}; i++)) do
	NEUERNAME1=`exiftool "${VIDEOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5"-"$6}' | sed s'/:/_/g' | sed s'/+.....//g'`
	ORDNER1=`exiftool "${VIDEOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5}' | sed s'/:/_/g' | sed s'/+.....//g'`
    DAUER1=`exiftool "${VIDEOARRAY[$i]}" | grep "Track Duration" | awk '{print $4}' | sed s'/:/_/g' | sed s'/^0_//1' | sed s'/\.[0-9][0-9]//g'`
	DAUERS1=`exiftool "${VIDEOARRAY[$i]}" | grep "Track Duration" | awk '{print $4}' | sed s'/:/_/g' | sed s'/^0_//1' | sed s'/\.[0-9][0-9]//g' | wc -c `

	if [ "$DAUERS1" -eq "3" ]; then
		DAUER1=00_$DAUER
	elif [ "$DAUERS1" -eq "2" ]; then
		DAUER1=00_0$DAUER
	fi

	ZUFALLSZAHL1=`echo $((RANDOM%89+10))`

	echo "${VIDEOARRAY[$i]}" 
	echo "$NEUERNAME1"
    
    if [ $1 = "move" ]; then
        mkdir $ORDNER1
    fi
	
	if [ "$NEUERNAME1" != "" ]; then
		if [ "$NEUERNAME1" != "-" ]; then
			if [ $1 = "move" ]; then
			
			    if [ -f "$PWD/$ORDNER1/$NEUERNAME1-$DAUER1.3gp" ]; then
				    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$ORDNER1/$NEUERNAME1-$DAUER1-$ZUFALLSZAHL1.3gp"
			    fi
			    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$ORDNER1/$NEUERNAME1-$DAUER1.3gp"
			fi
			
			if [ $1 = "rename" ]; then
			    if [ -f "$PWD/$NEUERNAME1-$DAUER1.3gp" ]; then
				    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$NEUERNAME1-$DAUER1-$ZUFALLSZAHL1.3gp"
			    fi
                mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$NEUERNAME1-$DAUER1.3gp"
            fi
		fi
	fi

done



#----------------------AVI-------------------------

# Es wird nur im Atuellen Ordner umbenannt, nicht rekursiv
# Umbenennung von Videos in Folgendes Format YYYY_MM_DD-HH_MM_SS-DAUER
# aus grisenmipf.avi wird dann 2014_10_18-18_15_22-00_12.avi
# Author Florian Wright

set -x
PWD=`pwd`

tmp=`find -maxdepth 1 -mindepth 1 -type f | sed 's/\.\///1' | grep -i .AVI`
VIDEOARRAY=($tmp)

for ((i=0; i<=${#VIDEOARRAY[*]}; i++)) do
	NEUERNAME3=`exiftool "${VIDEOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5"-"$6}' | sed s'/:/_/g' | sed s'/+.....//g'`
        ORDNER3=`exiftool "${VIDEOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5}' | sed s'/:/_/g' | sed s'/+.....//g'`
	DAUER3=`exiftool "${VIDEOARRAY[$i]}" | grep "Track Duration" | awk '{print $4}' | sed s'/:/_/g' | sed s'/^0_//1' | sed s'/\.[0-9][0-9]//g'`
	DAUERS3=`exiftool "${VIDEOARRAY[$i]}" | grep "Track Duration" | awk '{print $4}' | sed s'/:/_/g' | sed s'/^0_//1' | sed s'/\.[0-9][0-9]//g' | wc -c `

	if [ "$DAUERS" -eq "3" ]; then
		DAUER3=00_$DAUER
	elif [ "$DAUERS" -eq "2" ]; then
		DAUER3=00_0$DAUER
	fi

	ZUFALLSZAHL3=`echo $((RANDOM%89+10))`

	echo "${VIDEOARRAY[$i]}" 
	echo "$NEUERNAME3"
    if [ $1 = "move" ]; then
        mkdir $ORDNER3
    fi    
	if [ "$NEUERNAME3" != "" ]; then
		if [ "$NEUERNAME3" != "-" ]; then
			if [ $1 = "move" ]; then
			    if [ -f "$PWD/$ORDNER3/$NEUERNAME3-$DAUER3.avi" ]; then
				    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$ORDNER3/$NEUERNAME3-$DAUER3-$ZUFALLSZAHL3.avi"
			    fi
		        mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$ORDNER3/$NEUERNAME3-$DAUER3.avi"
		    fi
		    
		    if [ $1 = "rename" ]; then
			    if [ -f "$PWD/$NEUERNAME3-$DAUER3.avi" ]; then
				    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$NEUERNAME3-$DAUER3-$ZUFALLSZAHL3.avi"
			    fi
		        mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$NEUERNAME3-$DAUER3.avi"
		    fi
		fi
	fi

done

#-----------------------MP4--------------------------------

# Es wird nur im Atuellen Ordner umbenannt, nicht rekursiv
# Umbenennung von Videos in Folgendes Format YYYY_MM_DD-HH_MM_SS-DAUER
# aus grisenmipf.mp4 wird dann 2014_10_18-18_15_22-00_12.mp4
# Author Florian Wright


set -x
PWD=`pwd`

tmp=`find -maxdepth 1 -mindepth 1 -type f | sed 's/\.\///1' | grep -i .MP4`
VIDEOARRAY=($tmp)

for ((i=0; i<=${#VIDEOARRAY[*]}; i++)) do
	NEUERNAME4=`exiftool "${VIDEOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5"-"$6}' | sed s'/:/_/g' | sed s'/+.....//g'`
    ORDNER4=`exiftool "${VIDEOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5}' | sed s'/:/_/g' | sed s'/+.....//g'`
	DAUER4=`exiftool "${VIDEOARRAY[$i]}" | grep "Track Duration" | awk '{print $4}' | sed s'/:/_/g' | sed s'/^0_//1' | sed s'/\.[0-9][0-9]//g'`
	DAUERS4=`exiftool "${VIDEOARRAY[$i]}" | grep "Track Duration" | awk '{print $4}' | sed s'/:/_/g' | sed s'/^0_//1' | sed s'/\.[0-9][0-9]//g' | wc -c `

	if [ "$DAUERS" -eq "3" ]; then
		DAUER4=00_$DAUER
	elif [ "$DAUERS" -eq "2" ]; then
		DAUER4=00_0$DAUER
	fi

	ZUFALLSZAHL4=`echo $((RANDOM%89+10))`

	echo "${VIDEOARRAY[$i]}" 
	echo "$NEUERNAME4"
    if [ $1 = "move" ]; then
        mkdir $ORDNER4
	fi
	if [ "$NEUERNAME4" != "" ]; then
		if [ "$NEUERNAME4" != "-" ]; then
			if [ $1 = "move" ]; then
			    if [ -f "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4.mp4" ]; then
				    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4-$ZUFALLSZAHL4.mp4"
			    fi
		        mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4.mp4"
		    fi
		    if [ $1 = "rename" ]; then
			    if [ -f "$PWD/$NEUERNAME4-$DAUER4.mp4" ]; then
				    mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$NEUERNAME4-$DAUER4-$ZUFALLSZAHL4.mp4"
			    fi
		        mv "$PWD/${VIDEOARRAY[$i]}" "$PWD/$NEUERNAME4-$DAUER4.mp4"
		    fi
		fi
	fi

done

#-----------------------JPG--------------------------------

# Es wird nur im Atuellen Ordner umbenannt, nicht rekursiv
# Umbenennung von Videos in Folgendes Format YYYY_MM_DD-HH_MM_SS-DAUER
# aus grisenmipf.JPG wird dann 2014_10_18-18_15_22.jpg
# Author Florian Wright


set -x
PWD=`pwd`

tmp=`find -maxdepth 1 -mindepth 1 -type f | sed 's/\.\///1' | grep -i .JPG`
FOTOARRAY=($tmp)

for ((i=0; i<=${#FOTOARRAY[*]}; i++)) do
	NEUERNAME4=`exiftool "${FOTOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5"-"$6}' | sed s'/:/_/g' | sed s'/+.....//g'`
    ORDNER4=`exiftool "${FOTOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5}' | sed s'/:/_/g' | sed s'/+.....//g'`
	
	ZUFALLSZAHL4=`echo $((RANDOM%89+10))`

	echo "${FOTOARRAY[$i]}" 
	echo "$NEUERNAME4"
    
    if [ $1 = "move" ]; then
        mkdir $ORDNER4
	fi
	
	if [ "$NEUERNAME4" != "" ]; then
		if [ "$NEUERNAME4" != "-" ]; then
			if [ $1 = "move" ]; then
			    if [ -f "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4.jpg" ]; then
				    mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4-$ZUFALLSZAHL4.jpg"
			    fi
		        mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4.jpg"
		    fi
		    if [ $1 = "rename" ]; then
			    if [ -f "$PWD/$NEUERNAME4-$DAUER4.jpg" ]; then
				    mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$NEUERNAME4-$DAUER4-$ZUFALLSZAHL4.jpg"
			    fi
		        mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$NEUERNAME4-$DAUER4.jpg"
		    fi
		fi
	fi

done

#-----------------------png--------------------------------

set -x
PWD=`pwd`

tmp=`find -maxdepth 1 -mindepth 1 -type f | sed 's/\.\///1' | grep -i .png`
FOTOARRAY=($tmp)

for ((i=0; i<=${#FOTOARRAY[*]}; i++)) do
	NEUERNAME4=`exiftool "${FOTOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5"-"$6}' | sed s'/:/_/g' | sed s'/+.....//g'`
    ORDNER4=`exiftool "${FOTOARRAY[$i]}" | grep "File Modification Date" | awk '{print $5}' | sed s'/:/_/g' | sed s'/+.....//g'`
	
	ZUFALLSZAHL4=`echo $((RANDOM%89+10))`

	echo "${FOTOARRAY[$i]}" 
	echo "$NEUERNAME4"
    
    if [ $1 = "move" ]; then
        mkdir $ORDNER4
	fi
	
	if [ "$NEUERNAME4" != "" ]; then
		if [ "$NEUERNAME4" != "-" ]; then
			if [ $1 = "move" ]; then
			    if [ -f "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4.png" ]; then
				    mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4-$ZUFALLSZAHL4.png"
			    fi
		        mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$ORDNER4/$NEUERNAME4-$DAUER4.png"
		    fi
		    if [ $1 = "rename" ]; then
			    if [ -f "$PWD/$NEUERNAME4-$DAUER4.png" ]; then
				    mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$NEUERNAME4-$DAUER4-$ZUFALLSZAHL4.png"
			    fi
		        mv "$PWD/${FOTOARRAY[$i]}" "$PWD/$NEUERNAME4-$DAUER4.png"
		    fi
		fi
	fi

done

