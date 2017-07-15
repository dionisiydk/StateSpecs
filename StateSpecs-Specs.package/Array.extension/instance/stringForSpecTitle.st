*StateSpecs-Specs
stringForSpecTitle 
	self shouldBePrintedAsLiteral ifTrue: [^self printString].
	self isSelfEvaluating ifTrue: [^self printString].

	^super stringForSpecTitle 