Extension { #name : #Pragma }

{ #category : #'*StateSpecs-DSL-PragmaBasedShouldExpressions' }
Pragma >> createStateSpecWith: anArray [ 
	^self methodClass soleInstance perform: self methodSelector
		withArguments: anArray
	
]

{ #category : #'*StateSpecs-DSL-PragmaBasedShouldExpressions' }
Pragma >> stateSpecsShouldClause [
	^arguments first 
]
