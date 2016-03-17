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
# date  :2016-03-03

import httpclient
import json, times
import strutils
import osproc

when isMainModule:
    const
        # http://weather.livedoor.com/forecast/rss/primary_area.xml
        areacode = "130010"
    let
        url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=" & areacode
        r = getContent url
        obj = parseJson r
        fore = obj["forecasts"]
        today = getTime().getLocalTime
        tom = today + initInterval(days=1)
        iso = today.format "yyyy-MM-dd"
        tomIso = tom.format "yyyy-MM-dd"
        (dt, _) = execCmdEx "date '+%s'"

    var
        od: string = "NaN"
        ot: string = "NaN"

    for f in fore.items:
        if f["date"].getStr == iso or f["date"].getStr == tomIso:
            let
                tmp = f["temperature"]
                mn = if $tmp["min"] == "null": "NaN" else: tmp["min"]["celsius"].getStr
                mx = if $tmp["max"] == "null": "NaN" else: tmp["max"]["celsius"].getStr
                output = @[f["telop"].getStr, mn, mx].join "\t"

            if f["date"].getStr == iso:
                od = output
            if f["date"].getStr == tomIso:
                ot =output

    stdout.write dt
    echo od
    echo ot
