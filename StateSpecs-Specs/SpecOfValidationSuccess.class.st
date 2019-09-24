"
I represent successful spec validation.

My superclass define singleton for me 

	SpecOfValidationResult success
"
Class {
	#name : #SpecOfValidationSuccess,
	#superclass : #SpecOfValidationResult,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfValidationSuccess >> isFailure [
	^false
]

{ #category : #accessing }
SpecOfValidationSuccess >> raise [
]

{ #category : #accessing }
SpecOfValidationSuccess >> subjectOwner: anObject [
	"Sucess result does not care about subject which was successfully validated 
	and therefore it does not care where this subject was retrieved"
]
