tests
testShouldPassInternalSpecFailedErrorByDefault
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [SpecOfFailed signal]]
		raise: SpecOfFailed