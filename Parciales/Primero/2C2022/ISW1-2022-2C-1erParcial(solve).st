!classDefinition: #CrewTest category: #'ISW1-2022-2C-1erParcial'!
TestCase subclass: #CrewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:14:44'!
test01MovingCrewToTreePlaceDoesNotMove

	self assertMovingCrewToTreePlaceWithDigPosition: 3@3 
	Does:[:crew :treePosition : island :crewPosition | 
			crew moveTo: treePosition. 
			self deny: (island hasCrewAt: treePosition).
			self assert: (island hasCrewAt: crewPosition).].
	! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:14:38'!
test02MovingCrewToTreePlaceFilibusteroRemovesTree

	self assertMovingCrewToTreePlaceWithDigPosition: 3@3 
	Does:[:crew :treePosition : island :crewPosition | 
			self deny: (island isEmptyAt: treePosition).
			crew moveTo: treePosition.

			self assert: (island isEmptyAt: treePosition).
			
			self deny: (island hasCrewAt: treePosition).
			self assert: (island hasCrewAt: crewPosition).
		].! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:21:28'!
test03MovingCrewToFreePlace


	self assertMovingCrewToTreePlaceWithDigPosition: 3@3 
		Does:[:crew :treePosition : island :crewPosition | 
				|nextPosition|
				nextPosition := 2@1.
				self assert: (island isEmptyAt: nextPosition).
				
				crew moveTo: nextPosition.

				self deny: (island hasCrewAt: crewPosition).
				self assert: (island hasCrewAt: nextPosition).
			].! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:35:48'!
test04MovingCrewToFreePlaceCorsarioWritesDirectionInMap

	
	self assertMovingCrewToFreePlaceCorsarioWritesDirectionInMapAtDigPosition: 3@3 
	does:[:map :crew |
		|nextPosition|
		nextPosition := 2@1.
		self assert: map isEmpty.

		crew moveTo: nextPosition.

		self assert: map stepsSize equals: 1. 
		self assert: map lastPosition equals: nextPosition.
	]! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:18:09'!
test05CrewCannotBuryTreasureIfBucaneroCannotDig

	
	self assertTreasureDigPositionAt: 2@2 does:[:crew :map |
		crew moveTo: 2@1.
	
		self 
			should: [ crew buryTreasureAt: 3@1 ] 
			raise: Error - MessageNotUnderstood 
			withExceptionDo: [ :error | 
				self assert: error messageText equals: Bucanero cannotDigErrorDescription.
				self deny: map hasTreasureMark ]
		]
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:20:41'!
test06CrewCanBuryTreasureIfBucaneroCanDig
	
	self assertTreasureDigPositionAt: 2@2 does:[:crew :map |
		crew moveTo: 2@1.
		crew buryTreasureAt: 2@2.
		self assert: map hasTreasureMark.
	].
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:26:10'!
test07CaptainCanUseMap
	
	self assertDifferentRankPirateUseMapAtDigPosition: 2@2 does:[:crew :map :island |
		|pirate|
		crew moveTo: 2@1.
		crew buryTreasureAt: 2@2.

		pirate := Bucanero new.
		pirate aCaptainIWasMeantToBe.
		
		self assert: (pirate searchTreasureIn: island with: map)
	]! !

!CrewTest methodsFor: 'tests' stamp: 't 5/2/2025 00:26:58'!
test08SimplePirateCannotUseMap

	self assertDifferentRankPirateUseMapAtDigPosition: 2@2 does:[:crew :map :island |
		|pirate|
		crew moveTo: 2@1.
		crew buryTreasureAt: 2@2.

		pirate := Bucanero new.
		
		self 
			should: [ pirate searchTreasureIn: island with: map ] 
			raise: Error - MessageNotUnderstood 
			withMessageText: 'I am a simple pirate!!'.
	]! !


!CrewTest methodsFor: 'setup' stamp: 't 5/1/2025 23:36:49'!
setupIslandWithDigPositionAt: aDigPosition
	| island crew crewPosition treePosition map digPosition|
	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := aDigPosition .
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition ).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.
			
	^{island. map. crew. crewPosition. treePosition }! !


!CrewTest methodsFor: 'assertions' stamp: 't 5/2/2025 00:25:55'!
assertDifferentRankPirateUseMapAtDigPosition: digPosition does: aBlock 
	
	| setup |
	setup := self setupIslandWithDigPositionAt: digPosition .
	aBlock value: setup third value: setup first value: setup second.! !

!CrewTest methodsFor: 'assertions' stamp: 't 5/2/2025 00:37:42'!
assertMovingCrewToFreePlaceCorsarioWritesDirectionInMapAtDigPosition: digPosition does: aBlock
	
	| setup |
	setup := self setupIslandWithDigPositionAt: digPosition .
	
	aBlock value: setup second value: setup third
	
	! !

!CrewTest methodsFor: 'assertions' stamp: 't 5/2/2025 00:14:30'!
assertMovingCrewToTreePlaceWithDigPosition: digPosition Does: aBlock 
	| setup |
	
	setup := self setupIslandWithDigPositionAt: digPosition .
	aBlock value: setup third value: setup fifth value: setup first value: setup fourth ! !

!CrewTest methodsFor: 'assertions' stamp: 't 5/2/2025 00:32:24'!
assertTreasureDigPositionAt: digPosition does: aBlock
	
	| setup |
	setup := self setupIslandWithDigPositionAt: digPosition .
	aBlock value: setup third value: setup second
	
	
	! !


!classDefinition: #Crew category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Crew
	instanceVariableNames: 'island pirates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Crew methodsFor: 'treasure' stamp: 't 5/1/2025 22:33:46'!
buryTreasureAt: aPosition

	| terrain |
	
	terrain := island terrainAt: aPosition.

	pirates do: [: pirate | pirate buryTreasureAt: aPosition inTerrain: terrain atIsland: island .	].
	! !


!Crew methodsFor: 'initialize' stamp: 'FRT 9/17/2022 22:53:00'!
initializeWith: anIsland pirates: aPirates at: aPosition

	island := anIsland.
	pirates := aPirates.
	
	island crewAt: aPosition.! !


!Crew methodsFor: 'pirates movement' stamp: 't 5/1/2025 22:17:05'!
moveTo: aPosition

	| terrain |
	
	terrain := island terrainAt: aPosition.
	
	"allCanMove :=pirates allSatisfy: [:pirate | pirate moveTo: aPosition in: terrain at: island. ]."
	"la solución anterior pasa el primer test, pero se rompe porque el allSatisfy frena apenas recibe un false y el filibustero no saca el árbol "
	
	"como consecuencia, evaluamos todos los piratas y buscamos acumular : con inject: into: no olvidar que el primer parámetro es el accumulator "
	(pirates inject: true into:[:bool :pirate | pirate moveTo: aPosition in: terrain at: island. ]) ifTrue: [ island crewAt: aPosition ].
	
	"nos movemos si todos pueden moverse"
	 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Crew class' category: #'ISW1-2022-2C-1erParcial'!
Crew class
	instanceVariableNames: ''!

!Crew class methodsFor: 'as yet unclassified' stamp: 'HAW 9/18/2022 19:21:29'!
at: anIsland composedBy: aCrew at: aPosition

	^ self new initializeWith: anIsland pirates: aCrew at: aPosition ! !


!classDefinition: #Island category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Island
	instanceVariableNames: 'boardSize treesAt digsAt crewAt treasureAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Island methodsFor: 'initialization' stamp: 'FRT 9/17/2022 15:23:00'!
initializeSized: size treesAt: treesPositions digsAt: digsPositions

	boardSize := size.
	treesAt := treesPositions.
	digsAt := digsPositions.
! !


!Island methodsFor: 'pirate movement' stamp: 'FRT 9/17/2022 15:37:10'!
crewAt: aPosition

	crewAt := aPosition.! !

!Island methodsFor: 'pirate movement' stamp: 'FRT 9/17/2022 15:45:56'!
hasCrewAt: aPosition

	^ crewAt = aPosition.! !


!Island methodsFor: 'treasure' stamp: 'FRT 9/17/2022 15:27:44'!
receiveTreasureAt: aPosition

	treasureAt := aPosition.! !


!Island methodsFor: 'terrain' stamp: 't 5/1/2025 21:59:06'!
clearTerrainAt: aPosition

	treesAt do: [ : pos | (aPosition = pos) ifTrue: [ ^ treesAt remove: pos]. ].
	
! !

!Island methodsFor: 'terrain' stamp: 't 5/1/2025 22:06:15'!
isEmptyAt: aPosition
	
	"buscamos la posición, si está, devolvemos el valor de verdad opuesto (anySatify retorna true apenas lo encuentra)"
	^(treesAt anySatisfy: [:pos | pos = aPosition ]) not! !

!Island methodsFor: 'terrain' stamp: 't 5/1/2025 22:18:55'!
terrainAt: aPosition

	"la idea siempre es clavarle el do: para despejar un poco el ruido "
	treesAt do:[:pos | (aPosition = pos) ifTrue: [ ^ Terrain createTree].		].

	digsAt do:[: pos | 		(aPosition = pos) ifTrue: [ ^ Terrain createDiggableTerrain].	].

	^ Terrain createEmptyTerrain.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Island class' category: #'ISW1-2022-2C-1erParcial'!
Island class
	instanceVariableNames: ''!

!Island class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:46:50'!
sized: size treesAt: treesPositions digsAt: digsPositions

	^ self new initializeSized: size treesAt: treesPositions digsAt: digsPositions 
! !


!classDefinition: #Map category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Map
	instanceVariableNames: 'island startPosition steps treasureMarkPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Map methodsFor: 'treasure' stamp: 'FRT 9/17/2022 19:00:56'!
hasTreasureMark

	^ treasureMarkPosition isNil not.
	
	! !

!Map methodsFor: 'treasure' stamp: 'FRT 9/17/2022 19:01:06'!
treasureMarkAt: aPosition

	treasureMarkPosition := aPosition.
	
	! !


!Map methodsFor: 'initialization' stamp: 'FRT 9/17/2022 16:30:31'!
initializeWith: anIsland crewStartsAt: aPosition

	island := anIsland.
	startPosition := aPosition.
	steps := OrderedCollection new.
	
	! !


!Map methodsFor: 'position' stamp: 'FRT 9/17/2022 16:43:52'!
isEmpty

	^ steps isEmpty
	
	! !

!Map methodsFor: 'position' stamp: 't 5/1/2025 21:56:11'!
lastPosition
	
	^ steps inject: startPosition into:[:start :step | start + step].
	
	! !

!Map methodsFor: 'position' stamp: 'FRT 9/17/2022 16:39:01'!
nextStep: step

	^ steps add: step.
	
	! !

!Map methodsFor: 'position' stamp: 'FRT 9/17/2022 16:33:43'!
startPosition

	^ startPosition
	
	! !

!Map methodsFor: 'position' stamp: 'FRT 9/17/2022 16:32:59'!
step: ix

	^ steps at: ix.
	
	! !

!Map methodsFor: 'position' stamp: 'FRT 9/17/2022 16:32:23'!
stepsSize

	^ steps size.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Map class' category: #'ISW1-2022-2C-1erParcial'!
Map class
	instanceVariableNames: ''!

!Map class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:28:38'!
of: island crewStartsAt: aPosition.

	^ self new initializeWith: island crewStartsAt: aPosition.! !


!classDefinition: #Pirate category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Pirate
	instanceVariableNames: 'rank'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Pirate methodsFor: 'rank' stamp: 't 5/1/2025 23:09:11'!
aCaptainIWasMeantToBe

	rank := Rank captainOf: self! !


!Pirate methodsFor: 'treasure' stamp: 't 5/1/2025 23:14:15'!
searchTreasureIn: island with: aMap
	
	^rank canISearchTreasure: self
	! !


!classDefinition: #Bucanero category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Bucanero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Bucanero methodsFor: 'movement' stamp: 't 5/1/2025 22:24:43'!
moveTo: aPosition in: terrain at: island 
		
		^terrain canIBucaneroMoveTo: aPosition inTerrain: terrain atIsland: island 
		! !


!Bucanero methodsFor: 'treasure' stamp: 't 5/1/2025 23:12:40'!
buryTreasureAt: aPosition inTerrain: terrain atIsland: island
	
	terrain canIBucanero: self BuryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	! !

!Bucanero methodsFor: 'treasure' stamp: 't 5/1/2025 22:38:47'!
youCanReceiveTreasureAt: aPosition inIsland: island 
	 
	island receiveTreasureAt: aPosition! !

!Bucanero methodsFor: 'treasure' stamp: 't 5/1/2025 23:14:03'!
youCanSearchTreasure
	^ true! !

!Bucanero methodsFor: 'treasure' stamp: 't 5/1/2025 22:35:47'!
youCannotBuryTreasure
	self error: 'Arrgh!! I cannot dig this type of terrain!!'! !

!Bucanero methodsFor: 'treasure' stamp: 't 5/1/2025 23:15:35'!
youCannotYouAreJustASimplePirate
	^self error: 'I am a simple pirate!!'! !


!Bucanero methodsFor: 'initialization' stamp: 't 5/1/2025 23:04:57'!
initialize

	rank := Rank simpleRankPirateOf: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bucanero class' category: #'ISW1-2022-2C-1erParcial'!
Bucanero class
	instanceVariableNames: ''!

!Bucanero class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 17:12:39'!
cannotDigErrorDescription

	^ 'Arrgh!! I cannot dig this type of terrain!!'.! !


!classDefinition: #Corsario category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Corsario
	instanceVariableNames: 'map'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Corsario methodsFor: 'movement' stamp: 'FRT 9/17/2022 22:43:57'!
drawDirectionTo: aPosition

	map nextStep: aPosition - (map lastPosition).
	
! !

!Corsario methodsFor: 'movement' stamp: 't 5/1/2025 22:28:58'!
moveTo: aPosition in: terrain at: anIsland  
		
		^terrain canICorsario: self moveTo: aPosition inTerrain: terrain atIsland: anIsland ! !

!Corsario methodsFor: 'movement' stamp: 't 5/1/2025 22:31:08'!
youCanMoveCorsarioButFirstDrawDirectionTo: aPosition 
	
	self drawDirectionTo: aPosition.
	^ true! !


!Corsario methodsFor: 'treasure' stamp: 't 5/1/2025 22:43:48'!
buryTreasureAt: aPosition inTerrain: terrain atIsland: island 
		
		terrain canICorsario: self BuryTreasureIn: aPosition inTerrain: terrain atIsland: island
		! !

!Corsario methodsFor: 'treasure' stamp: 'FRT 9/17/2022 19:01:22'!
drawTreasureMarkAt: aPosition

	map nextStep: aPosition - map lastPosition.
	map treasureMarkAt: aPosition.
	
! !

!Corsario methodsFor: 'treasure' stamp: 't 5/1/2025 22:43:39'!
youHaveToDrawTreasureMarkAt: aPosition 
	self drawTreasureMarkAt: aPosition! !


!Corsario methodsFor: 'initialization' stamp: 't 5/1/2025 23:06:46'!
initialize

	rank := Rank noRankOf: self! !

!Corsario methodsFor: 'initialization' stamp: 't 5/1/2025 23:08:14'!
initializeWith: aMap

	rank := Rank simpleRankPirateOf: self.
	map := aMap! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Corsario class' category: #'ISW1-2022-2C-1erParcial'!
Corsario class
	instanceVariableNames: ''!

!Corsario class methodsFor: 'as yet unclassified' stamp: 'FRT 9/15/2022 21:46:08'!
with: aMap

	^ self new initializeWith: aMap.! !


!classDefinition: #Filibustero category: #'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Filibustero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Filibustero methodsFor: 'treasure' stamp: 't 5/1/2025 22:47:07'!
buryTreasureAt: aPosition inTerrain: terrain atIsland: island 
	
		terrain canIFilibustero: self buryTreasureIn: aPosition inTerrain: terrain atIsland: island 
		! !


!Filibustero methodsFor: 'movement' stamp: 't 5/1/2025 22:23:38'!
moveTo: aPosition in: terrain at: island
		
		^terrain canIFilibustero: self moveTo: aPosition inTerrain: terrain atIsland: island 		! !

!Filibustero methodsFor: 'movement' stamp: 't 5/1/2025 22:22:11'!
youCannotMoveToTreeTerrainButYouClear: aPosition at: island 
	island clearTerrainAt: aPosition. 
	^ false! !


!Filibustero methodsFor: 'initialization' stamp: 't 5/1/2025 23:08:32'!
initialize

	rank := Rank simpleRankPirateOf: self! !


!classDefinition: #Rank category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Rank
	instanceVariableNames: 'pirate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rank class' category: #'ISW1-2022-2C-1erParcial'!
Rank class
	instanceVariableNames: ''!

!Rank class methodsFor: 'instance creation' stamp: 't 5/1/2025 23:09:39'!
captainOf: aCaptain 
	
	^Captain new initializeCaptainOf: aCaptain ! !

!Rank class methodsFor: 'instance creation' stamp: 't 5/1/2025 23:07:10'!
noRankOf: aCorsario 
	
	^NoRank new initializeNoRankOf: aCorsario ! !

!Rank class methodsFor: 'instance creation' stamp: 't 5/1/2025 23:05:47'!
simpleRankPirateOf: aPirate 
	
	^SimplePirate new initializeWith: aPirate ! !


!classDefinition: #Captain category: #'ISW1-2022-2C-1erParcial'!
Rank subclass: #Captain
	instanceVariableNames: 'captain'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Captain methodsFor: 'initialization' stamp: 't 5/1/2025 23:11:11'!
canISearchTreasure
	^true! !

!Captain methodsFor: 'initialization' stamp: 't 5/1/2025 23:14:07'!
canISearchTreasure: aPirate 
	^aPirate youCanSearchTreasure! !

!Captain methodsFor: 'initialization' stamp: 't 5/1/2025 23:09:58'!
initializeCaptainOf: aPirate 
	
	pirate := aPirate.! !


!classDefinition: #NoRank category: #'ISW1-2022-2C-1erParcial'!
Rank subclass: #NoRank
	instanceVariableNames: 'corsario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!NoRank methodsFor: 'initialization' stamp: 't 5/1/2025 23:07:32'!
initializeNoRankOf: aPirate 
	
	pirate := aPirate.! !


!classDefinition: #SimplePirate category: #'ISW1-2022-2C-1erParcial'!
Rank subclass: #SimplePirate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!SimplePirate methodsFor: 'initialization' stamp: 't 5/1/2025 23:05:56'!
initializeWith: aPirate 
	pirate := aPirate.! !


!SimplePirate methodsFor: 'treasure' stamp: 't 5/1/2025 23:15:02'!
canISearchTreasure: aPirate 
	aPirate youCannotYouAreJustASimplePirate	! !


!classDefinition: #Terrain category: #'ISW1-2022-2C-1erParcial'!
Object subclass: #Terrain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Terrain class' category: #'ISW1-2022-2C-1erParcial'!
Terrain class
	instanceVariableNames: ''!

!Terrain class methodsFor: 'instance creation' stamp: 't 5/1/2025 22:36:22'!
createDiggableTerrain
	
	^Diggable new ! !

!Terrain class methodsFor: 'instance creation' stamp: 't 5/1/2025 22:25:43'!
createEmptyTerrain
	
	^Empty new ! !

!Terrain class methodsFor: 'instance creation' stamp: 't 5/1/2025 22:19:19'!
createTree
	
	^Tree new ! !


!classDefinition: #Diggable category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Diggable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Diggable methodsFor: 'treasure' stamp: 't 5/1/2025 22:38:22'!
canIBucanero: aBucanero BuryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	
	aBucanero youCanReceiveTreasureAt: aPosition inIsland: island ! !

!Diggable methodsFor: 'treasure' stamp: 't 5/1/2025 22:43:24'!
canICorsario: aCorsario BuryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	
	aCorsario youHaveToDrawTreasureMarkAt: aPosition ! !

!Diggable methodsFor: 'treasure' stamp: 't 5/1/2025 22:47:34'!
canIFilibustero: aFilibustero buryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	! !


!classDefinition: #Empty category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Empty methodsFor: 'pirate movement' stamp: 't 5/1/2025 22:26:50'!
canIBucaneroMoveTo: aPosition inTerrain: terrain atIsland: island 
	^ true! !

!Empty methodsFor: 'pirate movement' stamp: 't 5/1/2025 22:30:43'!
canICorsario: aCorsario moveTo: aPosition inTerrain: terrain atIsland: anIsland 
	
	^aCorsario youCanMoveCorsarioButFirstDrawDirectionTo: aPosition ! !

!Empty methodsFor: 'pirate movement' stamp: 't 5/1/2025 22:26:17'!
canIFilibustero: aFilibustero moveTo: aPosition inTerrain: terrain atIsland: island 
	^ true ! !


!Empty methodsFor: 'treasure' stamp: 't 5/1/2025 22:35:28'!
canIBucanero: aBucanero BuryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	aBucanero youCannotBuryTreasure! !

!Empty methodsFor: 'treasure' stamp: 't 5/1/2025 22:42:15'!
canICorsario: aCorsario BuryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	! !

!Empty methodsFor: 'treasure' stamp: 't 5/1/2025 22:47:24'!
canIFilibustero: aFilibustero buryTreasureIn: aPosition inTerrain: terrain atIsland: island 
	! !


!classDefinition: #Tree category: #'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Tree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Tree methodsFor: 'pirate movement' stamp: 't 5/1/2025 22:25:14'!
canIBucaneroMoveTo: aPosition inTerrain: terrain atIsland: island 
	 ^ false ! !

!Tree methodsFor: 'pirate movement' stamp: 't 5/1/2025 22:29:26'!
canICorsario: aCorsario moveTo: aPosition inTerrain: terrain atIsland: anIsland 
	^ false! !

!Tree methodsFor: 'pirate movement' stamp: 't 5/1/2025 22:23:27'!
canIFilibustero: aFilibustero moveTo: aPosition inTerrain: terrain atIsland: island 
	^aFilibustero youCannotMoveToTreeTerrainButYouClear: aPosition at: island ! !
