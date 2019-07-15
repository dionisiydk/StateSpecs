Class {
	#name : #SpecOfFutureState,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredState',
		'maxTime'
	],
	#category : #'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfFutureState class >> requiredFailure: anExceptionClass [ 
	^self new requiredFailure: anExceptionClass
]

{ #category : #testing }
SpecOfFutureState >> basicMatches: aBlockContext [ 
	^
	[aBlockContext value.
	false] on: Exception
			do: 
				[:ex | 
				(self shouldAlwaysPassFailure: ex) ifTrue: [ex pass].
				(requiredFailure matches: ex) ifTrue: [true] ifFalse: [
					shouldPassUnexpectedFailures ifTrue: [ ex pass] ifFalse: [false] ]]
]

{ #category : #displaying }
SpecOfFutureState >> defaultTitle [
	^requiredFailure title
]

{ #category : #initialization }
SpecOfFutureState >> initialize [
	super initialize.
	
	shouldPassUnexpectedFailures := false.
	passingFailures := {SpecOfFailed. Halt. MessageNotUnderstood. Deprecation} asOrderedCollection
]

{ #category : #accessing }
SpecOfFutureState >> invertChildren [
	super invertChildren.
	requiredFailure invert
]

{ #category : #accessing }
SpecOfFutureState >> maxTime [
	^ maxTime
]

{ #category : #accessing }
SpecOfFutureState >> maxTime: anObject [
	maxTime := anObject
]

{ #category : #accessing }
SpecOfFutureState >> requiredState [
	^ requiredState
]

{ #category : #accessing }
SpecOfFutureState >> requiredState: anObject [
	requiredState := anObject
]

{ #category : #accessing }
SpecOfFutureState >> specForFailure: exceptionClassOrSpec [

	^exceptionClassOrSpec isClass & (exceptionClassOrSpec ~= Any)
		ifTrue: [ SpecOfObjectSuperclass requiredClass: exceptionClassOrSpec ]
		ifFalse: [ exceptionClassOrSpec asStateSpec ]
]

{ #category : #validation }
SpecOfFutureState >> validate: aBlock [

	| result |
	^[aBlock value.
	(requiredFailure matches: Any) 
		ifTrue: [ SpecOfValidationResult success ]
		ifFalse: [ SpecOfBlockValidationFailure noErrorIn: aBlock butShouldBe: self]]
			on: Exception do: [:ex | 
				(self shouldAlwaysPassFailure: ex) ifTrue: [ex pass]. "we want to pass by default DNU, Halt and internal SpecOfFailed failures"
			
				requiredFailure denial: denial. 
				result := requiredFailure validate: ex.
			
				result isSuccess 
					ifTrue: [ SpecOfFailureValidationSuccess with: ex ] 
					ifFalse: [ 
						shouldPassUnexpectedFailures
							ifTrue: [ ex pass ]
							ifFalse: [ SpecOfBlockValidationFailure unexpectedError: result in: aBlock butShouldBe: self]]
		]
]
