tests
testStringWithCaseSensitiveSubstring
	| spec |
	spec := String withCaseSensitiveSubstring: 'test'.
	self assert: spec class = SpecOfSubstring.
	self assert: spec requiredValue = 'test'.
	self assert: spec caseSensitive