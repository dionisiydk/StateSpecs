expressions
include: anObjectOrSpec
	^ self verify: (SpecOfCollectionContents requiredItemSpec: anObjectOrSpec asStateSpec)