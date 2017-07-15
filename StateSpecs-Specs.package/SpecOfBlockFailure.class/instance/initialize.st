initialization
initialize
	super initialize.
	
	shouldPassUnexpectedFailures := false.
	passingFailures := {SpecOfFailed. Halt. MessageNotUnderstood. Deprecation} asOrderedCollection