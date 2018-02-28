tests
testStringEndsWithSuffixCaseSensitive
	self shouldnt: ['string test' should endWith: 'test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['string test' should endWith: 'Test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['some test string' should endWith: 'test' caseSensitive: true] raise: SpecOfFailed