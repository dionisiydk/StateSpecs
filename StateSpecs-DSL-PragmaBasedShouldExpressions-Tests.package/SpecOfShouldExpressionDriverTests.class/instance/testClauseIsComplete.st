tests
testClauseIsComplete
	| driver pragma |
	pragma := self pragmaForSyntax: #(#a #b #c).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver progress: 3.
	self assert: driver isClauseComplete