validation
validate: anObject 
	| result |
	specs do: [:eachSpec |
		result := eachSpec validate: anObject.
		result isFailure ifTrue: [^result]].
	
	^SpecOfValidationResult success