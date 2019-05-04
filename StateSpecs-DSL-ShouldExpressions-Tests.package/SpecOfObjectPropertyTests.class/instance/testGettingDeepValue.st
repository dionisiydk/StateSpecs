tests
testGettingDeepValue 

	| property subProperty |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).
	subProperty := property subPropertyAt: (Message selector: #negated).
	
	self assert: subProperty value equals: -6