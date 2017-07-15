tests
testIncrementsProgressAfterAcceptingMessage
	| driver pragmaWithA |
	pragmaWithA := self pragmaForSyntax: #(#a #b #c).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA).
	driver acceptMessage: (Message selector: #a).
	self assert: driver progress = 1