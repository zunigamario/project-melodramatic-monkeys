#!/bin/bash

for file in $(tmux ls)
do
    tmux kill-session -t "$file"
done
git fetch && git reset origin/main --hard
source python3-virtualenv/bin/activate
pip install -r requirements.txt

tmux new -d 'flask run --host=0.0.0.0'
