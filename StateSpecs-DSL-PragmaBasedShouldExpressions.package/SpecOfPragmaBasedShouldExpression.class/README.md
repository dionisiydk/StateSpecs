I implement  "should DSL" expressions by pragma approach.

To define new should expressions you should implement new method on class side which will return required specification. This method should be marked with pragma #syntax:  which define concrete should sentence:

>>beInstanceOf: aClass 
	<syntax: #(be an instance of:)>
	<syntax: #(be instance of:)>
	^SpecOfObjectClass requiredClass: aClass

And then you can write  expressions like:
	 4 should be an instance of: SmallInteger
	 4 should be instance of: SmallInteger

Internal Representation and Key Implementation Points.

    Instance Variables
	driver:		<SpecOfSyntaxDriver>
