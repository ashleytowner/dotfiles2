function confirm {
  echo "$1 [Y/n]"
  read confirmation
  if [[ $confirmation = 'Y' || $confirmation = 'y' ]]; then
    return 0
  fi
  return 1
}
