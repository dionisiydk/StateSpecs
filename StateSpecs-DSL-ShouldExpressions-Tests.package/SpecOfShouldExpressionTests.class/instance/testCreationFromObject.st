tests
testCreationFromObject
	| subject result |
	subject := Object new.
	result := subject should.
	self assert: (result isKindOf: SpecOfShouldExpression).
	self assert: result receiver == subject