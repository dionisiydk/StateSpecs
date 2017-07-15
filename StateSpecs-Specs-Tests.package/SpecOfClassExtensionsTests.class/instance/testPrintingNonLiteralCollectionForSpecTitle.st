tests
testPrintingNonLiteralCollectionForSpecTitle
	| result |

	result := (Array with: Object new with: Object new) stringForSpecTitle.
	self assert: result equals: 'an Array{an Object. an Object}'