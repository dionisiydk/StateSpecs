tests
testPrintingClauseWithSinglePartWithArguments
	| path result |
	path := SpecOfShouldExpressionPath clause: #(#spec:title:)
				arguments: #('arg1 string' 'arg2 string').
	
	result := path printSpecTitle.
	
	self assert: result = 'spec ''arg1 string'' title ''arg2 string'''