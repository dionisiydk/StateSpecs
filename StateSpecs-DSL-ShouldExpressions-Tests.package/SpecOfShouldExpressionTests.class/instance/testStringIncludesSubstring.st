tests
testStringIncludesSubstring
	self shouldnt: ['some test string' should includeSubstring: 'test'] raise: SpecOfFailed.
	self shouldnt: ['some test string' should includeSubstring: 'Test'] raise: SpecOfFailed.
	self should: ['some string' should includeSubstring: 'test'] raise: SpecOfFailed