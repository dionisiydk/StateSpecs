I represent successful result of failure validation during block execution by SpecOfBlockFailure spec.

I was introduced to not loose caught exception instance and allow extra validation using should expressions: 

	error := [ self error: 'some error' ] should raise: Error.
	error should beInstanceOf: Error.
	error where description should includeSubstring: 'some'

Create my instances with following expression: 

	SpecOfFailureValidationSuccess with: anError
	
Internal Representation and Key Implementation Points.

    Instance Variables
	signaledFailure:		<Exception>