I describe collection item. 

	#(one two) should include: #one at: 1

My instance can be created by:

	SpecOfCollectionItem at: 1 requiredItem: #one.
	
I support using specifications for required item:

	#(one two) should include: (Kind of: String ) at: 1		
			 
Internal Representation and Key Implementation Points.

    Instance Variables
	containingKey:		<Object>
	requiredItem:		<SpecOfObjectState>