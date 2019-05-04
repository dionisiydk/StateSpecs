tests
testGettingValue 

	| property |
	property := (SpecOfObjectItselfProperty of: #object) subPropertyAt: (Message selector: #size).

	self assert: property value equals: 6