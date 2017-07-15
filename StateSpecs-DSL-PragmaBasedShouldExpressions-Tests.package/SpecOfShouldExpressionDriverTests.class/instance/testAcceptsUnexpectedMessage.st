tests
testAcceptsUnexpectedMessage
	| driver result expected pragmaWithA1 pragmaWithX |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA1 with: pragmaWithX).
	self should: [driver acceptMessage: (Message selector: #b)]
		raise: SpecOfUnexpectedMessage.
	result := driver targetPragmas.
	expected := Array with: pragmaWithA1 with: pragmaWithX.
	self assert: result asSet equals: expected asSet