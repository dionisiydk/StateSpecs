printing
description
	errorValidationResult ifNil: [ ^'Got no failures but ' , spec description ].
	
	^errorValidationResult description