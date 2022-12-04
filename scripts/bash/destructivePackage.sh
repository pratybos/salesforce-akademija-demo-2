#!/bin/bash
set -e

envAlias='' # do not set any default value
sourceDir=./migration/destructive/
metadataDir=./tmp/destructive_metadata
metadataDirTmp=./tmp/destructive_package
sourceDirTmp=./playground/destructive/tmp

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

[[ -z "$envAlias" ]] && { echo "Env is not set" ; exit 1; }
[[ -z "$metadataDir" ]] && { echo "Metadata dir is not set" ; exit 1; }
[[ -z "$sourceDir" ]] && { echo "Source dir is not set" ; exit 1; }

[ -d $sourceDirTmp ] || mkdir -p $sourceDirTmp
rm -rf ${sourceDirTmp:?}/*

[ -d $metadataDir ] || mkdir -p $metadataDir
rm -rf ${metadataDir:?}/*

[ -d $metadataDirTmp ] || mkdir -p $metadataDirTmp
rm -rf ${metadataDirTmp:?}/*

cp -r "$sourceDir"/*  "$sourceDirTmp"

sfdx force:source:convert \
  -d "$metadataDirTmp" \
  -r "$sourceDirTmp"

mv "$metadataDirTmp"/package.xml "$metadataDir"/destructiveChanges.xml

rm -rf ${metadataDirTmp:?}/*
rm -rf ${sourceDirTmp:?}/*

cat <<EOT > "$metadataDir"/package.xml
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
  <version>52.0</version>
</Package>
EOT

echo "### run following command to deploy destructive changes:"
echo "# sfdx force:mdapi:deploy -d $metadataDir -u $envAlias"
