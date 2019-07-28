Class {
	#name : #SpecOfFutureShouldExpression,
	#superclass : #SpecOfShouldExpression,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #verification }
SpecOfFutureShouldExpression >> evaluateWith: aSpecOfObjectState [

	^super evaluateWith: ( SpecOfFutureState requiredState: aSpecOfObjectState) 
]

{ #category : #accessing }
SpecOfFutureShouldExpression >> to [ 
	"Helper message for readability of should expressions:
		some should takeAWhile to be: 10
		(some should take: 10 seconds) to be: 10"
		
	^self
]

{ #category : #execution }
SpecOfFutureShouldExpression >> validate: aSpecOfObjectState [
	"The spec of future state validates any kind of object using its value
	Spec evaluates the value periodically to detect when it will finaly satisfy condition.
	Using receiver here allows to use object instead of block in takeAWhile expressions.
	Receiver will return updated state every time the spec will ask it for new value"

	^aSpecOfObjectState validate: receiver
]
