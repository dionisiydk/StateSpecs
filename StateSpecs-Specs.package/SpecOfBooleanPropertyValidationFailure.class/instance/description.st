printing
description
	subjectOwner ifNil: [ ^subject stringForSpecValidation , ' ' , spec description].
	
	^super description
	