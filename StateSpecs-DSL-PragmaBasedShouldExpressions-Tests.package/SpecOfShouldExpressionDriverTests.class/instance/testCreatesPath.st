tests
testCreatesPath
	| driver pragma result |
	pragma := (Pragma allNamed: #syntax: in: SpecOfSyntaxTargetSample class) first.
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver 
		currentMessage: (Message selector: #someMessage: arguments: #(#arg)).
	result := driver path.
	self assert: result class = SpecOfShouldExpressionPath.
	self assert: result clause == pragma stateSpecsShouldClause.
	self assert: result arguments = #(#arg)