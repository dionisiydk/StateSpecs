expressions
raiseError
	<syntax: #(raise error)>
	^SpecOfBlockFailure requiredFailure: (SpecOfObjectSuperclass requiredClass: Error)