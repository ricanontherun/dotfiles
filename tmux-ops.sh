#! /bin/sh

if tmux has-session -t ops 2>/dev/null; then
    echo "attaching to existing ops session"
    tmux attach-session -t ops
else
    tmux new-session -d -s ops
    tmux renamew ops
    tmux split-window -h
    tmux send-keys -t .0 "top" Enter
    tmux send-keys -t .1 "watch -n 5 nvidia-smi" Enter
    tmux attach-session -t ops
fi
