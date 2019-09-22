"
I am used to create internal property instance of given object which then can be validated:

	(10@3) which x should equal: 10
	
which here returns me. 

Internal Representation and Key Implementation Points.

    Instance Variables
	property:		<SpecOfObjectProperty>

"
Class {
	#name : #SpecOfShouldExpressionReceiverBuilder,
	#superclass : #Object,
	#instVars : [
		'receiver'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionReceiverBuilder class >> startingWith: aShouldExpressionReceiver [

	^self new 
		receiver: aShouldExpressionReceiver 
]

{ #category : #converting }
SpecOfShouldExpressionReceiverBuilder >> asShouldExpressionReceiver [ 
	^receiver
]

{ #category : #dispatching }
SpecOfShouldExpressionReceiverBuilder >> doesNotUnderstand: aMessage [

	receiver := receiver propertyFrom: aMessage
]

{ #category : #printing }
SpecOfShouldExpressionReceiverBuilder >> printOn: aStream [

	aStream << 'Got '.
	receiver printOn: aStream
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> receiver [
	^ receiver
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> value [
	^self doesNotUnderstand: (Message selector: #value)
]
