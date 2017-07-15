expressions
be: anObject description: failureDescription
	| spec |
	spec := (SpecOfIdentity to: anObject).
	spec failureDescription: failureDescription.
	
	^self verify: spec