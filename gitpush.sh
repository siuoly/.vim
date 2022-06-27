#!/bin/bash
cp ../.zshrc .
git add .;echo "message? "; read message ; git commit -m "$message"; git push
