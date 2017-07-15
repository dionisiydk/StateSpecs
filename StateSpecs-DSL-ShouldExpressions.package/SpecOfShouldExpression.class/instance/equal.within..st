expressions
equal: aNumber within: accuracyNumber 
	^self verify: (SpecOfApproxEquality to: aNumber within: accuracyNumber)