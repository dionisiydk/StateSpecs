Class {
	#name : #SpecOfFutureState,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'requiredState',
		'maxWaitingTime'
	],
	#category : #'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfFutureState class >> requiredState: anObjectOrSpec [ 
	^self new requiredState: anObjectOrSpec
]

{ #category : #testing }
SpecOfFutureState >> basicMatches: aBlock [

	| startTime |
	startTime := DateAndTime now.
	[(requiredState matches: aBlock value) ifTrue: [^true].
	DateAndTime now < (startTime + maxWaitingTime)] whileTrue: [
		100 milliSeconds wait].
	
	^requiredState matches: aBlock value
]

{ #category : #displaying }
SpecOfFutureState >> defaultTitle [
	^'take a while to ', requiredState title
]

{ #category : #initialization }
SpecOfFutureState >> initialize [
	super initialize.
	
	maxWaitingTime := 200 milliSeconds
]

{ #category : #accessing }
SpecOfFutureState >> invertChildren [
	super invertChildren.
	requiredState invert
]

{ #category : #accessing }
SpecOfFutureState >> maxWaitingTime [
	^ maxWaitingTime
]

{ #category : #accessing }
SpecOfFutureState >> maxWaitingTime: anObject [
	maxWaitingTime := anObject
]

{ #category : #accessing }
SpecOfFutureState >> requiredState [
	^ requiredState
]

{ #category : #accessing }
SpecOfFutureState >> requiredState: anObject [
	requiredState := anObject asStateSpec
]

{ #category : #testing }
SpecOfFutureState >> validate: aBlock [

	| startTime validationResult |
	startTime := DateAndTime now.
	[validationResult := requiredState validate: aBlock value.
	validationResult isSuccess ifTrue: [^validationResult].
	DateAndTime now < (startTime + maxWaitingTime)] whileTrue: [
		100 milliSeconds wait].
	
	^requiredState validate: aBlock value
]
