Class {
	#name : #ReAbstractNodeCheckRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #helpers }
ReAbstractNodeCheckRuleTest >> myCritiquesOnNodesInMethod: aMethod [

	| critiques |
	critiques := OrderedCollection new.
	aMethod ast nodesDo: [ :node | 
		self subjectUnderTest new
			check: node forCritiquesDo:[ :critique | critiques add: critique ] ].
	^ critiques
]
