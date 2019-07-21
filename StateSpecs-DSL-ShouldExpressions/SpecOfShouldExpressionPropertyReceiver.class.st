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
	#name : #SpecOfShouldExpressionPropertyReceiver,
	#superclass : #SpecOfShouldExpressionReceiver,
	#instVars : [
		'parent',
		'parentMessage',
		'value'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionPropertyReceiver class >> of: anObjectProperty message: aMessage [

	^self new 
		parent: anObjectProperty;
		parentMessage: aMessage
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> parent [
	^ parent
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> parentMessage [
	^ parentMessage
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> parentMessage: anObject [
	parentMessage := anObject
]

{ #category : #printing }
SpecOfShouldExpressionPropertyReceiver >> printOn: aStream [

	aStream nextPutAll: (self printSubject: self validationSubject)
]

{ #category : #printing }
SpecOfShouldExpressionPropertyReceiver >> printSubject: anObject [

	^(super printSubject: anObject) , ' from ', self stringForSpecValidation
]

{ #category : #printing }
SpecOfShouldExpressionPropertyReceiver >> stringForSpecTitle [ 
	^parent stringForSpecTitle, ' ', parentMessage printString.
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionPropertyReceiver of: self message: aMessage
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> updateValue [
	value := parentMessage sendTo: parent validationSubject
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> validationSubject [
	self updateValue.
	^ value
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> value [
	value
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> value: anObject [
	value := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionPropertyReceiver >> valueForFutureStateValidation [ 
	^self validationSubject
]
