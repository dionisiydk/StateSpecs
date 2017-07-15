tests
testCreation
	| path |
	path := SpecOfShouldExpressionPath clause: #clause arguments: #args.
	self assert: path clause == #clause.
	self assert: path arguments == #args