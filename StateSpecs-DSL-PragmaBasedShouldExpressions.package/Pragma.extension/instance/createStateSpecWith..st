*StateSpecs-DSL-PragmaBasedShouldExpressions
createStateSpecWith: anArray 
	^self methodClass soleInstance perform: self methodSelector
		withArguments: anArray
	