if [ ! $TMUX ]
then
  if [ $(pgrep tmux) ]
  then
    tmux a
  else
    tmux new
  fi
fi
