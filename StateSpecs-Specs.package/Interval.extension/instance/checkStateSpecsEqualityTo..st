*StateSpecs-Specs
checkStateSpecsEqualityTo: anotherCollection

	(anotherCollection isKindOf: Interval) ifFalse: [^false].
	
	^self = anotherCollection 