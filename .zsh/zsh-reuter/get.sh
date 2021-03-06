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

. $HOME/.zsh/environment.sh

reuter_file="$reuter_base/response.txt"

if [ ! -f $reuter_file ]; then
    exit 0
fi

max=$(expr `cat $reuter_file | wc -l | sed "s/ //"` - 1)
random=`expr \( $RANDOM % $max \) + 1`
printf "$(head -n `expr $random + 1` $reuter_file | tail -n 1)"
