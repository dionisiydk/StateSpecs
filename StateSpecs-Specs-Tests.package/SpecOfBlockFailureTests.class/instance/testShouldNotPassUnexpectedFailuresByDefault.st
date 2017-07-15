tests
testShouldNotPassUnexpectedFailuresByDefault

	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	
	self deny: spec shouldPassUnexpectedFailures 