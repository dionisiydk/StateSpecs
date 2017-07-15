*StateSpecs-Specs
checkStateSpecsEqualityTo: anObject
	self class == anObject retriveClassForStateSpecs ifFalse: [ ^false ].
	
	^self = anObject