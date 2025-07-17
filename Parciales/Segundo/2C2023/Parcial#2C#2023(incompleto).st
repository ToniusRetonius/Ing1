!classDefinition: #TestBoard category: #'Parcial 2C 2023'!
TestCase subclass: #TestBoard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2C 2023'!

!TestBoard methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:05'!
test01_ABoardWithSmallerDimensionsRaisesError
		
	self 
		should: [(Board withRows:1withColumns:1 withPlayerPosition: self testPosition1_1)]
		raise: Error 
		withMessageText: Board cannotCreateBoardSmallerThan2x2 .! !

!TestBoard methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:15'!
test02_ABoardWithCorrectDimensionsIsCorrectlyCreatedAndEachCellHasOnlyOneElement
		
	|board|
	board := Board withRows: 2 withColumns:2 withPlayerPosition: self testPosition1_1.
	self assert: (board hasOnlyOneElementPerCell).
	! !

!TestBoard methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:35:56'!
test03_BoardWithPlayerStartingInRowGreaterThanFirstIsNotCreatedAndRaisesError
		
	|board|
	self 
		should: [board := Board withRows: 2 withColumns:2 withPlayerPosition: (2@1)] 
		raise: Error  - MessageNotUnderstood 
		withExceptionDo: [:anError |
			self assert: anError messageText equals: Board playerCannotStartInRowGreaterThan1MsgError.
			self assert: board isNil .
			 ]
	
	
	! !


!TestBoard methodsFor: 'setup' stamp: 'Tonius 7/17/2025 13:27:47'!
testPosition1_1
	^(1@1)! !


!classDefinition: #TestPlayer category: #'Parcial 2C 2023'!
TestCase subclass: #TestPlayer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2C 2023'!

!TestPlayer methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:20'!
test01_PlayerMovesRightToEmptyPositionCorrectly
	
	|board initPos finalPos |
	board := Board withRows: 2 withColumns: 2 withPlayerPosition: self testPosition1_1 .
	
	initPos := board playerPosition.
	board playerMovesRigth .
	finalPos := board playerPosition.
	
	self assert: finalPos equals: (((initPos x)+1)@(initPos y))! !

!TestPlayer methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:25'!
test02_PlayerMovesLeftToEmptyPositionCorrectly
	
	|board initPos finalPos intermPos |
	board := Board withRows: 2 withColumns: 2 withPlayerPosition: self testPosition1_1 .
	
	initPos := board playerPosition.
	board playerMovesRigth.
	intermPos := board playerPosition .
	board playerMovesLeft.
	finalPos := board playerPosition .
	
	self assert: initPos = finalPos .
	self assert: intermPos  equals: ((initPos x)+1)@(initPos y)! !

!TestPlayer methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:29'!
test03_PlayerMovesUpToEmptyPositionCorrectly
	
	|board initPos finalPos |
	board := Board withRows: 2 withColumns: 2 withPlayerPosition: self testPosition1_1 .
	
	initPos := board playerPosition.
	board playerMovesUp .
	finalPos := board playerPosition.

	self assert: finalPos equals: (initPos x)@((initPos y) + 1).! !

!TestPlayer methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:32'!
test04_PlayerMovesDownToEmptyPositionCorrectly
	
	|board initPos |
	board := Board withRows: 2 withColumns: 2 withPlayerPosition: self testPosition1_1 .
	
	initPos := board playerPosition.
	board playerMovesRigth .
	
	self deny: initPos = (board playerPosition)! !

!TestPlayer methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:26:36'!
test05_PlayerThatMovesLeftOutsideBoardStaysInSamePosition
	
	|board initPos |
	board := Board withRows: 2 withColumns: 2 withPlayerPosition: self testPosition1_1 .
	
	initPos := board playerPosition.
	board playerMovesLeft .
	
	self assert: initPos = (board playerPosition)! !

!TestPlayer methodsFor: 'tests' stamp: 'Tonius 7/17/2025 13:39:19'!
test06_LowPowerMineCausesDamageOneToPlayerThatFallsOnIt
	
	|board initPos |
	board := Board withRows: 2 withColumns: 2 withPlayerPosition: self testPosition1_1 .
	
	initPos := board playerPosition.
	board playerMovesLeft .
	! !


!TestPlayer methodsFor: 'setup' stamp: 'Tonius 7/17/2025 13:27:27'!
testPosition1_1
	^(1@1)! !


!classDefinition: #Board category: #'Parcial 2C 2023'!
Object subclass: #Board
	instanceVariableNames: 'board playerPosition dimension player'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2C 2023'!

!Board methodsFor: 'initialization' stamp: 'Tonius 7/17/2025 12:32:07'!
initializeEmpty:aNumberOfRows 
	board := Dictionary new.
	dimension := aNumberOfRows .
	1 to: aNumberOfRows do:[:numOfRows | 1 to: aNumberOfRows do:[:numOfColumns | board at:(numOfRows @ numOfColumns ) put: #empty]].! !

!Board methodsFor: 'initialization' stamp: 'Tonius 7/17/2025 12:42:24'!
initializePlayer
	player := Player on:self.
	playerPosition := (1@1).
	board at:playerPosition put: player.! !

!Board methodsFor: 'initialization' stamp: 'Tonius 7/17/2025 12:39:41'!
initializeWithRows: aNumberOfRows withColumns: aNumberOfColumns 
	
	self initializeEmpty:aNumberOfRows.
	self initializePlayer.! !


!Board methodsFor: 'assertion' stamp: 'Tonius 7/17/2025 12:32:20'!
hasOnlyOneElementPerCell
	
	1 to: dimension do:[:numOfRows | 1 to: dimension do:[: numOfColumns | board at:(numOfRows @ numOfColumns ) ifAbsent:[^false]]].
	^ true.! !


!Board methodsFor: 'accessing' stamp: 'Tonius 7/17/2025 12:21:39'!
playerPosition
	^ playerPosition! !


!Board methodsFor: 'player movement' stamp: 'Tonius 7/17/2025 13:15:05'!
movesTo: aFuturePosition 
	
	board at:aFuturePosition
		ifPresent: [:aPosition| 
			playerPosition := aFuturePosition .
			board at: playerPosition put: player 
		]
		ifAbsent:[playerPosition := playerPosition] .
		! !

!Board methodsFor: 'player movement' stamp: 'Tonius 7/17/2025 12:56:35'!
playerMovesLeft
	
	self movesTo: (((playerPosition x) -1)@ (playerPosition y)) .
	! !

!Board methodsFor: 'player movement' stamp: 'Tonius 7/17/2025 12:59:02'!
playerMovesRigth
	 
	self movesTo: (((playerPosition x) +1)@ (playerPosition y)).! !

!Board methodsFor: 'player movement' stamp: 'Tonius 7/17/2025 13:11:31'!
playerMovesUp
	self movesTo: (playerPosition x) @ ((playerPosition y) + 1).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Board class' category: #'Parcial 2C 2023'!
Board class
	instanceVariableNames: ''!

!Board class methodsFor: 'error handling' stamp: 'Tonius 7/17/2025 11:45:01'!
cannotCreateBoardSmallerThan2x2
	^'Cannot create Board smaller than 2x2'! !

!Board class methodsFor: 'error handling' stamp: 'Tonius 7/17/2025 12:48:47'!
movementOutsideOfBoundariesMessageError
	^'Cannot move into cell outside of board'! !

!Board class methodsFor: 'error handling' stamp: 'Tonius 7/17/2025 13:35:05'!
playerCannotStartInRowGreaterThan1MsgError
	^'Player has to start in first row'! !


!Board class methodsFor: 'instance creation' stamp: 'Tonius 7/17/2025 13:34:37'!
withRows: aNumberOfRows withColumns: aNumberOfColumns withPlayerPosition: aPlayerPosition  
	
	self assertDimensionsWithRow: aNumberOfRows andColumns: aNumberOfColumns.
	
	self assertValidPlayerPosition: aPlayerPosition .
	
	^self new initializeWithRows: aNumberOfRows withColumns: aNumberOfColumns 
	! !


!Board class methodsFor: 'assertion' stamp: 'Tonius 7/17/2025 11:52:25'!
assertDimensionsWithRow: aNumberOfRows andColumns: aNumberOfColumns 
	
	((aNumberOfRows > 1) and:(aNumberOfColumns > 1) and: (aNumberOfRows = aNumberOfColumns)) ifFalse: [self error: self cannotCreateBoardSmallerThan2x2 ].
	! !

!Board class methodsFor: 'assertion' stamp: 'Tonius 7/17/2025 13:36:42'!
assertValidPlayerPosition: aPlayerPosition 
	
	(aPlayerPosition x > 1) ifTrue: [self error: self playerCannotStartInRowGreaterThan1MsgError].! !


!classDefinition: #Player category: #'Parcial 2C 2023'!
Object subclass: #Player
	instanceVariableNames: 'board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial 2C 2023'!

!Player methodsFor: 'initialization' stamp: 'Tonius 7/17/2025 12:20:26'!
initializeOn: aBoard 
	board := aBoard.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Player class' category: #'Parcial 2C 2023'!
Player class
	instanceVariableNames: ''!

!Player class methodsFor: 'instance creation' stamp: 'Tonius 7/17/2025 12:20:13'!
on: aBoard 
	
	^self new initializeOn: aBoard ! !
