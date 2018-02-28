expressions
be: anObject description: failureDescription
	| spec |
	spec := (SpecOfIdentity requiredValue: anObject).
	spec failureDescription: failureDescription.
	
	^self verify: spec