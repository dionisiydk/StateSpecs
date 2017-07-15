tests
testHasProgressByDefault
	| driver |
	driver := SpecOfShouldExpressionDriver new.
	self assert: driver progress = 0