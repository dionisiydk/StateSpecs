instance creation
startingAt: anObject
	^self currentExpressionsClass new 
		receiver: anObject