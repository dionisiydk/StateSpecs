"
I implement all kinds of ""should DSL"" expressions to perform object validation.
You can get instance of me from any object by 
	1 should 
And then you can call my validation methods:
	1 should equal: 2
	1 should not equal: 2

Now I implement validation DSL by explicit messages. But before I was based on pragma approach which now extracted to separate package.
To support both approaches I provide class variable CurrentExpressionsClass which is me by default. 
But if you load package with pragma based expressions then SpecOfPragmaBasedShouldExpression become current (look at it comment for detailes).
To activate concrete expressions call 
	SpecOfShouldExpression beCurrent 

All DSL methods are in expressions category.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	receiver:		<Object>
	withNegation:		<Boolean>
"
Class {
	#name : #SpecOfShouldExpression,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'withNegation',
		'receiverOwner'
	],
	#classVars : [
		'CurrentExpressionsClass'
	],
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #accessing }
SpecOfShouldExpression class >> beCurrent [
	^CurrentExpressionsClass := self
]

{ #category : #accessing }
SpecOfShouldExpression class >> currentExpressionsClass [
	^CurrentExpressionsClass ifNil: [ CurrentExpressionsClass := SpecOfShouldExpression ]
]

{ #category : #'instance creation' }
SpecOfShouldExpression class >> for: anObject [
	^self withReceiver: (SpecOfShouldExpressionObjectReceiver from: anObject)
]

{ #category : #'instance creation' }
SpecOfShouldExpression class >> startingAt: anObject [
	^self currentExpressionsClass for: anObject
]

{ #category : #'instance creation' }
SpecOfShouldExpression class >> withReceiver: aShouldExpressionReceiver [
	^self new 
		receiver: aShouldExpressionReceiver
]

{ #category : #'instance creation' }
SpecOfShouldExpression class >> withReceiver: aShouldExpressionReceiver negation: aBoolean [
	^(self withReceiver: aShouldExpressionReceiver)
		withNegation: aBoolean
]

{ #category : #expressions }
SpecOfShouldExpression >> be [
	^SpecOfBooleanPropertyValidator for: self
]

{ #category : #expressions }
SpecOfShouldExpression >> be: anObject [ 
	^self evaluateWith: (SpecOfIdentity requiredValue: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> be: anObject description: failureDescription [
	| spec |
	spec := (SpecOfIdentity requiredValue: anObject).
	spec failureDescription: failureDescription.
	
	^self evaluateWith: spec
]

{ #category : #expressions }
SpecOfShouldExpression >> beGreaterOrEqualThan: anObject [
	^self evaluateWith: (SpecOfGreaterMagnitude than: anObject strong: false)
]

{ #category : #expressions }
SpecOfShouldExpression >> beGreaterThan: anObject [
	^self evaluateWith: (SpecOfGreaterMagnitude than: anObject strong: true)
]

{ #category : #expressions }
SpecOfShouldExpression >> beInstanceOf: aClass [ 
	^self evaluateWith: (SpecOfObjectClass requiredClass: aClass)
]

{ #category : #expressions }
SpecOfShouldExpression >> beKindOf: aClass [ 
	^self evaluateWith: (SpecOfObjectSuperclass requiredClass: aClass)
]

{ #category : #expressions }
SpecOfShouldExpression >> beLessOrEqualThan: anObject [
	^self evaluateWith: (SpecOfLesserMagnitude than: anObject strong: false)
]

{ #category : #expressions }
SpecOfShouldExpression >> beLessThan: anObject [
	^self evaluateWith: (SpecOfLesserMagnitude than: anObject strong: true)
]

{ #category : #expressions }
SpecOfShouldExpression >> beginWith: aString [
	^ self evaluateWith: (SpecOfStringBeginning requiredValue: aString)
]

{ #category : #expressions }
SpecOfShouldExpression >> beginWith: aString caseSensitive: aBool [
	^ self evaluateWith: (SpecOfStringBeginning requiredValue: aString caseSensitive: aBool)
]

{ #category : #expressions }
SpecOfShouldExpression >> endWith: aString [
	^ self evaluateWith: (SpecOfStringEnding requiredValue: aString)
]

{ #category : #expressions }
SpecOfShouldExpression >> endWith: aString caseSensitive: aBool [
	^ self evaluateWith: (SpecOfStringEnding requiredValue: aString caseSensitive: aBool)
]

{ #category : #expressions }
SpecOfShouldExpression >> equal: anObject [ 
	^self evaluateWith: (SpecOfEquality requiredValue: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> equal: anObject description: failureDescription [
	| spec |
	spec := (SpecOfEquality requiredValue: anObject) .
	spec failureDescription: failureDescription.
	
	^self evaluateWith: spec
]

{ #category : #expressions }
SpecOfShouldExpression >> equal: aNumber within: accuracyNumber [ 
	^self evaluateWith: (SpecOfApproxEquality to: aNumber within: accuracyNumber)
]

{ #category : #expressions }
SpecOfShouldExpression >> equalInOrder: anObject [ 
	^self evaluateWith: (SpecOfCollectionOrderedEquality requiredValue: anObject)
]

{ #category : #execution }
SpecOfShouldExpression >> evaluateWith: aSpecOfObjectState [

	| result |
	aSpecOfObjectState denial: withNegation.
	result := self validate: aSpecOfObjectState.
	result isFailure ifTrue: [ result subjectOwner: receiver ].
	^ result raise 
]

{ #category : #expressions }
SpecOfShouldExpression >> fail [
	^self raise: Error
]

{ #category : #expressions }
SpecOfShouldExpression >> haveSize: aNumber [ 
	^self evaluateWith: (SpecOfCollectionSize requiredSize: aNumber)
]

{ #category : #expressions }
SpecOfShouldExpression >> include: anObjectOrSpec [
	^ self evaluateWith: (SpecOfCollectionContents requiredItem: anObjectOrSpec)
]

{ #category : #expressions }
SpecOfShouldExpression >> include: itemObject at: keyObject [
	^self evaluateWith: (SpecOfCollectionItem at: keyObject requiredItem: itemObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> includeKey: anObject [ 
	^self evaluateWith: (SpecOfDictionaryKeys requiredKey: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> includeSubstring: aString [
	^ self evaluateWith: (SpecOfSubstring requiredValue: aString)
]

{ #category : #expressions }
SpecOfShouldExpression >> includeSubstring: aString caseSensitive: aBool [
	^ self evaluateWith: (SpecOfSubstring requiredValue: aString caseSensitive: aBool)
]

{ #category : #initialization }
SpecOfShouldExpression >> initialize [
	super initialize.
	withNegation := false
]

{ #category : #expressions }
SpecOfShouldExpression >> matchRegex: aRegexString [
	^ self evaluateWith: (SpecOfStringRegex requiredValue: aRegexString)
]

{ #category : #expressions }
SpecOfShouldExpression >> matchRegex: aRegexString caseSensitive: aBool [
	^ self evaluateWith: (SpecOfStringRegex requiredValue: aRegexString caseSensitive: aBool)
]

{ #category : #expressions }
SpecOfShouldExpression >> not [
	withNegation := withNegation not
]

{ #category : #expressions }
SpecOfShouldExpression >> raise: aClass [ 
	^self evaluateWith: (SpecOfBlockFailure requiredFailure: aClass)
]

{ #category : #accessing }
SpecOfShouldExpression >> receiver [
	^ receiver
]

{ #category : #accessing }
SpecOfShouldExpression >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
SpecOfShouldExpression >> receiverOwner [
	^ receiverOwner
]

{ #category : #accessing }
SpecOfShouldExpression >> receiverOwner: anObject [
	receiverOwner := anObject
]

{ #category : #expressions }
SpecOfShouldExpression >> respondTo: aSelector [ 
	^self evaluateWith: (SpecOfObjectResponsibility for: aSelector)
]

{ #category : #expressions }
SpecOfShouldExpression >> satisfy: aBlock [
	^self evaluateWith: (SpecOfObjectStateByPredicate from: aBlock)
]

{ #category : #expressions }
SpecOfShouldExpression >> take: maxDuration [
	^self takeAWhile 
		maxWaitingTime: maxDuration;
		yourself
]

{ #category : #expressions }
SpecOfShouldExpression >> takeAWhile [
	withNegation ifTrue: [
		"The expression 'should not takeAWhile' logically means 
		that following condition should be already true without any waiting. 
		And it makes it equivalent to simple should expression"
		 ^self class withReceiver: receiver asNegatedFutureStateShouldRecever].
	
	^SpecOfFutureShouldExpression withReceiver: receiver asFutureStateShouldReceiver
]

{ #category : #expressions }
SpecOfShouldExpression >> to [ 
	"Helper message for readability of should expressions:
		some should takeAWhile to be: 10
		(some should take: 10 seconds) to be: 10
	It is defined here to support negated case: 
		some not should takeAWhile to be: 10
		(some not should take: 10 seconds) to be: 10
	In that case 'should not takeAWhile' returns simple should expression 
	and it needs to understand #to"
		
	^self
]

{ #category : #execution }
SpecOfShouldExpression >> validate: aSpecOfObjectState [

	^receiver validate: aSpecOfObjectState
]

{ #category : #accessing }
SpecOfShouldExpression >> validationSubject [
	^receiver validationSubject
]

{ #category : #accessing }
SpecOfShouldExpression >> withNegation [
	^ withNegation
]

{ #category : #accessing }
SpecOfShouldExpression >> withNegation: anObject [
	withNegation := anObject
]
