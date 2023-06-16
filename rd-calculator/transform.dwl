%dw 2.0
output application/json
var amount = payload.amount
var durationInMonths = payload.durationInMonths
var interest = payload.interest

fun noOfMonthsInDeposit(n:Number):Number = durationInMonths - n
var interestpm = (interest as Number / 1200)

---
sum (
    1 to durationInMonths 
        map (
            amount * (interestpm) * (noOfMonthsInDeposit($$))
        )
    )