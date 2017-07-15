tests
testCreatesTarget
	| driver pragma result |
	pragma := ((Pragma allNamed: #syntax: in: SpecOfSyntaxTargetSample class) 
				select: [:each | (each stateSpecsShouldClause includes: #created) and: [each stateSpecsShouldClause size = 5]]) 
					first.
	driver := SpecOfShouldExpressionDriver on: (Array with: pragma).
	driver 
		currentMessage: (Message selector: #someMessage: arguments: #(#arg)).
	result := driver createTarget.
	self assert: result class = SpecOfSyntaxTargetSample.
	self assert: result argument == #arg