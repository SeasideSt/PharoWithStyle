Class {
	#name : #BaselineOfPharoWithStyle,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoWithStyle
}

{ #category : #baselines }
BaselineOfPharoWithStyle >> baseline: spec [
	<baseline>
	
   spec for: #pharo do: [ 
	   spec
		   package: 'PharoWithStyle';
		   package: 'PharoWithStyle-Tests' with: [ spec requires: 'PharoWithStyle' ].
	   spec
			group: 'default' with: #('PharoWithStyle');
			group: 'tests' with: #('PharoWithStyle' 'PharoWithStyle-Tests') ]
]
