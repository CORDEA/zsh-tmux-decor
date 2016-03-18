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
# date  : 2016-02-28

. $HOME/.zsh/environment.sh

function output() {
    line=`. $1`
    if [ "$2" = "right" ];then
        printf $line
    else
        printf $line
    fi
}

function switcher() {
    sw=""
    case "$1" in
        left*)
            sw=`cut -d ' ' -f 1 $tmux_env`
            ;;
        right*)
            sw=`cut -d ' ' -f 2 $tmux_env`
            ;;
            *)
            exit 1
            ;;
    esac
    case "$sw" in
        0*)
            output "$reuter_base/get.sh" $1
            ;;
        1*)
            output "$tweet_base/get.sh" $1
            ;;
        2*)
            output "$winfo_base/get.sh" $1
            ;;
        3*)
            output "$gmail_base/get.sh" $1
            ;;
    esac
}

switcher $1
