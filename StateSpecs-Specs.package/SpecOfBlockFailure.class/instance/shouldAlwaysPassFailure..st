testing
shouldAlwaysPassFailure: anException
	
	^passingFailures anySatisfy: [ :each | 
		anException isKindOf: each]