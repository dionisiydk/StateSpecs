"
I represent the receiver in ""future should expression"" where validation subject could be specified using block: 

	[ value ] should takeAWhile to equal: 10

I modify the #validationSubject of superclass to allow using blocks and object in such expressions:

	#() should takeAWhile to be isEmpty
"
Class {
	#name : #SpecOfFutureShouldExpressionObjectReceiver,
	#superclass : #SpecOfShouldExpressionObjectReceiver,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #validation }
SpecOfFutureShouldExpressionObjectReceiver >> validationSubject [

	^value valueForFutureStateValidation 
]
