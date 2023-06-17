%dw 2.0
output application/json
import * from dw::core::Strings
var reversedArray = (reverse(payload.number as String) splitBy "" )
fun isCommaNeeded(n:Number):Boolean = (n > 0) and (n mod 2) == 0 and (n+1 != sizeOf(reversedArray))
var arrayWithCommas = reversedArray map if(isCommaNeeded($$)) "," ++ $ else $ 
---
arrayWithCommas reduce ((item, accumulator="") -> item ++ accumulator) 
