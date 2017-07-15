tests
testPrintingByteArray
	| result |

	result := #[1 2 3] stringForSpecTitle.
	self assert: result equals: #[1 2 3] printString