tests
testMatchesWhenUnexpectedFailuresShouldBePassed
	| spec |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	spec passUnexpectedFailures.
	
	self assert: (spec matches: 
					[1 / 0.
					self error: 'continue']).
	self deny: (spec matches: [1 + 2]).
	self should: [spec matches: [#() at: 1]] raise: Error