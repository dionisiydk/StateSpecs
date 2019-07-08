"
I implement  ""should DSL"" expressions by pragma approach.

To define new should expressions you should implement new method on class side which will return required specification. This method should be marked with pragma #syntax:  which define concrete should sentence:

>>beInstanceOf: aClass 
	<syntax: #(be an instance of:)>
	<syntax: #(be instance of:)>
	^SpecOfObjectClass requiredClass: aClass

And then you can write  expressions like:
	 4 should be an instance of: SmallInteger
	 4 should be instance of: SmallInteger

Internal Representation and Key Implementation Points.

    Instance Variables
	driver:		<SpecOfSyntaxDriver>

"
Class {
	#name : #SpecOfPragmaBasedShouldExpression,
	#superclass : #SpecOfShouldExpression,
	#instVars : [
		'driver'
	],
	#category : 'StateSpecs-DSL-PragmaBasedShouldExpressions'
}

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beEmpty [
	<syntax: #(be empty)>
	^SpecOfCollectionSize requiredSize: 0
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beGreaterOrEqualThan: anObject [
	<syntax: #(be greater or equal than:)>
	^SpecOfGreaterMagnitude than: anObject strong: false
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beGreaterThan: anObject [
	<syntax: #(be greater than:)>
	^SpecOfGreaterMagnitude than: anObject strong: true
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beInstanceOf: aClass [ 
	<syntax: #(be an instance of:)>
	^SpecOfObjectClass requiredClass: aClass
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beKindOf: aClass [ 
	<syntax: #(be a kind of:)>
	^SpecOfObjectSuperclass requiredClass: aClass
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beLessOrEqualThan: anObject [
	<syntax: #(be less or equal than:)>
	^SpecOfLesserMagnitude than: anObject strong: false
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> beLessThan: anObject [
	<syntax: #(be less than:)>
	^SpecOfLesserMagnitude than: anObject strong: true
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> haveSize: aNumber [ 
	<syntax: #(have size:)>
	^SpecOfCollectionSize requiredSize: aNumber
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> includeKey: anObject [ 
	<syntax: #(include key:)>
	^SpecOfDictionaryKeys requiredKey: anObject
]

{ #category : #initialization }
SpecOfPragmaBasedShouldExpression class >> initialize [

	self beCurrent
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> raiseError [
	<syntax: #(raise error)>
	^SpecOfBlockFailure requiredFailure: (SpecOfObjectSuperclass requiredClass: Error)
]

{ #category : #expressions }
SpecOfPragmaBasedShouldExpression class >> respondTo: aSelector [ 
	<syntax: #(respond to:)>
	^SpecOfObjectResponsibility for: aSelector
]

{ #category : #pragmas }
SpecOfPragmaBasedShouldExpression class >> syntaxPragmaDefinition [
	<pragmas: #class>
	^#(#syntax:)
]

{ #category : #initialization }
SpecOfPragmaBasedShouldExpression class >> unload [

	superclass beCurrent 
]

{ #category : #dispatching }
SpecOfPragmaBasedShouldExpression >> be [
	^self doesNotUnderstand: (Message selector: #be)
]

{ #category : #dispatching }
SpecOfPragmaBasedShouldExpression >> doesNotUnderstand: aMessage [ 
	| spec |
	"special trick to support boolean properties from subclass functionallity"
	(driver currentMessage notNil and: [driver currentMessage selector == #be]) ifTrue: [ 
			[driver acceptMessage: aMessage] on: SpecOfUnexpectedMessage do: [
				^aMessage sendTo: super be].
			^self
	].

	driver acceptMessage: aMessage.
	driver isClauseComplete ifFalse: [^self].
	
	spec := driver createTarget. 
	spec title: driver path printSpecTitle.
	self verify: spec
]

{ #category : #accessing }
SpecOfPragmaBasedShouldExpression >> driver [
	^ driver
]

{ #category : #accessing }
SpecOfPragmaBasedShouldExpression >> driver: anObject [
	driver := anObject
]

{ #category : #dispatching }
SpecOfPragmaBasedShouldExpression >> error [
	^self doesNotUnderstand: (Message selector: #error)
]

{ #category : #initialization }
SpecOfPragmaBasedShouldExpression >> initialize [
	| pragmas |
	super initialize.
	
	pragmas := Pragma allNamed: #syntax: in: self class class.
	
	driver := SpecOfShouldExpressionDriver on: pragmas.
]
