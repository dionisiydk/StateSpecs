tests
testClauseNotCompleteWhenManyPragmas
	| driver pragmaWithA1 pragmaWithX |
	pragmaWithA1 := self pragmaForSyntax: #(#a #b #c).
	pragmaWithX := self pragmaForSyntax: #(#x #a #b).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragmaWithA1 with: pragmaWithX).
	driver progress: 3.
	self deny: driver isClauseComplete