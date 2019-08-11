"
I am a root of hierarchy of different kind of object properties which are used for validation of object properties in should expressions.

My subclasses should implement two methods: 
- #subPropertyAt: returning another property by constructing the state chain.
- #value returning actual value of the property.

The main subclass is sSpecOfObjectProperty while others are kind of helpers to represent the root objects: 
- the object itself
- object computed from the given block
"
Class {
	#name : #SpecOfShouldExpressionReceiver,
	#superclass : #Object,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #testing }
SpecOfShouldExpressionReceiver class >> isAbstract [ 
	^self = SpecOfShouldExpressionReceiver
]

{ #category : #converting }
SpecOfShouldExpressionReceiver >> asFutureStateShouldReceiver [
	^self
]

{ #category : #converting }
SpecOfShouldExpressionReceiver >> asNegatedFutureStateShouldRecever [
	^self
]

{ #category : #printing }
SpecOfShouldExpressionReceiver >> printPath [
	^''
]

{ #category : #printing }
SpecOfShouldExpressionReceiver >> printProperty: aShouldExpressionReceiverProperty [
	^self stringForSpecTitle, ' ', aShouldExpressionReceiverProperty printPath.
]

{ #category : #printing }
SpecOfShouldExpressionReceiver >> printSubject: anObject [

	^anObject stringForSpecTitle
]

{ #category : #asserting }
SpecOfShouldExpressionReceiver >> should [
	^SpecOfShouldExpression currentExpressionsClass withReceiver: self
]

{ #category : #accessing }
SpecOfShouldExpressionReceiver >> subPropertyAt: aMessage [
	self subclassResponsibility 
]

{ #category : #validation }
SpecOfShouldExpressionReceiver >> validate [
	"Subclasses can define some logical conditions on where
	they can be really used before actual validation of subject.
	For example argument capture in Mocketry verifies that expected message was actually sent"
	
	^SpecOfValidationResult success
]

{ #category : #validation }
SpecOfShouldExpressionReceiver >> validate: aSpecOfObjectState [

	| result |
	result := self validate.
	result isSuccess ifFalse: [ ^result ].
	
	result := aSpecOfObjectState validate: self validationSubject.
	result subjectOwner: self.
	^result
]

{ #category : #accessing }
SpecOfShouldExpressionReceiver >> validationSubject [
	self subclassResponsibility 
]

{ #category : #asserting }
SpecOfShouldExpressionReceiver >> where [
	^SpecOfShouldExpressionReceiverBuilder startingWith: self
]
