#!/bin/sh

SESSION_NAME="dev_greenfield"

PROJECT_NAME="hrsf81-grazers"

cd $HOME/dev/greenfield/$PROJECT_NAME

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  # Create the session
  tmux new-session -s ${SESSION_NAME} -n install -d

  # First window (1) 
  # install/build/general
  tmux send-keys -t ${SESSION_NAME} 'pwd' C-m

  # git version control (2)
  tmux new-window -n git -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:2 'git status' C-m

  # dev server (3)
  tmux new-window -n dev_server -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:3 'npm run server-dev' C-m

  # dev webpack (4)
  tmux new-window -n dev_webpack -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:4 'npm run ng-dev' C-m

  # dev database (5)
  tmux new-window -n dev_db -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:5 'psql' C-m

  # dev logs server/client (6)
  tmux new-window -n dev_logs -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:6 'tail -f logs/foo/*log' C-m
  tmux split-window -v -t ${SESSION_NAME}:6
  tmux send-keys -t ${SESSION_NAME}:6.1 'tail -f logs/bar/*log' C-m

  # dev test (7)
  tmux new-window -n dev_test -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:7 'npm test' C-m

  # Start out on the first window when we attach
  tmux select-window -t ${SESSION_NAME}:1
fi
tmux attach -t ${SESSION_NAME}
