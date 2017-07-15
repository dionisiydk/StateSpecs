pages
overview
	^ HelpTopic 
		title: 'Overview'
		contents:
'StateSpecs is object state specification framework. It describes particular object states by first class specifications. For example there are SpecOfCollectionItem, SpecOfObjectClass and SpecOfObjectSuperclass. They can match and validate given objects. In case when object is not satisfied specification you will get failure result with detailed information about problem.

	spec matches: anObject.
	spec validate: anObject. "it returns validation result which can be success or particular failure"

To easily create specifications and validate objects by them StateSpecs provides two kind DSL: should expressions and "word" classes.
First allows you to write "assertions":

	1 should be: 2
	1 should equal: 10

And second allows you to instantiate specs by natural readable words:

	Kind of: Number
	Instance of: String
	Equal to: ''test'''