*StateSpecs-Specs
checkStateSpecsOrderedEqualityTo: anotherCollection

	(anotherCollection isKindOf: Collection) ifFalse: [^false].
	
	self size = anotherCollection size ifFalse: [ ^false ].
	
	self with: anotherCollection do: [ :myEach :anotherEach |
		(myEach checkStateSpecsEqualityTo: anotherEach) ifFalse: [ ^false ]
	].

	^true