accessing
specForFailure: exceptionClassOrSpec

	^exceptionClassOrSpec isClass & (exceptionClassOrSpec ~= Any)
		ifTrue: [ SpecOfObjectClass requiredClass: exceptionClassOrSpec ]
		ifFalse: [ exceptionClassOrSpec asStateSpec ]