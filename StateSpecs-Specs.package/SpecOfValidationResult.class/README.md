I am root of hierarchy of spec validation results.

My subclasses should implement method #raise to signal failures.
I define successful validation result as singleton.
	
	SpecOfValidationResult success  

Public API and Key Messages

- isSuccess   
- isFailure 
- raise