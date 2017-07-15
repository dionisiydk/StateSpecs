I am root of hierarchy of composite specifications.

My instance can be created by binary messages to spec instances:

	(Instance of: String) & (Satisfying for: [:o | true])
	(Instance of: String) | (Satisfying for: [:o | true])

Internal Representation and Key Implementation Points.

    Instance Variables
	specs:		<Collection of: <SpecOfObjectState>>