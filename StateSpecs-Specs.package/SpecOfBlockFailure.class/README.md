I describe blocks which raise specific kind of exceptions.

	[ 1 /0 ] should raise: ZeroDivide

My instances can be created by: 

	SpecOfBlockFailure requiredFailure: ZeroDivide.

I also support using specs for required failure:

	SpecOfBlockFailure requiredFailure: (Instance of: Error).		
			
By default I implement special logic to catch unexpected exceptions and return it as special kind of validation falure. For example:

	[ #() at: 1 ] should raise: ZeroDivide 

This code will not show debugger at point of SubscriptOutOfBounds error.  But it will show that specification is failed and SubscriptOutOfBounds was thrown instead of ZeroDivide. Pressing proceed in debugger will move it to original failure. 

To disable this behaviour I have variable shouldPassUnexpectedFailure.
Also I have array of special failures which should be always passed without validation logic. It is Halt, MessageNotUnderstood and SpecOfFailed. Usually this errors should be thrown immediatly in debugger. 

	[ 1 someMessage ] should raise: Error

This code will open debugger at DNU method where absent message can be created.
But if errors are explicitly expected failures then they will be checked by validation logic:

	[ 1 someMessage ] should raise: MessageNotUnderstood 

This code will not open debugger because validation is succeed.

In addition I return special success validation result (SpecOfFailureValidationSuccess) which holds signaled exception instance: 

	errorValidation := [ self error: 'my test error' ] should fail.
	errorValidation signaledFailure "==> Error: my test error"

It allows to perform additional validation over caught failure: 

	errorValidation should beInstanceOf: Error.
	errorValidation where description should includesSubstring: 'my test'.
	
Internal Representation and Key Implementation Points.

    Instance Variables
	requiredFailure:		<SpecOfObjectState>
	passingFailures:		<Collection of<Exception>>
	shouldPassUnexpectedFailures:		<Boolean>
