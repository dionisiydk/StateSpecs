instance creation
of: arrayOfPatterns 
	^self new specs: (arrayOfPatterns collect: [:each | each asStateSpec])