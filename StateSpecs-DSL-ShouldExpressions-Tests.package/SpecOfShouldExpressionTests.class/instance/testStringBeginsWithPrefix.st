tests
testStringBeginsWithPrefix
	self shouldnt: ['test string' should beginWith: 'test'] raise: SpecOfFailed.
	self shouldnt: ['test string' should beginWith: 'Test'] raise: SpecOfFailed.
	self should: ['some test string' should beginWith: 'test'] raise: SpecOfFailed