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
	#name : #SpecOfShouldReceiver,
	#superclass : #Object,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #testing }
SpecOfShouldReceiver class >> isAbstract [ 
	^self = SpecOfShouldReceiver
]

{ #category : #converting }
SpecOfShouldReceiver >> asFutureStateShouldReceiver [
	^self
]

{ #category : #converting }
SpecOfShouldReceiver >> asNegatedFutureStateShouldRecever [
	^self
]

{ #category : #validation }
SpecOfShouldReceiver >> createSpecOfValidationSubject [
	^SpecOfIdentity to: self validationSubject
]

{ #category : #printing }
SpecOfShouldReceiver >> printPath [
	^''
]

{ #category : #printing }
SpecOfShouldReceiver >> printProperty: aShouldExpressionReceiverProperty [
	^self stringForSpecTitle, ' ', aShouldExpressionReceiverProperty printPath.
]

{ #category : #printing }
SpecOfShouldReceiver >> printSubject: anObject [

	^anObject stringForSpecTitle
]

{ #category : #accessing }
SpecOfShouldReceiver >> propertyFrom: aMessage [

	^SpecOfShouldReceiverProperty of: self message: aMessage
]

{ #category : #asserting }
SpecOfShouldReceiver >> should [
	^SpecOfShouldExpression currentExpressionsClass withReceiver: self
]

{ #category : #validation }
SpecOfShouldReceiver >> validate [
	"Subclasses can define some logical conditions on where
	they can be really used before actual validation of subject.
	For example argument capture in Mocketry verifies that expected message was actually sent"
	
	^SpecOfValidationResult success
]

{ #category : #validation }
SpecOfShouldReceiver >> validateWith: aSpecOfObjectState [

	| result |
	result := self validate.
	result isSuccess ifFalse: [ ^result ].
	
	result := aSpecOfObjectState validate: self validationSubject.
	result subjectOwner: self.
	^result
]

{ #category : #accessing }
SpecOfShouldReceiver >> validationSubject [
	self subclassResponsibility 
]

{ #category : #asserting }
SpecOfShouldReceiver >> where [
	^SpecOfShouldExpressionReceiverBuilder startingWith: self
]
