# Copyright 2016 Yoshihiro Tanaka
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

  # http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Yoshihiro Tanaka <contact@cordea.jp>
# date  :2016-03-02

import httpclient
import uri
import strutils
import json, os

type
    GetType = enum
        tIssue, tPull

proc headers(token: string): string =
    var headers = "Accept:application/vnd.github.full+json\c\L"
    headers = headers & "Authorization:token " & token & "\c\L"
    return headers

proc jParse(jsonStr: string, gType: GetType) =
    let
        obj = parseJson jsonStr

    for j in obj.items:
        var
            assign: string = nil
            creator: string = nil
            comments: string = "NaN"

        if $j["assignee"] != "null":
            assign = j["assignee"]["login"].getStr
        if $j["user"] != "null":
            creator = j["user"]["login"].getStr
        let
            url = j["url"].getStr
            title = j["title"].getStr
            body = j["body"].getStr

        if gType == GetType.tIssue:
            comments = j["comments"].getStr 

        if not assign.isNil:
            echo assign
        if not creator.isNil:
            echo creator
        
        let results = [url, title, comments]
        echo results.join "\t"

proc pull(baseUrl: Uri, headers: string) =
    let
        url = baseUrl / "pulls"
        r = getContent($url, extraHeaders = headers, maxRedirects = 2)
    jParse(r, GetType.tPull)

proc issue(baseUrl: Uri, headers: string) =
    let
        url = baseUrl / "issues"
        r = getContent($url, extraHeaders = headers, maxRedirects = 2)
    jParse(r, GetType.tIssue)

when isMainModule:
    let
        token = "token"
        baseurl = "api base url" 
        rep = "target rep"
        url = ((parseUri(baseurl) / "repos") / rep)

    issue(url, headers(token))
