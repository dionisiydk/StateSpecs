tests
testStringMatchingRegex
	| spec |
	spec := String matchingRegex: 'test'.
	self assert: spec class = SpecOfStringRegex.
	self assert: spec requiredValue = 'test'