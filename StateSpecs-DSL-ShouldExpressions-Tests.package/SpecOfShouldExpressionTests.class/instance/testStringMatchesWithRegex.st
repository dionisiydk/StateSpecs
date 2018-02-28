tests
testStringMatchesWithRegex
	self shouldnt: ['test string' should matchRegex: '^test'] raise: SpecOfFailed.
	self shouldnt: ['test string' should matchRegex: '^Test'] raise: SpecOfFailed.
	self should: ['some test string' should matchRegex: '^test'] raise: SpecOfFailed