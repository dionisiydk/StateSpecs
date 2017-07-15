tests
testAcceptsFirstMessage2
	| driver result expected pragmaWithA1 pragmaWithA2 pragmaWithX |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithA2 := self pragmaForSyntax: #(#a #b #d).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array 
						with: pragmaWithA1
						with: pragmaWithA2
						with: pragmaWithX).
	driver acceptMessage: (Message selector: #a).
	result := driver targetPragmas.
	expected := Array with: pragmaWithA1 with: pragmaWithA2.
	self assert: result asSet equals: expected asSet