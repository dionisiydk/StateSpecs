tests
testStringMatchingCaseSensitiveRegex
	| spec |
	spec := String matchingCaseSensitiveRegex: 'test'.
	self assert: spec class = SpecOfStringRegex.
	self assert: spec requiredValue = 'test'.
	self assert: spec caseSensitive