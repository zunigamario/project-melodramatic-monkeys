#!/bin/bash

for file in $(tmux ls)
do
    tmux kill-session -t "$file"
done
cd project-melodramatic-monkeys
git fetch && git reset origin/main --hard
source python3-virtualenv/bin/activate
pip install -r requirements.txt

tmux new
tmux detach
tmux cd project-melodramatic-monkeys
tmux source python3-virtualenv/bin/activate
tmux flask run --host=0.0.0.0
