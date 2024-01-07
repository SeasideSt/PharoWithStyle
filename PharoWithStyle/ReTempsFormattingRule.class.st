Class {
	#name : #ReTempsFormattingRule,
	#superclass : #ReNodeBasedRule,
	#category : #PharoWithStyle
}

{ #category : #helpers }
ReTempsFormattingRule >> anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode
			interval: (Interval from: aNode leftBar to: aNode rightBar)
]

{ #category : #running }
ReTempsFormattingRule >> basicCheck: aNode [

	^ aNode isSequence 
		and:[ aNode leftBar notNil 
			and: [ aNode rightBar notNil
				and:[
					| found position |
					found := false.
					position := aNode leftBar.
					aNode temporaries do: [ :each |
						found := found or: [ position + 2 ~= each start ].
						position := each stop ].
					found := found or: [ position + 2 ~= aNode rightBar ].
					found ] ] ]
]

{ #category : #accessing }
ReTempsFormattingRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReTempsFormattingRule >> name [

	^ 'Temporaries formatting'
]

{ #category : #accessing }
ReTempsFormattingRule >> rationale [

	^ 'There should be a single space between the | and the individual temps.'
]
