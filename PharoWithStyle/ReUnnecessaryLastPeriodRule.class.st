Class {
	#name : #ReUnnecessaryLastPeriodRule,
	#superclass : #ReNodeBasedRule,
	#category : #PharoWithStyle
}

{ #category : #helpers }
ReUnnecessaryLastPeriodRule >> anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode statements last
			interval: (Interval from: aNode periods last to: aNode periods last + 1)
]

{ #category : #running }
ReUnnecessaryLastPeriodRule >> basicCheck: node [

	^ node isSequence and: [
		  node statements notEmpty and: [
			  node periods notEmpty and: [
				  node periods last > node statements last stop ] ] ]
]

{ #category : #accessing }
ReUnnecessaryLastPeriodRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReUnnecessaryLastPeriodRule >> name [

	^ 'Unnecessary Last Period'
]

{ #category : #accessing }
ReUnnecessaryLastPeriodRule >> rationale [

	^ 'Periods are not needed after the last statement.'
]
