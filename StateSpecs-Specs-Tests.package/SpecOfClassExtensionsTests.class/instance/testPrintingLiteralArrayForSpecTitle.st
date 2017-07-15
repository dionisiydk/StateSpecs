tests
testPrintingLiteralArrayForSpecTitle
	| result |

	result := #(1 2 3) stringForSpecTitle.
	self assert: result = '#(1 2 3)'