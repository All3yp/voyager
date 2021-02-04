#!/bin/bash

URL=$1;
EXT=$2;

count=0

#echo -e "\nV O Y A G E R\n";

python3 opt/banner.py

if [[ -z "$URL" ]] || [[ -z "$EXT" ]] ; then
        echo "----------------------------------------------"
        echo "Support pdf, doc, docx, xls, xlsx, ppt, pptx"
        echo "USAGE: ./voyager <target_url> <file_extension>"
        echo "----------------------------------------------"

else
        echo -ne "\n"
        until [ $count -gt 2 ]
        do
                ((count=count+1));

                echo -ne "Searching"
                sleep 0.5
                echo -ne "\r\033[K" #esse echo limpa a ultima linha printada
                echo -ne "Searching."
                sleep 0.5
                echo -ne "\r\033[K"
                echo -ne "Searching.."
                sleep 0.5
                echo -ne "\r\033[K"
                echo -ne "Searching..."
                sleep 0.5
                echo -ne "\r\033[K"
        done

        echo -e "Results:\n"
     lynx --dump "http://www.google.com/search?&q=site:$URL+ext:$EXT" | grep ".$EXT" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//'

fi
