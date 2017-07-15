I am root of hierarchy of object state specifications.

I provide two methods to check objects. One is #matches: which returns true or false. And other is #validate: which returns object validation result with detailed information about failure (if object not satisfies spec).

My subclasses should define at least #basicMatches: method to check if given object satisfied specification or not.

I has denial variable which used to mark me as opposite specification to my original purpose. Method #matches: take it into account. And implementors of basicMatches: should not think about it. 

Also subclasses can override #validate: method to retrive more specific  information about given objects. 

Public API and Key Messages

- matches: anObject 
it checks if anObject matches specification or not.   It returns true or false.

- validate: anObject 
it checks if anObject matches specification or not.   It returns SpecOfValidationResult instance which can be success or failure.

-not
It creates my copy with negation behaviour

-&
It creates SpecOfAndConjunction instance with me and my argument

-| 
It cretes SpecOfOrDisjunction instance with me and my argument

-title:
It sets special name of me. There is defaultTitle by default

-failureDescription:
It sets special description for validation failure


   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	denial:		<Boolean>
	title:		<String>
	failureDescription:		<String>
