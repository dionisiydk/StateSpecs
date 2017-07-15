I describe any dictionare which contains particular key.

	(Dictionary newFromPairs: #(key value)) should includeKey: #key

My instances can be created by 

	SpecOfDictionaryKeys requiredKey: #key
 
Internal Representation and Key Implementation Points.

    Instance Variables
	requiredKey:		<Object>