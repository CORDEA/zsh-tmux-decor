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
        git*)
            printf 4
            ;;
        dir*)
            printf 5
            ;;
        *)
            printf 0
            ;;
    esac
}

p=()
for i in $@;do
    p+=(`parts $i`)
done

echo ${p[*]} > $HOME/.zsh/zsh-env.txt
