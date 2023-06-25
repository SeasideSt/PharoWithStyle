Class {
	#name : #ReUnnecessaryLastPeriodRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #helpers }
ReUnnecessaryLastPeriodRuleTest >> myCritiquesOnNodesInMethod: aMethod [
	| critiques |
	critiques := OrderedCollection new.
	aMethod ast nodesDo: [ :node | 
		self subjectUnderTest new
			check: node forCritiquesDo:[ :critique | critiques add: critique].
		].
	^ critiques
]

{ #category : #tests }
ReUnnecessaryLastPeriodRuleTest >> testRule [
	| critiques |
	critiques := self myCritiquesOnNodesInMethod: self class >> #unnecessaryLastPeriod.
	self assert: critiques size equals: 2
]

{ #category : #examples }
ReUnnecessaryLastPeriodRuleTest >> unnecessaryLastPeriod [ 
	| collection |
	collection := OrderedCollection new.
	collection do: [ :e | 1. 2. ].
	1. 2.
]
