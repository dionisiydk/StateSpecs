"
I represent path inside should expression

Internal Representation and Key Implementation Points.

    Instance Variables
	arguments:		<Object>
	clause:		<Object>
"
Class {
	#name : #SpecOfShouldExpressionPath,
	#superclass : #Object,
	#instVars : [
		'clause',
		'arguments'
	],
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionPath class >> allAt: sourceContext [ 
	| arguments pragmas |
	arguments := sourceContext arguments.
	pragmas := sourceContext method pragmas select: [:each | each keyword == #syntax:].
	^pragmas 
		collect: [:each | SpecOfShouldExpressionPath clause: each stateSpecsShouldClause arguments: arguments]
]

{ #category : #'instance creation' }
SpecOfShouldExpressionPath class >> allAtHere [
	^self allAt: thisContext sender
]

{ #category : #'instance creation' }
SpecOfShouldExpressionPath class >> anyAtHere [
	^(self allAt: thisContext sender) first
]

{ #category : #'instance creation' }
SpecOfShouldExpressionPath class >> clause: selectorsArray arguments: argumentsArray [ 
	^(self new)
		clause: selectorsArray;
		arguments: argumentsArray
]

{ #category : #accessing }
SpecOfShouldExpressionPath >> arguments [
	^arguments
]

{ #category : #accessing }
SpecOfShouldExpressionPath >> arguments: argumentsArray [ 
	arguments := argumentsArray
]

{ #category : #accessing }
SpecOfShouldExpressionPath >> clause [
	^clause
]

{ #category : #accessing }
SpecOfShouldExpressionPath >> clause: selectorsArray [ 
	clause := selectorsArray
]

{ #category : #printing }
SpecOfShouldExpressionPath >> printSpecTitle [
	| stream |
	stream := String new writeStream.
	(clause allButLast: 1) do: 
			[:eachPart | 
			stream
				nextPutAll: eachPart;
				nextPut: $ ].
	arguments isEmpty 
		ifTrue: 
			[stream nextPutAll: clause last.
			^stream contents].
	arguments with: clause last keywords
		do: 
			[:eachArg :eachKeyword | 
			stream
				nextPutAll: eachKeyword;
				skip: -1;
				nextPut: $ ;
				nextPutAll: eachArg stringForSpecTitle;
				nextPut: $ ].
	stream skip: -1.
	^stream contents
]
