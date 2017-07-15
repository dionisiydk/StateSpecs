*StateSpecs-Specs
checkStateSpecsEqualityTo: anotherCollection

	(anotherCollection isKindOf: Collection) ifFalse: [^false].
	
	self size = anotherCollection size ifFalse: [ ^false ].
	
	self do: [ :myEach |
		(anotherCollection anySatisfy: [ :anotherEach | 
			myEach checkStateSpecsEqualityTo: anotherEach]) ifFalse: [ ^false ]
	].

	^true