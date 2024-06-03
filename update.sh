#!/usr/bin/fish
read -P "Add to index:" add2Index
git add $add2Index
read -P "Commit message:" msg
git commit -m $msg
git status
