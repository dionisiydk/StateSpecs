tests
testRaiseUnexpectedMessageWhenTooMuchMessages
	| driver result expected pragmaWithA |
	pragmaWithA := self pragmaForSyntax: #(#a).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA).
	driver progress: 1.
	self should: [driver acceptMessage: (Message selector: #a)]
		raise: SpecOfUnexpectedMessage.
	result := driver targetPragmas.
	expected := Array with: pragmaWithA.
	self assert: result asSet equals: expected asSet