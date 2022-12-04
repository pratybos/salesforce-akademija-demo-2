#!/bin/bash
set -e

envAlias='' # do not set any default value
sourceDir=./force-app/
metadataDir=./tmp/scratch_metadata

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

[ -d $metadataDir ] || mkdir -p $metadataDir

rm -rf ${metadataDir:?}/*

sfdx force:source:convert \
  -d $metadataDir \
  -r $sourceDir

sfdx force:mdapi:deploy -d $metadataDir -u $envAlias
