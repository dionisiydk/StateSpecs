controlling
acceptMessage: aMessage 
	currentMessage := aMessage.
	progress := progress + 1.
	self filterTargetPragmas