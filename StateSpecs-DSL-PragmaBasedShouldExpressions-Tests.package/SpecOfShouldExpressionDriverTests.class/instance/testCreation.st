tests
testCreation
	| driver |
	driver := SpecOfShouldExpressionDriver on: #pragmas.
	self assert: driver targetPragmas == #pragmas