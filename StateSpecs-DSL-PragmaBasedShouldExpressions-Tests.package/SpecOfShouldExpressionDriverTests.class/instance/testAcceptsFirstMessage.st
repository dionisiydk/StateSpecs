tests
testAcceptsFirstMessage
	| driver result expected pragmaWithA1 pragmaWithX aMessage |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA1 with: pragmaWithX).
	driver acceptMessage: (aMessage := Message selector: #a).
	result := driver targetPragmas.
	expected := Array with: pragmaWithA1.
	self assert: result asSet equals: expected asSet.
	self assert: driver currentMessage == aMessage