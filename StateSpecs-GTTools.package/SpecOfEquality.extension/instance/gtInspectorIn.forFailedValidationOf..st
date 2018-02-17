*StateSpecs-GTTools
gtInspectorIn: composite forFailedValidationOf: anObject

	^composite diff
		title: 'Diff (actual vs. expected)';
		display: [ 
			{anObject gtDebuggerSUnitPrint. requiredValue gtDebuggerSUnitPrint} ]