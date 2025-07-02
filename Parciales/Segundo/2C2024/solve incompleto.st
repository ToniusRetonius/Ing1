!classDefinition: #PacmanGameTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 19:55:49'!
test01PacmanStartsMovingLeft
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 19:59:40'!
test02PacmanStartsMovingLeftFindsSmallPillGainsAPoint
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	self assert: game points equals: 1.
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 19:59:50'!
test03PacmanStartsMovingLeftFindsBigPillGainsTwoPoints
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-BC-#'
	'#*p--#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	self assert: game points equals: 2.
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#-BC-#'
	'#p=--#'
	'######').
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 19:59:57'!
test04PacmanStartsMovingLeftFindsWallStaysPut
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-BC-#'
	'#p---#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#-BC-#'
	'#p---#'
	'######').
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 20:17:54'!
test05PacmanStartsMovingLeftThenMovesRigth
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	game changeRight.
	game tick.
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#-BC-#'
	'#=p--#'
	'######').
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 20:22:33'!
test06PacmanStartsMovingLeftThenMovesUp
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-BC-#'
	'#-p--#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	game changeUp.
	game tick.
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#pBC-#'
	'#==--#'
	'######').
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 't 7/1/2025 20:24:17'!
test07PacmanStartsMovingLeftThenMovesDown
	|board game |
	
	board := StringPacmanBoard representedAs: #(
	'######'
	'#-p--#'
	'#-BC-#'
	'######').
	
	game := PacmanGame on: board.
	game tick.
	game changeDown.
	game tick.
	self assert: game stringRepresentationOfBoard equals: #(
	'######'
	'#==--#'
	'#pBC-#'
	'######').
	! !


!classDefinition: #StringPacmanBoardTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #StringPacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:48:10'!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 14:32:55'!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pBBC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:33'!
test05CannotCreateABoardWithoutClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pB') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:40'!
test06CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pBCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:50:49'!
test07AllRowsHaveSameSize

	self 
		should: [ StringPacmanBoard representedAs: #('pBC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: StringPacmanBoard rowsMustHaveSameSizeErrorDescription! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:00'!
test08VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := StringPacmanBoard representedAs: #('pBC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #clyde) equals: 3@1.
	self assert: (visitedElements at: #wall) equals: 4@1.
	self assert: (visitedElements at: #smallPill) equals: 5@1.
	self assert: (visitedElements at: #bigPill) equals: 6@1.
	self assert: (visitedElements at: #space) equals: 7@1.
	self assert: visitedElements size equals: 7
	
	
	! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 10:51:11'!
test09InvalidCharactersAreNotAllowed

	self 
		should: [ StringPacmanBoard representedAs: #('pBCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/22/2024 16:42:59'!
test10BoardTranslationExample
"
	HACER PASAR ESTE TEST ANTES DE COMENZAR: falla porque en la posicion del pacman (p) pone un string en vez de #pacman
"
	| board translator |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').

	translator := BoardTranslatorExample on: board.
	
	self assert: translator stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#-p=-#'
'######').
! !


!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:25'!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:27'!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:56'!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:10'!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:14'!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:17:12'!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:05'!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !


!classDefinition: #BoardTranslatorExample category: #'2024-2C-Parcial-2'!
Object subclass: #BoardTranslatorExample
	instanceVariableNames: 'board boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:38:51'!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 11/22/2024 14:45:23'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'LL 11/22/2024 10:44:29'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:42:38'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:40:34'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:04'!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 't 7/1/2025 17:29:07'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:22'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:30'!
visitSpaceAt: aPosition

	board at: aPosition put: #space
	
	! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 11/22/2024 11:43:35'!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!BoardTranslatorExample methodsFor: 'initialization' stamp: 'HAW 11/22/2024 14:43:18'!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardTranslatorExample class' category: #'2024-2C-Parcial-2'!
BoardTranslatorExample class
	instanceVariableNames: ''!

!BoardTranslatorExample class methodsFor: 'as yet unclassified' stamp: 'LL 11/22/2024 10:37:38'!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #PacmanGame category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGame
	instanceVariableNames: 'board boardExtent points lives heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGame methodsFor: 'string representation' stamp: 't 7/1/2025 18:50:15'!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!PacmanGame methodsFor: 'string representation' stamp: 't 7/1/2025 18:50:15'!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!PacmanGame methodsFor: 'string representation' stamp: 't 7/1/2025 18:50:15'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitSpaceAt: aPosition

	board at: aPosition put: #space
	
	! !

!PacmanGame methodsFor: 'string board visiting' stamp: 't 7/1/2025 18:50:15'!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!PacmanGame methodsFor: 'movement' stamp: 't 7/1/2025 20:06:06'!
assertNextPositionIsValid: nextPosition 
	
	((board at: nextPosition) = #wall) ifTrue: [^false] ifFalse: [^true ].! !

!PacmanGame methodsFor: 'movement' stamp: 't 7/1/2025 20:26:43'!
assertPointsGainedIn: nextPosition 
	
	((board at: nextPosition) = #smallPill) ifTrue: [ points := points +1].
	((board at: nextPosition) = #bigPill) ifTrue: [ points := points + 2].
	
	"(board at: nextPosition = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(board at: nextPosition = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(board at: nextPosition = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(board at: nextPosition = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ]."
! !

!PacmanGame methodsFor: 'movement' stamp: 't 7/1/2025 19:02:55'!
findPacman
	
	|pacman| 
	
	1 to: boardExtent y do: [ :y | 
		1 to: boardExtent x do:[:x |
		((self characterRepresentationOf: (board at: x@y)) =  StringPacmanBoard pacmanCharacter) ifTrue: [^pacman := x@y]].
	].
	
	
 ! !

!PacmanGame methodsFor: 'movement' stamp: 't 7/1/2025 20:29:10'!
movePacman: pacmanPosition to: nextPosition 
	
	self assertPointsGainedIn:nextPosition .
	
	"ponemos el = (espacio)"
	self visitSpaceAt: pacmanPosition .
		
		"movemos el pacman"
	self visitPacmanAt: nextPosition.! !

!PacmanGame methodsFor: 'movement' stamp: 't 7/1/2025 20:30:51'!
tick
	
	(self assertNextPositionIsValid: (heading nextPosition: self findPacman on: self)) ifTrue: [		 self movePacman: (self findPacman) to: (heading nextPosition: self findPacman on: self) ].
	
	
	! !


!PacmanGame methodsFor: 'initialization' stamp: 't 7/1/2025 20:09:25'!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self.
	
	lives := 3.
	points := 0.
	
	heading := PacmanHeading left.! !


!PacmanGame methodsFor: 'accessing' stamp: 't 7/1/2025 19:37:09'!
points
	^points! !


!PacmanGame methodsFor: 'heading' stamp: 't 7/1/2025 20:24:37'!
changeDown
	heading := PacmanHeading down.! !

!PacmanGame methodsFor: 'heading' stamp: 't 7/1/2025 20:16:44'!
changeRight
	heading := PacmanHeading rigth.! !

!PacmanGame methodsFor: 'heading' stamp: 't 7/1/2025 20:20:56'!
changeUp
	heading := PacmanHeading up.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanGame class' category: #'2024-2C-Parcial-2'!
PacmanGame class
	instanceVariableNames: ''!

!PacmanGame class methodsFor: 'as yet unclassified' stamp: 't 7/1/2025 18:50:15'!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #PacmanHeading category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanHeading class' category: #'2024-2C-Parcial-2'!
PacmanHeading class
	instanceVariableNames: ''!

!PacmanHeading class methodsFor: 'instance creation' stamp: 't 7/1/2025 20:24:52'!
down
	
	^PacmanHeadingDown new.! !

!PacmanHeading class methodsFor: 'instance creation' stamp: 't 7/1/2025 20:10:08'!
left
	
	^PacmanHeadingLeft new ! !

!PacmanHeading class methodsFor: 'instance creation' stamp: 't 7/1/2025 20:17:11'!
rigth
	
	^PacmanHeadingRight new.! !

!PacmanHeading class methodsFor: 'instance creation' stamp: 't 7/1/2025 20:21:22'!
up
	^PacmanHeadingUp new.! !


!classDefinition: #PacmanHeadingDown category: #'2024-2C-Parcial-2'!
PacmanHeading subclass: #PacmanHeadingDown
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanHeadingDown methodsFor: 'as yet unclassified' stamp: 't 7/1/2025 20:25:20'!
nextPosition: pacmanPosition on: aPacmanGame 
	^(pacmanPosition x)@((pacmanPosition y)+1)! !


!classDefinition: #PacmanHeadingLeft category: #'2024-2C-Parcial-2'!
PacmanHeading subclass: #PacmanHeadingLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanHeadingLeft methodsFor: 'as yet unclassified' stamp: 't 7/1/2025 20:12:06'!
nextPosition: pacmanPosition on: aPacmanGame 
	^((pacmanPosition x) - 1)@(pacmanPosition y)! !


!classDefinition: #PacmanHeadingRight category: #'2024-2C-Parcial-2'!
PacmanHeading subclass: #PacmanHeadingRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanHeadingRight methodsFor: 'as yet unclassified' stamp: 't 7/1/2025 20:18:41'!
nextPosition: pacmanPosition on: aPacmanGame 
	^((pacmanPosition x) + 1)@(pacmanPosition y)! !


!classDefinition: #PacmanHeadingUp category: #'2024-2C-Parcial-2'!
PacmanHeading subclass: #PacmanHeadingUp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanHeadingUp methodsFor: 'as yet unclassified' stamp: 't 7/1/2025 20:22:12'!
nextPosition: pacmanPosition on: aPacmanGame 
	^(pacmanPosition x)@((pacmanPosition y) - 1)! !


!classDefinition: #StringPacmanBoard category: #'2024-2C-Parcial-2'!
Object subclass: #StringPacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoard methodsFor: 'initialization' stamp: 'HAW 11/18/2024 19:29:26'!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:23:48'!
bigPillCharacter

	^self class bigPillCharacter! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:20'!
blinkyCharacter

	^ self class blinkyCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:30'!
clydeCharacter

	^ self class clydeCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:52'!
pacmanCharacter

	^ self class pacmanCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:15'!
smallPillCharacter

	^self class smallPillCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:37'!
spaceCharacter

	^self class spaceCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:26:00'!
wallCharacter

	^self class wallCharacter! !


!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:21'!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:36'!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:09'!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:17'!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:12'!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:29'!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:03'!
isWall: anElement

	^ anElement = self wallCharacter! !


!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/22/2024 14:38:19'!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:22:41'!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!StringPacmanBoard methodsFor: 'extent' stamp: 'HAW 11/22/2024 10:50:10'!
extent
	
	"There is always a row and their size is the same to all - Hernan"
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPacmanBoard class' category: #'2024-2C-Parcial-2'!
StringPacmanBoard class
	instanceVariableNames: ''!

!StringPacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 11/22/2024 10:48:32'!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the there is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:30'!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:39:12'!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:07:31'!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:01'!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/21/2024 20:17:42'!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self blinkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:24:06'!
bigPillCharacter
	
	^ $*! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:25'!
blinkyCharacter
	
	^$B! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:42'!
clydeCharacter
	
	^$C! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:41:25'!
pacmanCharacter
	
	^$p! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:24'!
smallPillCharacter
	
	^ $-! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:46'!
spaceCharacter
	
	^ $=! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:26:06'!
wallCharacter
	
	^ $#! !


!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:12'!
blinkyName

	^ #blinky! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:29'!
clydeName

	^ #clyde! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:05'!
pacmanName

	^ #pacman! !


!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/21/2024 19:59:27'!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:04'!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:16'!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:30'!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !
