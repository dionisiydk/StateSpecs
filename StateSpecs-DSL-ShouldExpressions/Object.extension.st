Extension { #name : #Object }

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> asShouldExpressionReceiver [

	^SpecOfShouldExpressionObjectReceiver from: self
]

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> should [
	^self asShouldExpressionReceiver should
]

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> where [
	^self asShouldExpressionReceiver where
]
