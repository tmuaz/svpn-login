#!/usr/bin/env bash

echo 'copy(document.cookie.match(/MRHSession=(.*?); /)[1])' | xclip -sel clip
