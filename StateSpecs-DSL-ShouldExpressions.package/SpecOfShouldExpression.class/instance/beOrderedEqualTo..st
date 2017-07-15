expressions
beOrderedEqualTo: aCollection 
	self
		deprecated: 'Please use #equalInOrder:  instead'
		transformWith: '`@receiver beOrderedEqualTo: `@statements1' 
						-> '`@receiver equalInOrder: `@statements1'.
	
	^self equalInOrder: aCollection