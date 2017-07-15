*StateSpecs-Specs
checkStateSpecsEqualityTo: aNumber
	(aNumber retriveClassForStateSpecs includesBehavior: Number) ifFalse: [ ^false ].

	^aNumber isEqual: self within: 0.00000001