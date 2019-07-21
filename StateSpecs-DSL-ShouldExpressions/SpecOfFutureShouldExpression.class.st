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

{ #category : #accessing }
SpecOfFutureShouldExpression >> validationSubject [
	"The spec of future state validates any kind of object using its value
	Spec evaluates the value periodically to detect when it will finally satisfy condition.
	Returing receiver here allows to use objects instead of block in takeAWhile expressions.
	Receiver will return updated state every time the spec will ask it for new value"
	^receiver
]

{ #category : #verification }
SpecOfFutureShouldExpression >> verify: aSpecOfObjectState [

	^super verify: ( SpecOfFutureState requiredState: aSpecOfObjectState) 
]
