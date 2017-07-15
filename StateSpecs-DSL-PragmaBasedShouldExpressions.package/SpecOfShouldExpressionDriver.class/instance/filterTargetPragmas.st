private
filterTargetPragmas
	| matchesPragmas |
	matchesPragmas := targetPragmas select: 
					[:each | 
					each stateSpecsShouldClause size >= progress 
						and: [(each stateSpecsShouldClause at: progress) = currentMessage selector]].
	matchesPragmas isEmpty ifTrue: [SpecOfUnexpectedMessage signal].
	targetPragmas := matchesPragmas