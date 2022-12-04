#!/bin/bash

sfdx force:org:create -d 30 -s -f config/project-scratch-def.json -a sf-akademija-scratch -v sf-akademija-prod

sfdx force:package:install --package 04t6M000000kmDsQAI -u sf-akademija-scratch