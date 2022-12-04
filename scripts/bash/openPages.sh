#!/bin/bash
set -e

envAlias='sf-akademija-prod'

homepage='/'
deploymentPage='/lightning/setup/DeployStatus/home'
apexJobPage='/lightning/setup/AsyncApexJobs/home'

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
      -u)
        envAlias="$2"
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

sfdx force:org:open -u "$envAlias" -p "$homepage"
sfdx force:org:open -u "$envAlias" -p "$deploymentPage"
sfdx force:org:open -u "$envAlias" -p "$apexJobPage"