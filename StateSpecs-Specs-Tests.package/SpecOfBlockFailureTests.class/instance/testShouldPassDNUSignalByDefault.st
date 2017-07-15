tests
testShouldPassDNUSignalByDefault
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [1 someMessage]]
		raise: MessageNotUnderstood 