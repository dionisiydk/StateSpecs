testing
isClauseComplete
	targetPragmas size > 1 ifTrue: [^false].
	^progress = targetPragmas first stateSpecsShouldClause size