tests
testStringBeginsWithPrefixCaseSensitive
	self shouldnt: ['test string' should beginWith: 'test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['test string' should beginWith: 'Test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['some test string' should beginWith: 'test' caseSensitive: true] raise: SpecOfFailed