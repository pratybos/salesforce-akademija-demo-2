#!/bin/bash
set -e

if [ "$#" -ne 6 ]; then
    echo "Illegal number of parameters[" "$#" "]"
    exit 1
fi

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
      -u)
        envAlias="$2"
        shift # past argument
        shift # past value
        ;;
      --sourceDir)
        sourceDir="$2"
        shift # past argument
        shift # past value
        ;;
      --metadataDir)
        metadataDir="$2"
        shift # past argument
        shift # past value
        ;;
      *)    # unknown option
        echo "Illegal parameter[" "$1" "]"
        exit 1
        ;;
  esac
done

mkdir -p $metadataDir

sfdx force:mdapi:retrieve -r  $metadataDir -k ./config/package.xml -u $envAlias \
  && rm -r -f $metadataDir/unpackaged \
  && unzip -q -o $metadataDir/unpackaged.zip -d $metadataDir

rm -r -f "${sourceDir:?}"/*

sfdx force:mdapi:convert -r $metadataDir -d $sourceDir