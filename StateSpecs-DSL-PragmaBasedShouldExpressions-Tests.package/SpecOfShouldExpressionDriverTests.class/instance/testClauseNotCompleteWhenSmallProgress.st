tests
testClauseNotCompleteWhenSmallProgress
	| driver pragma |
	pragma := self pragmaForSyntax: #(#a #b #c).
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver progress: 2.
	self deny: driver isClauseComplete