*StateSpecs-Specs
checkStateSpecsEqualityTo: aPoint
	(aPoint retriveClassForStateSpecs includesBehavior: Point) ifFalse: [ ^false ].

	^aPoint isEqual: self within: 0.00000001