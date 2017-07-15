expressions
equal: anObject description: failureDescription
	| spec |
	spec := (SpecOfEquality to: anObject) .
	spec failureDescription: failureDescription.
	
	^self verify: spec