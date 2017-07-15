accessing
copy
	| result |
	result := super copy.
	
	result specs: (specs collect: [:each | each copy]).
	
	^result