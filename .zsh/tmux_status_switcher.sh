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

function parts() {
    case "$1" in
        reuter*)
            printf 0
            ;;
        twitter*)
            printf 1
            ;;
        weather*)
            printf 2
            ;;
        gmail*)
            printf 3
            ;;
        *)
            printf 0
            ;;
    esac
}

left=`parts $1`
right=`parts $2`

printf "$left $right" > $tmux_env
