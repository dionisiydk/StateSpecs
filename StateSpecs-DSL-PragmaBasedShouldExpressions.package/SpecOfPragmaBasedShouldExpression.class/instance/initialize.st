initialization
initialize
	| pragmas |
	super initialize.
	
	pragmas := Pragma allNamed: #syntax: in: self class class.
	
	driver := SpecOfShouldExpressionDriver on: pragmas.