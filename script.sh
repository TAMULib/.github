#!/bin/bash

main() {
  local i=
  local result=
  local sources=$SOURCE_PATHS
  local destination="coveralls.json"

  sudo apt-get install jq -y
  result=$?

  if [[ $result -ne 0 ]] ; then
    return $result;
  fi

  if [[ $DESTINATION_PATH != "" ]] ; then
    destination="$DESTINATION_PATH"
  fi

  if [[ $sources == "" ]] ; then
    return 1;
  fi

  jq 'reduce inputs as $i (.; .source_files += $i.source_files)' $sources > $destination
  result=$?

  return $result;
}

main
