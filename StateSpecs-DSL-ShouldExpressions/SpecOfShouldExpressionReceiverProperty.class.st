"
I represent deep object property defined by particular message. 
For example I can be used to describe x coordinate of rectangle origin.
	rectangle origin x
""x"" property in these example will point to ""origin"" property. And ""origin"" property will point to rectangle itself (root represented by SpecOfObjectItselfProperty instance).

I implement printing method for spec title to look like
	(10@20) x
in case of property ""x"" of point (10@20).

My instances can be created by 
	
	SpecOfShouldExpressionPropertyReceiver of: 	parentProperty message: aMessage 

But in practice SpecOfObjectPropertyBuilder is used to create properties by normal message sends.
	(10@20) where x 

Public API and Key Messages

- subPropertyAt:  
- value
- stringForSpecTitle 

Internal Representation and Key Implementation Points.

    Instance Variables
	parent:		<SpecOfObjectProperty>
	parentMessage:		<Message>
	value:		<Object>
"
Class {
	#name : #SpecOfShouldExpressionReceiverProperty,
	#superclass : #SpecOfShouldExpressionReceiver,
	#instVars : [
		'parent',
		'parentMessage',
		'value'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionReceiverProperty class >> of: anObjectProperty message: aMessage [

	^self new 
		parent: anObjectProperty;
		parentMessage: aMessage
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> parent [
	^ parent
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> parentMessage [
	^ parentMessage
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> parentMessage: anObject [
	parentMessage := anObject
]

{ #category : #printing }
SpecOfShouldExpressionReceiverProperty >> printOn: aStream [

	aStream nextPutAll: (self printSubject: self validationSubject)
]

{ #category : #printing }
SpecOfShouldExpressionReceiverProperty >> printPath [
	^parent printPath
		ifEmpty: [parentMessage printString]
		ifNotEmpty: [ :path | path , ' ' , parentMessage printString ]
]

{ #category : #printing }
SpecOfShouldExpressionReceiverProperty >> printProperty: aShouldExpressionReceiverProperty [
	^parent printProperty: aShouldExpressionReceiverProperty
]

{ #category : #printing }
SpecOfShouldExpressionReceiverProperty >> printSubject: anObject [

	^(super printSubject: anObject) , ' from ', self stringForSpecTitle
]

{ #category : #printing }
SpecOfShouldExpressionReceiverProperty >> stringForSpecTitle [ 
	^parent printProperty: self
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionReceiverProperty of: self message: aMessage
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> updateValue [
	value := parentMessage sendTo: parent validationSubject
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> validationSubject [
	self updateValue.
	^ value
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> value [
	value
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverProperty >> value: anObject [
	value := anObject
]
