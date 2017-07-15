tests
testPrintingBlockForSpecTitle
	| result |
	
	result := [:blockArg | blockArg > 0] stringForSpecTitle.
	
	self assert: result = '[ :blockArg | blockArg > 0 ]'