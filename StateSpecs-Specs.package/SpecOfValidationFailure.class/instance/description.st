printing
description
	subjectOwner ifNil: [ 
		^'Got "', subject stringForSpecValidation , '" but it ' , spec description].
	
	^'Got "', subject stringForSpecValidation , '" from ', subjectOwner stringForSpecValidation, ' but it ' , spec description.