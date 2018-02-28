*StateSpecs-GTTools
gtInspectorIn: composite forFailedValidationOf: anObject

	^composite diff
		title: 'String vs expected part';
		display: [ 
			{anObject gtDebuggerSUnitPrint. requiredValue gtDebuggerSUnitPrint} ]