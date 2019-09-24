Class {
	#name : #SpecOfObjectHolder,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredHolder'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #accessing }
SpecOfObjectHolder class >> requiredHolder: anObject [
	^self new 
		requiredHolder: anObject
]

{ #category : #testing }
SpecOfObjectHolder >> basicMatches: anObject [ 
	^requiredHolder includes: anObject
]

{ #category : #accessing }
SpecOfObjectHolder >> requiredHolder [
	^ requiredHolder
]

{ #category : #accessing }
SpecOfObjectHolder >> requiredHolder: anObject [
	requiredHolder := anObject
]
