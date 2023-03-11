#!/bin/bash

rm -rf source/_posts/*
cp -r $NOTES_PATH/* source/_posts/

rm -rf source/_posts/Daily\ Notes 
rm -rf source/_posts/Excalidraw/
rm -rf source/_posts/Day\ Planners
rm -rf source/_posts/logseq/
rm -rf source/_posts/journals/
rm -rf source/_posts/pages/
rm -rf source/_posts/Scripts/
rm -rf source/_posts/TEMPLATES/
rm -rf source/_posts/日记/
rm -rf source/_posts/阅读/
rm -rf source/_posts/信笺/
rm -rf source/_posts/*.md

npx hexo clean && hexo g && hexo server
