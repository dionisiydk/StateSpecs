tests
testPrintingDeepProperty

	| property subProperty |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).
	subProperty := property subPropertyAt: (Message selector: #negated).
	
	self assert: subProperty printString equals: '"-6" from #object size negated'