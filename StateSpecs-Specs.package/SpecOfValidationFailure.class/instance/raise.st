accessing
raise
	| error |
	error := SpecOfFailed withReason: self.
	spec failureDescription ifNotNil: [ :desc | error messageText: desc].
	error signal