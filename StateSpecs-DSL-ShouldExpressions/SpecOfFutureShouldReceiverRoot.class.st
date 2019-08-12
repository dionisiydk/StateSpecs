"
I represent the receiver in ""future should expression"" where validation subject could be specified using block: 

	[ value ] should takeAWhile to equal: 10

I modify the #validationSubject of superclass to allow using blocks and object in such expressions:

	#() should takeAWhile to be isEmpty
"
Class {
	#name : #SpecOfFutureShouldReceiverRoot,
	#superclass : #SpecOfShouldReceiverRoot,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #validation }
SpecOfFutureShouldReceiverRoot >> validationSubject [

	^value valueForFutureStateValidation 
]
