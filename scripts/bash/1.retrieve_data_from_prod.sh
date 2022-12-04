#!/bin/bash
set -e

bash ./scripts/bash/1.retrieve_data.sh \
  -u sf-akademija-prod \
  --metadataDir ./tmp/prod_metadata \
  --sourceDir ./tmp/prod_source
