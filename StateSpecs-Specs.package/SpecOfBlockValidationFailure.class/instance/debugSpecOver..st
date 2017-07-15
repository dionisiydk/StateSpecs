debugging
debugSpecOver: aSpecFailed

	errorValidationResult ifNil: [ ^super debugSpecOver: aSpecFailed ].
	
	aSpecFailed allowExtraDebugging.
	super debugSpecOver: aSpecFailed.
		
	spec passUnexpectedFailures.
	(spec validate: subject) raise