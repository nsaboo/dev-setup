#!/bin/sh

SESSION_NAME="lena"

PROJECT_NAME="lena"

cd $HOME/dev/$PROJECT_NAME

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
  # Create the session
  tmux new-session -s ${SESSION_NAME} -n git -d

  # First window
  # git content tracker (1)
  tmux send-keys -t ${SESSION_NAME} 'cd lena-consumer; git status' C-m

  # node env (2)
  tmux new-window -n dev_server -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:2 'cd lena-consumer; npm dev-start' C-m

  # db (3)
  tmux new-window -n db -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:3 'cd lena-consumer; mysql -u root' C-m

  # test (4)
  tmux new-window -n test -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:4 'cd lena-consumer; npm test' C-m

  # inventory (5)
  tmux new-window -n inventory -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:5 'cd lena-inventory' C-m

  # orders (6)
  tmux new-window -n orders -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:6 'cd lena-orders' C-m

  # analytics (7)
  tmux new-window -n analytics -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:7 'cd lena-analytics' C-m

fi
tmux attach -t ${SESSION_NAME}
