tests
testStringMatchesWithRegexCaseSensitive
	self shouldnt: ['test string' should matchRegex: '^test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['test string' should matchRegex: '^Test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['some test string' should matchRegex: '^test' caseSensitive: true] raise: SpecOfFailed