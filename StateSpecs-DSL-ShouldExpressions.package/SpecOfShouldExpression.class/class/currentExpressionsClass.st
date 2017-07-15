accessing
currentExpressionsClass
	^CurrentExpressionsClass ifNil: [ CurrentExpressionsClass := SpecOfShouldExpression ]