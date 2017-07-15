tests
testPrintingEmptySet
	| result |

	result := Set new stringForSpecTitle.
	self assert: result equals: 'a Set{}'