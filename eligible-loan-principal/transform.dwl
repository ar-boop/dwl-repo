%dw 2.0
output application/json
import * from dw::core::Strings

var approxEmi = payload.monthlyIncome as Number * payload.borrowingCapacity as Number
var denominator = 100 + (payload.durationInYears as Number * payload.interest as Number)
var numerator = (approxEmi as Number * payload.durationInYears as Number * 1200)
var principal = numerator / denominator

var reversedArray = (reverse(principal as String) splitBy "" )
fun isCommaNeeded(n:Number):Boolean = (n > 0) and (n mod 2) == 0 and (n+1 != sizeOf(reversedArray))
var arrayWithCommas = reversedArray map if(isCommaNeeded($$)) "," ++ $ else $ 
var result = arrayWithCommas reduce ((item, accumulator="") -> item ++ accumulator) 
---
"You're eligible for a Principal amount of Rs " ++ result ++"."

