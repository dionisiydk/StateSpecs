tests
testPrintingBigClauseWithoutArguments
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#syntax #printed #spec) arguments: #().
	result := path printSpecTitle.
	self assert: result = 'syntax printed spec'