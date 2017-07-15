tests
testShouldPassHaltSignalByDefault
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [Halt now]]
		raise: Halt