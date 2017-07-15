tests
testAcceptsSecondMessage
	| driver result expected pragmaWithAB pragmaWithAC pragmaWithXA |
	pragmaWithAB := self pragmaForSyntax: #(#a #b #c).
	pragmaWithAC := self pragmaForSyntax: #(#a #c #d).
	pragmaWithXA := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array 
						with: pragmaWithAB
						with: pragmaWithAC
						with: pragmaWithXA).
	driver
		acceptMessage: (Message selector: #a);
		acceptMessage: (Message selector: #b).
	result := driver targetPragmas.
	expected := Array with: pragmaWithAB.
	self assert: result asSet equals: expected asSet