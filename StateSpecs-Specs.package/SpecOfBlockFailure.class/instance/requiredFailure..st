accessing
requiredFailure: exceptionClassOrSpec

	passingFailures remove: exceptionClassOrSpec ifAbsent: [  ]. "if this spec explicitly about passing failure then we should not pass it during validation"
	
	requiredFailure := self specForFailure: exceptionClassOrSpec