I describe collection item at concrete collection index or dictionary key. 

	#(one two) should include: #one at: 1

My instance can be created by:

	SpecOfCollectionItem at: 1 requiredItem: #one.
	
Required item can be a simple object like in example or it can be full specification:

	#(one two) should include: (Kind of: String ) at: 1		

Also you can use a block: 

	#(one two) should include: [:item | item isAllDigits] at: 1

Block is converted to predicate specification.
			 
Internal Representation and Key Implementation Points.

    Instance Variables
	containingKey:		<Object>
	requiredItem:		<SpecOfObjectState>