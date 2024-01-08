Class {
	#name : #ReNoPeriodAfterReturnRule,
	#superclass : #ReNodeBasedRule,
	#category : #PharoWithStyle
}

{ #category : #helpers }
ReNoPeriodAfterReturnRule >> anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode
			interval: (Interval from: aNode parent periods last to: aNode parent periods last + 1)
]

{ #category : #running }
ReNoPeriodAfterReturnRule >> basicCheck: node [

	^ node isReturn and: [
		node == node parent statements last and: [
			node parent periods notEmpty and: [
				node parent periods last > node stop ] ] ]
]

{ #category : #accessing }
ReNoPeriodAfterReturnRule >> group [

	^ 'Formatting'
]

{ #category : #accessing }
ReNoPeriodAfterReturnRule >> name [

	^ 'Return statements should not end with a period'
]

{ #category : #accessing }
ReNoPeriodAfterReturnRule >> rationale [

	^ 'Return statements are conventionally not ended with a period as they cannot be followed by another statement.'
]

{ #category : #accessing }
ReNoPeriodAfterReturnRule >> severity [

	^ #information
]
