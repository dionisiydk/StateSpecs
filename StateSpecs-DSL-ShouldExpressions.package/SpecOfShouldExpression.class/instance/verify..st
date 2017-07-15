verification
verify: aSpecOfObjectState

	| result |
	aSpecOfObjectState denial: withNegation.
	result := aSpecOfObjectState validate: receiver.
	result isFailure ifTrue: [ result subjectOwner: receiverOwner ].
	result raise 