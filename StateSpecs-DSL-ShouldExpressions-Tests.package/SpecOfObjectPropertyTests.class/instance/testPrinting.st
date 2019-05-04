tests
testPrinting 

	| property |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).

	self assert: property printString equals: '"6" from #object size'