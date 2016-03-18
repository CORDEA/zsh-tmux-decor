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
# date  : 2016-02-29

. $HOME/.zsh/environment.sh

function switcher() {
    case "$1" in
        0*)
            echo -e "$zsh_gray_color`. $reuter_base/get.sh`\e[0m"
            ;;
        1*)
            echo -e "$zsh_gray_color`. $tweet_base/get.sh`\e[0m"
            ;;
        2*)
            echo -e "$zsh_gray_color`. $winfo_base/get.sh`\e[0m"
            ;;
        3*)
            echo -e "$zsh_gray_color`. $gmail_base/get.sh`\e[0m"
            ;;
    esac
}

for i in `cat $HOME/.zsh/zsh-env.txt`;do
    switcher $i
done
