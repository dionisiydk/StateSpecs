validation
validatePropertyBy: aSpecOfBooleanProperty

	| result |
	result := aSpecOfBooleanProperty validate: subject value.
	result isFailure ifTrue: [ result subjectOwner: subject ].
	
	result raise