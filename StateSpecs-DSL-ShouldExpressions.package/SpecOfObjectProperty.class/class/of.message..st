instance creation
of: anObjectProperty message: aMessage

	^self new 
		parent: anObjectProperty;
		parentMessage: aMessage;
		updateValue;
		yourself