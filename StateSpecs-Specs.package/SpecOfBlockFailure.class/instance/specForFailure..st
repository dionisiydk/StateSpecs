accessing
specForFailure: exceptionClassOrSpec

	^exceptionClassOrSpec isClass & (exceptionClassOrSpec ~= Any)
		ifTrue: [ SpecOfObjectSuperclass requiredClass: exceptionClassOrSpec ]
		ifFalse: [ exceptionClassOrSpec asStateSpec ]