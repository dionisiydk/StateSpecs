Class {
	#name : #BaselineOfStateSpecs,
	#superclass : #BaselineOf,
	#category : #BaselineOfStateSpecs
}

{ #category : #baselines }
BaselineOfStateSpecs >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		spec 
			package: 'StateSpecs-Specs';
			package: 'StateSpecs-DSL-ShouldExpressions' with: [ spec requires: #('StateSpecs-Specs') ];
			package: 'StateSpecs-DSL-ClassWords' with: [ spec requires: #('StateSpecs-Specs') ];
			package: 'StateSpecs-Help' with: [
				spec requires: #('StateSpecs-DSL-ShouldExpressions' 'StateSpecs-DSL-ClassWords')];
			
			package: 'StateSpecs-Specs-Tests' with: [ spec requires: 'StateSpecs-Specs' ];
			package: 'StateSpecs-GTTools' with: [ spec requires: 'StateSpecs-Specs' ];
			package: 'StateSpecs-DSL-ShouldExpressions-Tests' with: [ 
				spec requires: 'StateSpecs-DSL-ShouldExpressions' ];
			package: 'StateSpecs-DSL-ClassWords-Tests' with: [ 
				spec requires: 'StateSpecs-DSL-ClassWords' ].
			
		spec 
			baseline: 'Ghost' with: [
		 	    spec repository: 'github://pharo-ide/Ghost:v5.0.x'];
			project: 'GhostCore' copyFrom: 'Ghost' with: [
		 	    spec	loads: #('ObjectGhost')];
			project: 'GhostTests' copyFrom: 'Ghost' with: [
		 	    spec	loads: #('ObjectGhostTests' )];
			package: 'StateSpecs-GhostSupport' with: [ 
				spec requires: #('GhostCore' 'StateSpecs-Specs' 'StateSpecs-DSL-ShouldExpressions') ];
			package: 'StateSpecs-GhostSupport-Tests' with: [ 
				spec requires: #('GhostTests' 'StateSpecs-GhostSupport') ].
			
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('StateSpecs-Specs' 'StateSpecs-DSL-ShouldExpressions' 'StateSpecs-DSL-ClassWords');
			group: 'Tests' with: #('StateSpecs-Specs-Tests' 'StateSpecs-DSL-ShouldExpressions-Tests' 'StateSpecs-DSL-ClassWords-Tests' 'StateSpecs-Help' 'StateSpecs-GTTools');
			group: 'GhostSupport' with: #('StateSpecs-GhostSupport');
			group: 'GhostSupportTests' with: #('GhostSupport' 'StateSpecs-GhostSupport-Tests')
	]
]

{ #category : #accessing }
BaselineOfStateSpecs >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]
