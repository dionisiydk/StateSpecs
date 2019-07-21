Class {
	#name : #SpecOfShouldExpressionBlockReceiver,
	#superclass : #SpecOfShouldExpressionRootReceiver,
	#instVars : [
		'block'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionBlockReceiver class >> from: aBlock [
	^self new 
		block: aBlock
]

{ #category : #accessing }
SpecOfShouldExpressionBlockReceiver >> block [
	^ block
]

{ #category : #accessing }
SpecOfShouldExpressionBlockReceiver >> block: anObject [
	block := anObject
]

{ #category : #printing }
SpecOfShouldExpressionBlockReceiver >> stringForSpecTitle [ 
	^block stringForSpecTitle 
]

{ #category : #accessing }
SpecOfShouldExpressionBlockReceiver >> validationSubject [ 
	^block value
]
