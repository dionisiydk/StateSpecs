validation
validate: anObject 
	(self matches: anObject) ifTrue: [^SpecOfValidationResult success].
	^self validationFailureFor: anObject