#!/bib/bash
set -e

sfdx force:auth:web:login --setalias sf-akademija-prod --instanceurl https://login.salesforce.com

sfdx force:auth:web:login --setalias sf-akademija-uat --instanceurl https://test.salesforce.com

sfdx force:auth:web:login --setalias sf-akademija-sandbox --instanceurl https://test.salesforce.com
