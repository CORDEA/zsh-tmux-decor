#!/usr/bin/env python
# encoding:utf-8
#
# Copyright 2016 Yoshihiro Tanaka
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

__Author__ =  "Yoshihiro Tanaka <contact@cordea.jp>"
__date__   =  "2016-02-27"

from requests_oauthlib import OAuth1Session
import sys, json, commands
import re

def get_twitter(keys, screen_name):
    key, c_secret, token, t_secret = keys
    url = "https://api.twitter.com/1.1/statuses/user_timeline.json"

    params = {
                "screen_name": screen_name
                }

    twitter = OAuth1Session(key, c_secret, token, t_secret)
    response = twitter.get(url, params = params)

    if response.status_code == 200:
        body = response.json()
        print commands.getoutput("date '+%s'")
        for b in body:
            text = re.sub(r'[\n\r]', ' ', b["text"])
            text = re.sub(r'https:\/\/t\.co\/\w+', '', text)
            print text.encode('utf-8')

def main():
    key = "client key"
    c_sec = "client secret"
    token = "token"
    t_sec = "token secret"
    # Get specific user tweets.
    get_twitter((key, c_sec, token, t_sec), "Reuters_co_jp")

if __name__=='__main__':
    main()
