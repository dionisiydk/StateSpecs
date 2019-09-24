"
I represent the root of should expression receiver.

For example in following expression:

	#actualValue should equal: 10.
	
I will represent the #actualValue as receiver in the instance of SpecOfShouldExpression. 	

My instances can be created by 
	
	SpecOfShouldReceiverRoot from: anObject

But there is converting method on Object: 

	anObject asShouldExpressionReceiver

Some classes redefine this message to return different kind of should receivers.	
	
Public API and Key Messages

- propertyFrom:
- value
- stringForSpecTitle 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<Object>

"
Class {
	#name : #SpecOfShouldReceiverRoot,
	#superclass : #SpecOfShouldReceiver,
	#instVars : [
		'value'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldReceiverRoot class >> from: anObject [
	^self new 
		value: anObject
]

{ #category : #converting }
SpecOfShouldReceiverRoot >> asFutureStateShouldReceiver [
	^SpecOfFutureShouldReceiverRoot from: value
]

{ #category : #converting }
SpecOfShouldReceiverRoot >> asNegatedFutureStateShouldRecever [
	^self class from: value valueForFutureStateValidation 
]

{ #category : #printing }
SpecOfShouldReceiverRoot >> stringForSpecTitle [ 
	^value stringForSpecTitle 
]

{ #category : #accessing }
SpecOfShouldReceiverRoot >> validationSubject [
	^ value
]

{ #category : #accessing }
SpecOfShouldReceiverRoot >> value [
	^value
]

{ #category : #accessing }
SpecOfShouldReceiverRoot >> value: anObject [
	value := anObject
]
