tests
testMatches
	| spec |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	self 
		assert: (spec matches: 
					[1 / 0.
					self error: 'continue']).
	self deny: (spec matches: [1 + 2]).
	self deny: (spec matches: [#() at: 1])