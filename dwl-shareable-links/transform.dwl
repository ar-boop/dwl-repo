%dw 2.0
output text/plain
var fixedPart = "https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo="
var ghrepo = payload.repo replace "/" with "%2F"
var path = payload.path replace  "/" with "%2F"
---
fixedPart ++ ghrepo ++ "&path=" ++ path