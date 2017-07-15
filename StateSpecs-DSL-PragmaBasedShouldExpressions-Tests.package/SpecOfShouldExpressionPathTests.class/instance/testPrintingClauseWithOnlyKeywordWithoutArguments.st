tests
testPrintingClauseWithOnlyKeywordWithoutArguments
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#syntax) arguments: #().
	result := path printSpecTitle.
	self assert: result = 'syntax'