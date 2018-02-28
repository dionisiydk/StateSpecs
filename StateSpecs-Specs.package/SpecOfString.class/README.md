I am root of hierarchy of string specifications.

I provide requiredSubstring and caseSensitive properties. And my subclasses should use them accordingly their logic. 

Instance should be created using following messages: 

	SpecOfString requiredSubstring: 'test'.
	SpecOfString requiredSubstring: 'test' caseSensitive: false

My default I am not case sensitive.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	caseSensitive:		<Boolean>
	requiredSubstring:		<String>