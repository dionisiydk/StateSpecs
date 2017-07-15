*StateSpecs-Specs
stringForSpecTitle
	^String streamContents: [:s | 
		
		self printNameOn: s.
		s nextPut: ${.
		self do: [:element | s << element stringForSpecTitle << '. '].
		self ifNotEmpty: [s skip: -2].
		s nextPut: $}
	]