#!/bin/bash
# encoding:utf-8
#
# Copyright [2015] [Yoshihiro Tanaka]
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# Author: Yoshihiro Tanaka <contact@cordea.jp>
# date  : 2016-02-27

winfo_base=$HOME/.zsh/zsh-weather
reuter_base=$HOME/.zsh/tmux-reuter
tweet_base=$HOME/.zsh/zsh-twitter
gmail_base=$HOME/.zsh/zsh-gmail
github_base=$HOME/.zsh/zsh-github

zsh_env=$HOME/.zsh/zsh-env.txt
tmux_env=$HOME/.zsh/tmux-env.txt

zsh_gray_color="\e[38;5;245m"

gmail_period=600
reuter_period=1800
tweet_period=600
weather_period=3600
github_period=300
