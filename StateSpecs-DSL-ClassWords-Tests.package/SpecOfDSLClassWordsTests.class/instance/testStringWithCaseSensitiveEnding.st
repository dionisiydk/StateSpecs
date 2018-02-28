tests
testStringWithCaseSensitiveEnding
	| spec |
	spec := String withCaseSensitiveEnding: 'test'.
	self assert: spec class = SpecOfStringEnding.
	self assert: spec requiredValue = 'test'.
	self assert: spec caseSensitive