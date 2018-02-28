tests
testStringIncludesSubstringCaseSensitive
	self shouldnt: [
		'some test string' should includeSubstring: 'test' caseSensitive: true] raise: SpecOfFailed.
	self should: [
		'some test string' should includeSubstring: 'Test'  caseSensitive: true] raise: SpecOfFailed.
	self should: [
		'some string' should includeSubstring: 'test' caseSensitive: true] raise: SpecOfFailed