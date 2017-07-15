validation
validate: anObject 
	| result |
	specs do: [:spec | 
			result := spec denial: denial not; validate: anObject.
			result isFailure ifTrue: [^result]].
	^SpecOfValidationResult success