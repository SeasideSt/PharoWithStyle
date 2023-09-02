Class {
	#name : #ReUnnecessaryLastPeriodRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'PharoWithStyle-Tests'
}

{ #category : #examples }
ReUnnecessaryLastPeriodRuleTest >> lastPeriods [

	| collection |
	collection := OrderedCollection new.
	collection do: [ :e | 1. 2 ].
	1. 2
]

{ #category : #helpers }
ReUnnecessaryLastPeriodRuleTest >> myCritiquesOnNodesInMethod: aMethod [

	| critiques |
	critiques := OrderedCollection new.
	aMethod ast nodesDo: [ :node | 
		self subjectUnderTest new
			check: node forCritiquesDo:[ :critique | critiques add: critique ] ].
	^ critiques
]

{ #category : #tests }
ReUnnecessaryLastPeriodRuleTest >> testRule [

	| critiques |
	critiques := self myCritiquesOnNodesInMethod: self class >> #unnecessaryLastPeriod.
	self assert: critiques size equals: 2.
	critiques := self myCritiquesOnNodesInMethod: self class >> #lastPeriods.
	self assert: critiques size equals: 0
]

{ #category : #violations }
ReUnnecessaryLastPeriodRuleTest >> unnecessaryLastPeriod [

	| collection |
	collection := OrderedCollection new.
	collection do: [ :e | 1. 2. ].
	1. 2.
]
