displaying
messageText
	^messageText ifNil: [messageText := reason description]