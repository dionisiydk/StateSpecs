expressions
equal: anObject description: failureDescription
	| spec |
	spec := (SpecOfEquality requiredValue: anObject) .
	spec failureDescription: failureDescription.
	
	^self verify: spec