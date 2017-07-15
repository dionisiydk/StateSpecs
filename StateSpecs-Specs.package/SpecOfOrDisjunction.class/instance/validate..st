validation
validate: anObject 
	| result |
	
	specs do: [:eachSpec | 
		result := eachSpec validate: anObject.
		result isSuccess ifTrue: [^result]].
	
	^SpecOfValidationResult failed: self for: anObject