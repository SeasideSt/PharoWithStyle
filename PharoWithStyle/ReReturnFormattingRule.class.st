Class {
	#name : #ReReturnFormattingRule,
	#superclass : #ReAbstractRule,
	#category : #PharoWithStyle
}

{ #category : #helpers }
ReReturnFormattingRule >> anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode
			interval: (Interval from: aNode start to: aNode stop)
]

{ #category : #initialization }
ReReturnFormattingRule >> basicCheck: aNode [

	^ aNode isReturn and: [ aNode start + 2 ~= aNode value start ]
]

{ #category : #accessing }
ReReturnFormattingRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReReturnFormattingRule >> name [

	^ 'Return formatting'
]

{ #category : #accessing }
ReReturnFormattingRule >> rationale [

	^ 'There should be a single space between the ^ and the following expression.'
]
