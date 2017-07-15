tests
testShouldPassDeprecationSignalByDefault
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [self deprecated: 'test']]
		raise: Deprecation