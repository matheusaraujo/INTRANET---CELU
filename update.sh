#!/bin/bash

git add ./App_Code
git add ./App_Data
git add ./App_Images
git add ./App_Page
git add ./App_Script
git add ./App_Style
git add ./index.htm
git add ./left.htm
git add ./README
git add ./top.htm
git add ./web.config

git commit -m $1
git push -u origin master
