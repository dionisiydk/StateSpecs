tests
testStringWithSubstring
	| spec |
	spec := String withSubstring: 'test'.
	self assert: spec class = SpecOfSubstring.
	self assert: spec requiredValue = 'test'