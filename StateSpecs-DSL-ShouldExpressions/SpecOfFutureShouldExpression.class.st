Class {
	#name : #SpecOfFutureShouldExpression,
	#superclass : #SpecOfShouldExpression,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #accessing }
SpecOfFutureShouldExpression >> to [ 
	"Helper message for readability of should expressions:
		some should takeAWhile to be: 10
		(some should take: 10 seconds) to be: 10"
		
	^self
]

{ #category : #verification }
SpecOfFutureShouldExpression >> verify: aSpecOfObjectState [

	^super verify: ( SpecOfFutureState requiredState: aSpecOfObjectState) 
]
