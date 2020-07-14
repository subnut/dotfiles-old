#!/usr/bin/env bash
set -e

main() {
  if [[ -n $2 ]]
  then cd $2
  else cd ~/Notes
  fi
  previous_file="$1"
  file_to_edit=`select_file $previous_file`

  if [ -n "$file_to_edit" ] ; then
    "$EDITOR" "$file_to_edit"
    main "$file_to_edit"
  fi
  cd -
}

select_file() {
  given_file="$1"
  fzf -f .md$ | fzf --cycle --preview="bat {} --color=always --style='plain' " --preview-window=right:70%:wrap --query="$given_file"

}

main "" $1
