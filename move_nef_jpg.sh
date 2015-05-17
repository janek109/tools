#!/bin/bash

#W folderze np. /jakas/sciezka/022 sa zdjecia tj pliki JPG i NEF.
#Najpierw recznie wybieramy zdjecia w formacie JPG(szybciej niż operowac na raw-ach).
#Jak juz wybierzemy to w folderze zostaja tylko wybrane pliki JPG i duzo plikow NEF.
#Po uruchomieniu skryptu tworzy on folder o nazwie jpg_[nazwa aktualnego folderu] i nef_[nazwa aktualnego folderu] w tym wypadku jpg_022 i nef_022
#Skrypt przenosi pliki JPG do jpg_[nazwa aktualnego folderu] i im odpowiadające NEFy do nef_[nazwa aktualnego folderu]
#np. dla DSC_0354.JPG odpowiadający nef to DSC_0354.NEF
#pozostale NEF-y zostaja w folderze /jakas/sciezka/022

folder=$(pwd | sed -e 's/\/.*\///g');

jpgs=(*.JPG)

if [ ! -d "nef_$folder" ]; then
	mkdir nef_$folder;
fi

if [ ! -d "jpg_$folder" ]; then
	mkdir jpg_$folder;
fi

for jpg in "${jpgs[@]}"
do
    name=$(echo $jpg | tr -d "*.JPG");
    mv "$name.NEF" nef_$folder;
  	mv "$jpg" jpg_$folder;  
done
