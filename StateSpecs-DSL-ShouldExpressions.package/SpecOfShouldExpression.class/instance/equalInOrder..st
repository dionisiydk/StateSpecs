expressions
equalInOrder: anObject 
	^self verify: (SpecOfCollectionOrderedEquality requiredValue: anObject)