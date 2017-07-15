verification
verify: aSpecOfObjectState

	| result |
	aSpecOfObjectState denial: withNegation.
	result := aSpecOfObjectState validate: receiver value.
	result isFailure ifTrue: [ result subjectOwner: receiver ].
	result raise 