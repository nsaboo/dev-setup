#!/bin/sh

SESSION_NAME="dev_greenfield"

PROJECT_NAME="hrsf81-grazers"

cd $HOME/dev/greenfield/$PROJECT_NAME

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  # Create the session
  tmux new-session -s ${SESSION_NAME} -n install -d

  # First window (0) 
  # install/build/general
  tmux send-keys -t ${SESSION_NAME} 'pwd' C-m

  # git version control (1)
  tmux new-window -n git -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:1 'git status' C-m

  # dev server (2)
  tmux new-window -n dev_server -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:2 'npm run server-dev' C-m

  # dev webpack (3)
  tmux new-window -n dev_webpack -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:3 'npm run ng-dev' C-m

  # dev database (4)
  tmux new-window -n dev_db -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:4 'psql' C-m

  # logs server/client (5)
  tmux new-window -n dev_logs -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:5 'tail -f logs/foo/*log' C-m
  tmux split-window -v -t ${SESSION_NAME}:5
  tmux send-keys -t ${SESSION_NAME}:5.1 'tail -f logs/bar/*log' C-m

  # dev test (6)
  tmux new-window -n webpack_dev_server -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:6 'npm test' C-m

  # Start out on the first window when we attach
  tmux select-window -t ${SESSION_NAME}:0
fi
tmux attach -t ${SESSION_NAME}
