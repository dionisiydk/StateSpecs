Extension { #name : #BlockClosure }

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
BlockClosure >> asShouldExpressionReceiver [
	^SpecOfShouldExpressionBlockReceiver from: self
]
