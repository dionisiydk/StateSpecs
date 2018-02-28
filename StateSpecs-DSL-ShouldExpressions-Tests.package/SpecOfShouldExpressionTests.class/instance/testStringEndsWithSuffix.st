tests
testStringEndsWithSuffix
	self shouldnt: ['string test' should endWith: 'test'] raise: SpecOfFailed.
	self shouldnt: ['string test' should endWith: 'Test'] raise: SpecOfFailed.
	self should: ['some test string' should endWith: 'test'] raise: SpecOfFailed