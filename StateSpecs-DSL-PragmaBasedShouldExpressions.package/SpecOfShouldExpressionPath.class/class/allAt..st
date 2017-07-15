instance creation
allAt: sourceContext 
	| arguments pragmas |
	arguments := sourceContext arguments.
	pragmas := sourceContext method pragmas select: [:each | each keyword == #syntax:].
	^pragmas 
		collect: [:each | SpecOfShouldExpressionPath clause: each stateSpecsShouldClause arguments: arguments]