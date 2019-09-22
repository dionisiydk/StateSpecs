"
I represent deep object property defined by particular message. 
For example I can be used to describe x coordinate of rectangle origin.
	rectangle origin x
""x"" property in these example will point to ""origin"" property. And ""origin"" property will point to rectangle itself (root represented by SpecOfObjectItselfProperty instance).

I implement printing method for spec title to look like
	(10@20) x
in case of property ""x"" of point (10@20).

My instances can be created by 
	
	SpecOfShouldExpressionReceiverProperty of: 	aShouldExpressionReceiver message: aMessage 

But in practice SpecOfShouldExpressionReceiverBuilder is used to create properties by normal message sends.
	(10@20) where x 

Public API and Key Messages

- subPropertyAt:  
- value
- stringForSpecTitle 

Internal Representation and Key Implementation Points.

    Instance Variables
	parent:		<SpecOfShouldExpressionReceiver>
	parentMessage:		<Message>
	value:		<Object>
"
Class {
	#name : #SpecOfShouldReceiverProperty,
	#superclass : #SpecOfShouldReceiver,
	#instVars : [
		'parent',
		'parentMessage',
		'value'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldReceiverProperty class >> of: anObjectProperty message: aMessage [

	^self new 
		parent: anObjectProperty;
		parentMessage: aMessage
]

{ #category : #validation }
SpecOfShouldReceiverProperty >> createSpecOfValidationSubject [
	^SpecOfObjectHolder requiredHolder: self
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> parent [
	^ parent
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> parentMessage [
	^ parentMessage
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> parentMessage: anObject [
	parentMessage := anObject
]

{ #category : #printing }
SpecOfShouldReceiverProperty >> printOn: aStream [

	aStream nextPutAll: (self printSubject: self validationSubject)
]

{ #category : #printing }
SpecOfShouldReceiverProperty >> printPath [
	^parent printPath
		ifEmpty: [parentMessage printString]
		ifNotEmpty: [ :path | path , ' ' , parentMessage printString ]
]

{ #category : #printing }
SpecOfShouldReceiverProperty >> printProperty: aShouldExpressionReceiverProperty [
	^parent printProperty: aShouldExpressionReceiverProperty
]

{ #category : #printing }
SpecOfShouldReceiverProperty >> printSubject: anObject [

	^(super printSubject: anObject) , ' from ', self stringForSpecTitle
]

{ #category : #printing }
SpecOfShouldReceiverProperty >> stringForSpecTitle [ 
	^parent printProperty: self
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> updateValue [
	value := parentMessage sendTo: parent validationSubject
]

{ #category : #validation }
SpecOfShouldReceiverProperty >> validate [
	^parent validate
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> validationSubject [
	self updateValue.
	^ value
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> value [
	value
]

{ #category : #accessing }
SpecOfShouldReceiverProperty >> value: anObject [
	value := anObject
]
