%dw 2.0
output text/plain
import * from dw::core::Strings

var approxEmi = payload.monthlyIncome as Number * payload.borrowingCapacity as Number
var denominator = 100 + (payload.durationInYears as Number * payload.interest as Number)
var numerator = (approxEmi as Number * payload.durationInYears as Number * 1200)
var principal = numerator / denominator

var integerPart = (principal as String splitBy ".")[0] reduce ($$ ++ $) 
var fractionalPart = ((principal as String {format: "#.##"} splitBy ".")[1])
var reversedArray = (reverse(integerPart as String) splitBy "" )
fun isCommaNeeded(n:Number):Boolean = (n > 0) and (n mod 2) == 0 and (n+1 != sizeOf(reversedArray))
var arrayWithCommas = reversedArray map if(isCommaNeeded($$)) "," ++ $ else $ 
var result = arrayWithCommas reduce ((item, accumulator="") -> item ++ accumulator) ++ (if((fractionalPart)!=null) ".$(fractionalPart)" else "" )
---
"You're eligible for a Principal amount of Rs " ++ result

