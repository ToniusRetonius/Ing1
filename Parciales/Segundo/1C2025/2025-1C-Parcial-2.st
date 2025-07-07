!classDefinition: #PaintorTest category: #'2025-1C-Parcial-2'!
TestCase subclass: #PaintorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:41:30'!
test01PaintorCannotAddAPaintingBiggerThanTheWall

	| paintor |
	paintor := Paintor onWall: self exampleWall.
	
	self should: [paintor paint: (Rectangle origin: (10@5) extent: (3@3) )] raise: Error withMessageText: Wall paintingIsOutOfBoundsMessageError.! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:45:29'!
test02PaintorCanAddAPaintingSmallerThanTheWallWithinBounds

	| paintor wall |
	wall := self exampleWall.
	paintor := Paintor onWall: wall.
	paintor paint: (self paintingTwoExample).
	
	self assert: wall isPainted.! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:49:53'!
test03PaintorCannotAddADuplicatedPaintingToTheWall

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	paintor paint: self paintingOneExample .
	
	self should: [paintor paint: self paintingOneExample ] raise: Error withMessageText: Wall duplicatedPaintingMessageError! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:44:41'!
test04PaintorCanSelectAPaintingFromAWall

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	paintor paint: (self paintingOneExample); 	select: (self paintingOneExample).
	
	self deny: paintor isYourSelectionEmpty 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:44:42'!
test05PaintorCannotSelectAPaintingFromAWallThatHasAlreadySelected

	| wall paintor |
	wall := self exampleWall. 
	
	paintor := Paintor onWall: wall.
	paintor paint: (self paintingOneExample);select: (self paintingOneExample).
	
	self should: [paintor select: (self paintingOneExample) ] raise: Error  withMessageText: Paintor paintingAlreadyInRepertoireMessageError 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:45:29'!
test06PaintorCanSelectMultiplePaintingsFromAWall

	| wall paintor painting1 painting2 |
	wall := self exampleWall. 
	
	paintor := Paintor onWall: wall.
	painting1 := self paintingOneExample.
	painting2 := self paintingTwoExample.
	
	paintor paint: painting1 ; paint: painting2 .
	paintor select: painting1 ; select: painting2 .
	
	self deny: paintor isYourSelectionEmpty .
	self assert: (paintor paintingsSelectedAmount) = 2.
	 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:41:19'!
test07PaintorCannotAlignAPaintingWhenNoPaintingIsSelected

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	
	self should: [paintor align: #left] raise: Error  withMessageText: Paintor cannotALignPaintingsWhenEmptySelectionMessageError 	 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 19:48:28'!
test08PaintorCannotAlignAPaintingWhenOnlyOnePaintingIsSelected

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	paintor paint: self paintingOneExample ; select: self paintingOneExample .

	self should: [paintor align: #left] raise: Error  withMessageText: Paintor cannotAlignOneSelectedPaintingMessageError 	 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 20:48:57'!
test09PaintorAlignsTwoPaintingsLeftCorrectly

	| paintor wall selection | 
	wall := self alignmentWallExample.
	paintor := Paintor onWall: wall.
	
	paintor paint: self alignPaintingExample1 ; paint: self alignPaintingExample2 ; select: self alignPaintingExample1 ; select: self alignPaintingExample2 .
 	 
	paintor align:#left.
	
	selection := OrderedCollection with: self alignPaintingExample2 with: self alignPaintingExample1.
	
	self assert: (wall assertSelection: selection isLeftAlignedWith: 0)
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 21:07:53'!
test10PaintorAlignsTwoPaintingsRigthCorrectly

	| paintor wall selection | 
	wall := self alignmentWallExample.
	paintor := Paintor onWall: wall.
	
	paintor paint: self alignPaintingExample1 ; paint: self alignPaintingExample2 ; select: self alignPaintingExample1 ; select: self alignPaintingExample2 .
 	 
	paintor align: #rigth.
	selection := OrderedCollection with: self alignPaintingExample2 with: self alignPaintingExample1.
	self assert: (wall assertSelection: selection isRigthAlignedWith: 15)! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 21:11:34'!
test11PaintorAlignsOnlySelectedPaintingsAndDoesNotModifyInternalStructureOfTheWall

	| paintor wall selection | 
	wall := self alignmentWallExample.
	paintor := Paintor onWall: wall.
	
	paintor paint: self paintingOneExample ;  paint: self alignPaintingExample1 ; paint: self alignPaintingExample2 ; select: self alignPaintingExample1 ; select: self alignPaintingExample2 .
 	 
	paintor align: #rigth.
	selection := OrderedCollection with: self alignPaintingExample2 with: self alignPaintingExample1.
	
	self assert: (wall assertSelection: selection isRigthAlignedWith: 15)! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 21:33:42'!
test12PaintingAffectsLog
	
	| paintor wall log | 
	log := Log new .
	wall :=	 Wall origin: (0@0) extent: (30@30) onLog: log.
	paintor := Paintor onWall: wall.
	paintor paint: self alignPaintingExample1.
	
	self assert: log isNotEmpty
	
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 21:42:13'!
test13PaintorCanUndoAPainting
	
	| paintor wall log | 
	log := Log new .
	wall :=	 Wall origin: (0@0) extent: (30@30) onLog: log.
	paintor := Paintor onWall: wall.
	paintor paint: self alignPaintingExample1.
	
	log unPaint: self alignPaintingExample1.
	
	self assert: (wall paintingDoesNotBelong: self alignPaintingExample1).
	
	! !


!PaintorTest methodsFor: 'setup' stamp: 'tomas Melli 7/4/2025 19:54:54'!
alignPaintingExample1

	^ Rectangle origin: (0@0) extent: (5@5)! !

!PaintorTest methodsFor: 'setup' stamp: 'tomas Melli 7/4/2025 19:55:10'!
alignPaintingExample2

	^ Rectangle origin: (5@3) extent: (10@10)! !

!PaintorTest methodsFor: 'setup' stamp: 'tomas Melli 7/4/2025 21:30:36'!
alignmentWallExample

	^ Wall origin: (0@0) extent: (30@30) onLog: (Log new) ! !

!PaintorTest methodsFor: 'setup' stamp: 'tomas Melli 7/4/2025 21:30:51'!
exampleWall

	^ Wall origin: (10@5) extent: (3@2) onLog: (Log new)! !

!PaintorTest methodsFor: 'setup' stamp: 'tomas Melli 7/4/2025 19:44:41'!
paintingOneExample

	^ Rectangle origin: (10@5) extent: (1@1)! !

!PaintorTest methodsFor: 'setup' stamp: 'tomas Melli 7/4/2025 19:45:29'!
paintingTwoExample

	^ Rectangle origin: (11@6) extent: (1@1)! !


!classDefinition: #WallTest category: #'2025-1C-Parcial-2'!
TestCase subclass: #WallTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!WallTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 21:32:15'!
test01WallCannotHaveNegativeExtent
	
	self should: [Wall origin: (0@0) extent: (-1@0) onLog:(Log new) ] raise: Error  withMessageText: Wall extentIsNegativeMessageError ! !

!WallTest methodsFor: 'tests' stamp: 'tomas Melli 7/4/2025 21:32:26'!
test02WallCannotBeCreatedFurtherFrom00
	
	self should: [Wall origin: (-1@0) extent: (0@0) onLog: (Log new) ] raise: Error  withMessageText: Wall originOutOfBoundsMessageError ! !


!classDefinition: #Log category: #'2025-1C-Parcial-2'!
Object subclass: #Log
	instanceVariableNames: 'wall register'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Log methodsFor: 'initialization' stamp: 'tomas Melli 7/4/2025 21:34:18'!
initialize
	register := OrderedCollection new.! !


!Log methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 21:23:31'!
isNotEmpty
	^register isEmpty not! !


!Log methodsFor: 'register' stamp: 'tomas Melli 7/4/2025 21:35:53'!
paintorPainted: aPainting 
	
	register add: aPainting ! !


!Log methodsFor: 'undo' stamp: 'tomas Melli 7/4/2025 21:42:55'!
unPaint: aPainting 
	! !


!classDefinition: #Paintor category: #'2025-1C-Parcial-2'!
Object subclass: #Paintor
	instanceVariableNames: 'wall selection'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Paintor methodsFor: 'paint' stamp: 'tomas Melli 7/4/2025 18:31:05'!
paint: aPainting 
	
	wall painted: aPainting 	! !


!Paintor methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:18:13'!
assertPaintingIsNotSelectedAlready: aPainting 
	(selection includes: aPainting) ifTrue: [self error: self class paintingAlreadyInRepertoireMessageError]! !

!Paintor methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:47:51'!
assertSelectionHasOnePainting
	(selection size = 1) ifTrue: [self error: self class cannotAlignOneSelectedPaintingMessageError]! !

!Paintor methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:40:10'!
assertSelectionIsNotEmpty
	
	(self isYourSelectionEmpty) ifTrue: [self error: self class cannotALignPaintingsWhenEmptySelectionMessageError ].! !

!Paintor methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:15:29'!
isYourSelectionEmpty
	^ selection isEmpty ! !

!Paintor methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:29:25'!
paintingsSelectedAmount
	^ selection size ! !


!Paintor methodsFor: 'initialize' stamp: 'tomas Melli 7/4/2025 19:14:52'!
initializeOnWall: aWall 
	wall := aWall.
	selection := OrderedCollection new.! !


!Paintor methodsFor: 'selection' stamp: 'tomas Melli 7/4/2025 19:11:48'!
select: aPainting 
	
	wall I: self SelectedToMyRepertoire: aPainting 	! !

!Paintor methodsFor: 'selection' stamp: 'tomas Melli 7/4/2025 19:17:16'!
youCanAddToYourRepertoire: aPainting 
	
	self assertPaintingIsNotSelectedAlready: aPainting .
	selection add: aPainting ! !


!Paintor methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:49:47'!
align: aDirection 

	(aDirection = #left) ifTrue: [self alignLeft]	 ifFalse: [
		(aDirection = #rigth) ifTrue: [self alignRight]	 ifFalse: [self error: self class alignmentDirectionIncorrectMessageError]].! !

!Paintor methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:02:27'!
alignLeft
	self assertSelectionIsNotEmpty.
	self assertSelectionHasOnePainting.
	
	wall alignLeft: selection .! !

!Paintor methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:30:52'!
alignRight
	self assertSelectionIsNotEmpty.
	self assertSelectionHasOnePainting.
	
	wall alignRight: selection .! !


!Paintor methodsFor: 'undo' stamp: 'tomas Melli 7/4/2025 21:39:09'!
unPaint: aPainting 
	
	wall undo: aPainting ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Paintor class' category: #'2025-1C-Parcial-2'!
Paintor class
	instanceVariableNames: ''!

!Paintor class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 19:37:34'!
cannotALignPaintingsWhenEmptySelectionMessageError
	^'Cannot align paintings when no painting is selected'! !

!Paintor class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 19:48:16'!
cannotAlignOneSelectedPaintingMessageError
	^'Cannot align only one painting'! !

!Paintor class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 19:21:34'!
paintingAlreadyInRepertoireMessageError
	^'Picture already in selection'! !

!Paintor class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 17:50:44'!
paintingDoesNotCoverMessageError
	
	^ 'Painting is does not cover the wall completely'! !


!Paintor class methodsFor: 'instance creation' stamp: 'tomas Melli 7/4/2025 18:29:02'!
onWall: aWall 
	^self new initializeOnWall: aWall ! !


!Paintor class methodsFor: 'as yet unclassified' stamp: 'tomas Melli 7/4/2025 20:48:46'!
alignmentDirectionIncorrectMessageError
	^'Incorrect alignment direction'! !


!classDefinition: #Wall category: #'2025-1C-Parcial-2'!
Object subclass: #Wall
	instanceVariableNames: 'frame paintings log'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Wall methodsFor: 'initialization' stamp: 'tomas Melli 7/4/2025 18:49:19'!
initializeOrigin: anOrigin extent: anExtent 

	frame := Rectangle origin: anOrigin extent: anExtent .
	paintings := OrderedCollection new.! !

!Wall methodsFor: 'initialization' stamp: 'tomas Melli 7/4/2025 21:29:45'!
initializeOrigin: anOrigin extent: anExtent andLog: aLog

	frame := Rectangle origin: anOrigin extent: anExtent .
	paintings := OrderedCollection new.
	
	log := aLog .! !


!Wall methodsFor: 'accessing' stamp: 'tomas Melli 7/4/2025 19:13:49'!
I: aPaintor SelectedToMyRepertoire: aPainting 
	
	self assertPaitingSelectedIsEndeedPainted: aPainting .
	
	aPaintor youCanAddToYourRepertoire: aPainting ! !


!Wall methodsFor: 'paint' stamp: 'tomas Melli 7/4/2025 21:35:03'!
painted: aPainting 
	
	self assertPaintingBounds: aPainting .
	
	self assertPaintingIsNotDuplicated: aPainting .
	
	paintings add: aPainting .
	
	log paintorPainted: aPainting .! !


!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 21:40:47'!
assertPaintingBelongsBeforeUndoingIt: aPainting 
	
	(paintings includes: aPainting) ifFalse: [self error: self class paintingToBeUndoneDoesNotExistInWallMessageError]! !

!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:06:49'!
assertPaintingBounds: aPainting 
	
	(aPainting topLeft x) < (frame topLeft x) ifTrue: [self error: self class paintingIsOutOfBoundsMessageError ].
	(aPainting topLeft y) < (frame topLeft y) ifTrue: [self error: self class paintingIsOutOfBoundsMessageError ].	
	(aPainting topRight x) > (frame topRight x) ifTrue: [self error: self class paintingIsOutOfBoundsMessageError ].
	(aPainting bottomLeft y) > (frame bottomLeft y) ifTrue: [self error: self class paintingIsOutOfBoundsMessageError ].	

	! !

!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 18:56:36'!
assertPaintingIsNotDuplicated: aPainting 
	
	(paintings includes: aPainting) ifTrue: [self error: self class duplicatedPaintingMessageError].! !

!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 19:13:23'!
assertPaitingSelectedIsEndeedPainted: aPainting 
	
	(paintings includes: aPainting) ifFalse: [self error: self class paintingSelectedIsNotPaintedMessageError]! !

!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 20:53:18'!
assertSelection: aSelection isLeftAlignedWith: anXPosition 
	
	^paintings allSatisfy: [:aPainting | ((aSelection includes: aPainting) ifTrue: [aPainting left = anXPosition] ifFalse: [true])].	! !

!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 21:09:10'!
assertSelection: aSelection isRigthAlignedWith: anXPosition 

	^paintings allSatisfy: [:aPainting | ((aSelection includes: aPainting) ifTrue: [aPainting right = anXPosition] ifFalse: [true])].	! !

!Wall methodsFor: 'assertion' stamp: 'tomas Melli 7/4/2025 18:49:56'!
isPainted
	^ paintings isEmpty not! !


!Wall methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:41:23'!
alignLeft: aSelectionOfPaintings 
	
	| xValue |
	xValue := self findLowestXValueIn: aSelectionOfPaintings.
	self alignLeftWithXValue: xValue of: aSelectionOfPaintings .! !

!Wall methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:43:50'!
alignLeftWithXValue: xValue of: aSelectionOfPaintings 
	
	| newDisplay |
	newDisplay := OrderedCollection new.
	
	paintings do:[:aPainting | 
		(aSelectionOfPaintings includes: aPainting) 
		ifTrue: [
			|alignedPainting|
			alignedPainting := Rectangle origin: (xValue @ (aPainting topLeft y)) extent: (aPainting extent).
			newDisplay add: alignedPainting 
		] 
		ifFalse: [newDisplay add: aPainting ]
	].

	paintings := newDisplay .! !

!Wall methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:59:29'!
alignRight: aSelectionOfPaintings 
	|xPosWidth|
	xPosWidth := 	self findGreatestXPosWidthIn: aSelectionOfPaintings .
	self alignRigthWithXValue: xPosWidth of: aSelectionOfPaintings .! !

!Wall methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 21:05:11'!
alignRigthWithXValue: xPosWidth of: aSelectionOfPaintings 
		
	| newDisplay |
	newDisplay := OrderedCollection new.
	
	paintings do:[:aPainting | 
		(aSelectionOfPaintings includes: aPainting) 
		ifTrue: [
			|alignedPainting|
			alignedPainting := Rectangle origin: (xPosWidth - aPainting width)@(aPainting topLeft y) extent: aPainting extent .
			newDisplay add: alignedPainting 
		] 
		ifFalse: [newDisplay add: aPainting ]
	].

	paintings := newDisplay .! !

!Wall methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:37:31'!
findGreatestXPosWidthIn: aSelectionOfPaintings 
	|xPosWidth|
	xPosWidth := (aSelectionOfPaintings first left) + (aSelectionOfPaintings first width ).
	aSelectionOfPaintings do:[:aPainting | (xPosWidth < ((aPainting left) +  (aPainting width))) ifTrue: [xPosWidth := ((aPainting left) +  (aPainting width))]].
	^ xPosWidth ! !

!Wall methodsFor: 'alignment' stamp: 'tomas Melli 7/4/2025 20:07:37'!
findLowestXValueIn: aSelectionOfPaintings 
	|xVal|
	xVal := aSelectionOfPaintings first left.
	aSelectionOfPaintings do:[:aPainting | ((aPainting left) < xVal) ifTrue: [xVal := aPainting left]].
	^ xVal ! !


!Wall methodsFor: 'undo' stamp: 'tomas Melli 7/4/2025 21:39:53'!
undo: aPainting 
	
	self assertPaintingBelongsBeforeUndoingIt:aPainting ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Wall class' category: #'2025-1C-Parcial-2'!
Wall class
	instanceVariableNames: ''!

!Wall class methodsFor: 'instance creation' stamp: 'tomas Melli 7/4/2025 21:29:16'!
origin: anOrigin extent: anExtent onLog: aLog
	self assertOrigin: anOrigin  andExtentArePositive: anExtent .
	^self new initializeOrigin: anOrigin extent: anExtent andLog: aLog ! !


!Wall class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 18:04:38'!
assertOrigin: anOrigin andExtentArePositive: anExtent 
	
	(anOrigin x) < 0 ifTrue: [self error: self originOutOfBoundsMessageError].
	(anOrigin y) < 0 ifTrue: [self error: self originOutOfBoundsMessageError].
	
	(anExtent x) < 0 ifTrue: [self error: self extentIsNegativeMessageError].
	(anExtent y) < 0 ifTrue: [self error: self extentIsNegativeMessageError].! !

!Wall class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 18:53:30'!
duplicatedPaintingMessageError
	^'You cannot paint because this position and extent is already painted'! !

!Wall class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 18:08:14'!
extentIsNegativeMessageError
	^'Extent is Negative'! !

!Wall class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 18:09:45'!
originOutOfBoundsMessageError
	^'Origin out of bounds'! !

!Wall class methodsFor: 'error handling' stamp: 'tomas Melli 7/4/2025 18:38:56'!
paintingIsOutOfBoundsMessageError
	^'Painting is Out of bounds'! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#[54 111 118 116 108 54 123 118 117 112 124 122 54 75 108 122 114 123 118 119 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 17 54 111 118 116 108 54 123 118 117 112 124 122 54 75 108 122 114 123 118 119 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 61 58 60 55 53 112 116 104 110 108 17 124 117 112 127 17 115 112 117 124 127 52 110 117 124 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 39 62 39 84 104 121 106 111 39 57 55 57 58 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 63 39 57 55 57 58 39 55 57 65 57 58 65 60 55 39 74 118 116 119 112 115 108 121 65 39 74 115 104 117 110 39 64 53 55 53 55 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 64 55 55 54 109 112 117 104 115 48 17 78 108 117 108 121 104 123 108 107 39 118 117 39 130 62 39 84 104 121 106 111 39 57 55 57 58 39 53 39 56 56 65 56 61 65 55 63 39 119 116 132 53 39 74 118 116 119 112 115 108 107 39 118 117 39 84 104 121 39 39 63 39 57 55 57 58 17 78 108 117 108 121 104 123 108 107 39 118 117 39 130 62 39 84 104 121 106 111 39 57 55 57 58 39 53 39 56 56 65 56 61 65 56 61 39 119 116 132 53 39 74 118 116 119 112 115 108 107 39 118 117 39 84 104 121 39 39 63 39 57 55 57 58 17 93 84 65 39 57 55 57 58 55 58 55 63 55 57 56 63 39 121 124 117 117 108 121 71 109 125 52 104 129 57 61 56 52 61 56 58 65 126 118 121 114 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 91 124 108 39 84 104 121 39 62 39 57 58 65 56 63 65 59 61 39 57 55 57 58 39 74 118 116 116 112 123 79 104 122 111 65 39 104 61 58 107 55 105 55 39 87 115 124 110 112 117 122 65 39 57 55 57 58 55 58 55 63 55 57 56 63 39 121 124 117 117 108 121 71 109 125 52 104 129 57 61 56 52 61 56 58 65 126 118 121 114 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 17 53 24 98 17 56 55 53 59 61 53 56 62 53 64 56 17 123 118 117 112 124 122 52 95 87 90 52 56 58 52 64 58 60 55 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 55 62 52 55 59 91 56 62 65 56 64 65 55 60 53 64 56 55 63 61 58 52 55 58 65 55 55 17 54 111 118 116 108 54 123 118 117 112 124 122 54 75 108 122 114 123 118 119 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 56 74 52 87 104 121 106 112 104 115 52 57 53 122 123 17 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 55 62 52 55 59 91 57 56 65 59 62 65 56 62 53 62 60 56 57 56 61 52 55 58 65 55 55 17 54 111 118 116 108 54 123 118 117 112 124 122 54 75 108 122 114 123 118 119 54 115 112 117 124 127 61 59 54 115 112 117 124 127 61 59 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 56 74 52 87 104 121 106 112 104 115 52 57 53 122 123 17 56 63 60 62 55 17 52 52 52 52 52 52 52 52 52 52 17 17])!