tests
testPrintingBigClauseWithArguments
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#syntax #printed #spec:title:)
				arguments: #('arg1 string' 'arg2 string').

	result := path printSpecTitle.

	self assert: result equals: 'syntax printed spec ''arg1 string'' title ''arg2 string'''.
