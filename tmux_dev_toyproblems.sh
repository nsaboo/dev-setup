#!/bin/sh

SESSION_NAME="dev_toy_problems"

PROJECT_NAME="hrsf81-toy-problems"

cd $HOME/dev/$PROJECT_NAME

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  # Create the session
  tmux new-session -s ${SESSION_NAME} -n git -d

  # First window
  # git content tracker (1)
  tmux send-keys -t ${SESSION_NAME} 'git status' C-m

  # node env (2)
  tmux new-window -n dev_server -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:2 'pwd' C-m

fi
tmux attach -t ${SESSION_NAME}
