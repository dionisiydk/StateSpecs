Extension { #name : #Object }

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> asShouldExpressionReceiver [
	^SpecOfShouldExpressionObjectReceiver from: self
]

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> should [
	^SpecOfShouldExpression startingAt: self
]

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> where [
	^SpecOfShouldExpressionReceiverBuilder for: self
]
