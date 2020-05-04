#!/bin/bash
# Setup after a fresh install

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=7200'
