"
I drive execution of should expression to select appropriate pragmas which can be used for current syntax path

Public API and Key Messages

- acceptMessage: aMessage   
- isClauseComplete 
- createTarget
 
Internal Representation and Key Implementation Points.

    Instance Variables
	currentMessage:		<Message>
	progress:		<Integer>
	targetPragmas:		<Collection of<Pragma>>
"
Class {
	#name : #SpecOfShouldExpressionDriver,
	#superclass : #Object,
	#instVars : [
		'targetPragmas',
		'progress',
		'currentMessage'
	],
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionDriver class >> new [
	^super new initialize
]

{ #category : #'instance creation' }
SpecOfShouldExpressionDriver class >> on: arrayOfPragmas [ 
	^self new targetPragmas: arrayOfPragmas
]

{ #category : #controlling }
SpecOfShouldExpressionDriver >> acceptMessage: aMessage [ 
	currentMessage := aMessage.
	progress := progress + 1.
	self filterTargetPragmas
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> clause [
	^targetPragmas first stateSpecsShouldClause
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> createTarget [
	^self targetPragma createStateSpecWith: currentMessage arguments
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> currentMessage [
	^currentMessage
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> currentMessage: anObject [
	currentMessage := anObject
]

{ #category : #private }
SpecOfShouldExpressionDriver >> filterTargetPragmas [
	| matchesPragmas |
	matchesPragmas := targetPragmas select: 
					[:each | 
					each stateSpecsShouldClause size >= progress 
						and: [(each stateSpecsShouldClause at: progress) = currentMessage selector]].
	matchesPragmas isEmpty ifTrue: [SpecOfUnexpectedMessage signal].
	targetPragmas := matchesPragmas
]

{ #category : #'initialize-release' }
SpecOfShouldExpressionDriver >> initialize [
	progress := 0
]

{ #category : #testing }
SpecOfShouldExpressionDriver >> isClauseComplete [
	targetPragmas size > 1 ifTrue: [^false].
	^progress = targetPragmas first stateSpecsShouldClause size
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> path [
	^SpecOfShouldExpressionPath clause: self targetPragma stateSpecsShouldClause
		arguments: currentMessage arguments
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> progress [
	^progress
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> progress: anObject [
	progress := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> targetPragma [
	^targetPragmas first
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> targetPragmas [
	^targetPragmas
]

{ #category : #accessing }
SpecOfShouldExpressionDriver >> targetPragmas: arrayOfPragmas [ 
	targetPragmas := arrayOfPragmas
]
