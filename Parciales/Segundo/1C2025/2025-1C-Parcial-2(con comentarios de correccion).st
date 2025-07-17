!classDefinition: #PaintorTest category: #'2025-1C-Parcial-2'!
TestCase subclass: #PaintorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:44:00'!
test01PaintorCannotAddAPaintingBiggerThanTheWall

	| paintor wall |
	wall := self exampleWall.
	paintor := Paintor onWall: wall.
	
	"
	test viejo :
	self 
		should: [paintor paint: (Rectangle origin: (10@5) extent: (3@3) )] 
		raise: Error 
		withMessageText: Wall paintingIsOutOfBoundsMessageError."
	
	
	"la corrección es : hacer saltar un error no es condición suficiente para probar que el pintor no agregó una pintura a la pared... por tanto..."
	self 
		should: [paintor paint: (Rectangle origin: (10@5) extent: (3@3) )] 
		raise: Error 
		withExceptionDo: [:anError | 
			"chequeamos que ocurra el error (ya que es una funcionalidad del sistema)"
			self assert: anError messageText equals: Wall paintingIsOutOfBoundsMessageError.
			"chequeamos que no se pinte efectivamente"
			self deny: wall isPainted .
			]
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:43:19'!
test02PaintorCanAddAPaintingSmallerThanTheWallWithinBounds

	| paintor wall |
	wall := self exampleWall.
	paintor := Paintor onWall: wall.
	paintor paint: (self paintingTwoExample).
	
	"la aclaración del corrector fue que si chequeo un bool con wall isPainted lo correcto es chequear el false también ya que podría estar hardcodeado el resultado"
	self assert: wall isPainted.! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:49:37'!
test03PaintorCannotAddADuplicatedPaintingToTheWall

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	paintor paint: self paintingOneExample .
	
	
	"test viejo : (no chequeo efectos colaterales (no constato que el comportamiento indeseado no se ejecute))
	self 
		should: [paintor paint: self paintingOneExample ] 
		raise: Error 
		withMessageText: Wall duplicatedPaintingMessageError
	"
	
	self 
		should:  [paintor paint: self paintingOneExample ] 
		raise:  Error
		withExceptionDo: [:anError |
			self assert: anError messageText equals: Wall duplicatedPaintingMessageError.
			"Tenemos que verificar que no haya dos en la pared entonces"
			self assert: (wall amountOfPaintings:1).
			]
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:51:51'!
test04PaintorCanSelectAPaintingFromAWall

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	paintor paint: (self paintingOneExample); 	select: (self paintingOneExample).
	
	"testeo booleano, por tanto necesito un test opuesto, o sea, no puede seleccionar una pintura que no está pintada digamos"
	self deny: paintor isYourSelectionEmpty 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:56:10'!
test04PaintorCannotSelectAPaintingFromAWallThatIsNotPainted

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	
	
	"este es el test que corrije el caso falso del bool"
	self 
		should:  [paintor 	select: (self paintingOneExample)]
		raise:  Error
		withExceptionDo: [:anError | 
			"La funcionalidad del error testeamos"
			self assert: anError messageText equals: Wall paintingSelectedIsNotPaintedMessageError .
			"y el efecto colateral indeseado no sucede :"
			self assert: paintor isYourSelectionEmpty .
			 ]
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:59:23'!
test05PaintorCannotSelectAPaintingFromAWallThatHasAlreadySelected

	| wall paintor |
	wall := self exampleWall. 
	
	paintor := Paintor onWall: wall.
	paintor paint: (self paintingOneExample);select: (self paintingOneExample).
	
	"no chequeamos el efecto colateral : que la selección esté vacía
	self should: [paintor select: (self paintingOneExample) ] raise: Error  withMessageText: Paintor paintingAlreadyInRepertoireMessageError 
	"
	
	self 
		should: [paintor select: (self paintingOneExample) ]  
		raise: Error  
		withExceptionDo:[:anError | 
			self assert: anError messageText equals: Paintor paintingAlreadyInRepertoireMessageError .
			"introduzco un mensaje para constatar el número de pinturas seleccionadas"
			self assert: (paintor sizeOfSelection:1).
			] ! !

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

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:08:36'!
test07PaintorCannotAlignAPaintingWhenNoPaintingIsSelected

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	
	"estaría bueno chequear que la selección es vacía y después introducir la funcionalidad del error, que nos llevará a testear si ninguna pintura se movió de su lugar (efecto colateral)"
	self should: [paintor align: #left] raise: Error  withMessageText: Paintor cannotALignPaintingsWhenEmptySelectionMessageError 	 
	
	"Los problemas de la alineación fueron :
		- La decisión de diseño de usar #left #rigth para hacerlo extensible (mala idea porque vamos de casos particulares a generales y con hacer dos simples alcanzaba (mi idea no está mal, pero está mal aplicada en general (no chequeo qué pasa si el símbolo de alineación no es el correcto en un test)))
		
		- La forma en que hago la alineación, las pinturas no son Mutables. El mensaje >>
			setOrigin: topLeft corner: bottomRight
				origin := topLeft.
				corner := bottomRight
		me solucionaba el problema y no tenía que hacer algo algorítmico como se evaluó.
	"! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:08:00'!
test08PaintorCannotAlignAPaintingWhenOnlyOnePaintingIsSelected

	| wall paintor |
	wall := self exampleWall. 
	paintor := Paintor onWall: wall.
	paintor paint: self paintingOneExample ; select: self paintingOneExample .

	"Habría que asertar que una pintura está seleccionada y luego introducir que levanta un error y luego chequear que no se haya movido la pintura (efecto colateral)"
	self should: [paintor align: #left] raise: Error  withMessageText: Paintor cannotAlignOneSelectedPaintingMessageError 	 
	! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:09:27'!
test09PaintorAlignsTwoPaintingsLeftCorrectly

	| paintor wall selection | 
	wall := self alignmentWallExample.
	paintor := Paintor onWall: wall.
	
	paintor paint: self alignPaintingExample1 ; paint: self alignPaintingExample2 ; select: self alignPaintingExample1 ; select: self alignPaintingExample2 .
 	 
	paintor align:#left.
	
	selection := OrderedCollection with: self alignPaintingExample2 with: self alignPaintingExample1.
	
	self assert: (wall assertSelection: selection isLeftAlignedWith: 0)
	"el problema de este test, además de todo lo anterior es la declaratividad del mensaje assertSelection: isLeftAlignedWith: "! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:09:37'!
test10PaintorAlignsTwoPaintingsRigthCorrectly

	| paintor wall selection | 
	wall := self alignmentWallExample.
	paintor := Paintor onWall: wall.
	
	paintor paint: self alignPaintingExample1 ; paint: self alignPaintingExample2 ; select: self alignPaintingExample1 ; select: self alignPaintingExample2 .
 	 
	paintor align: #rigth.
	selection := OrderedCollection with: self alignPaintingExample2 with: self alignPaintingExample1.
	self assert: (wall assertSelection: selection isRigthAlignedWith: 15)
	
	"análogo a lo anterior"! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:10:52'!
test11PaintorAlignsOnlySelectedPaintingsAndDoesNotModifyInternalStructureOfTheWall

	| paintor wall selection | 
	wall := self alignmentWallExample.
	paintor := Paintor onWall: wall.
	
	paintor paint: self paintingOneExample ;  paint: self alignPaintingExample1 ; paint: self alignPaintingExample2 ; select: self alignPaintingExample1 ; select: self alignPaintingExample2 .
 	 
	paintor align: #rigth.
	selection := OrderedCollection with: self alignPaintingExample2 with: self alignPaintingExample1.
	
	self assert: (wall assertSelection: selection isRigthAlignedWith: 15)
	
	"este test es interesante, no sé qué tanto estoy verificando que la estructura interna de la pared es la que debería ser igual, pero estaría interesante mirarlo más en detalle"! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:11:04'!
test12PaintingAffectsLog
	
	| paintor wall log | 
	log := Log new .
	wall :=	 Wall origin: (0@0) extent: (30@30) onLog: log.
	paintor := Paintor onWall: wall.
	paintor paint: self alignPaintingExample1.
	
	self assert: log isNotEmpty
	
	"no implementa ninguna funcionalidad"! !

!PaintorTest methodsFor: 'tests' stamp: 'tom 7/17/2025 11:11:20'!
test13PaintorCanUndoAPainting
	
	| paintor wall log | 
	log := Log new .
	wall :=	 Wall origin: (0@0) extent: (30@30) onLog: log.
	paintor := Paintor onWall: wall.
	paintor paint: self alignPaintingExample1.
	
	log unPaint: self alignPaintingExample1.
	
	"self assert: (wall paintingDoesNotBelong: self alignPaintingExample1)."
	
	"intenta implementar la primer funcionalidad pero no llegué"! !


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

!WallTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:31:54'!
test01WallCannotHaveNegativeExtent
	"el test está bien porque el extent debe ser positivo en x habría que chequear en y"
	self should: [Wall origin: (0@0) extent: (-1@0) onLog:(Log new) ] raise: Error  withMessageText: Wall extentIsNegativeMessageError ! !

!WallTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:34:56'!
test01_LaParedNoPuedeTenerExtensiónNegativaEnX

	self should: [Wall origin: (0@0) extent: (-1@0) onLog:(Log new) ] raise: Error  withMessageText: Wall extentIsNegativeMessageError ! !

!WallTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:34:21'!
test02WallCannotBeCreatedFurtherFrom00
	"este test está bien porque chequeo en x pero me faltó chequear en y"
	self should: [Wall origin: (-1@0) extent: (0@0) onLog: (Log new) ] raise: Error  withMessageText: Wall originOutOfBoundsMessageError ! !

!WallTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:35:14'!
test02_LaParedNoPuedeTenerExtensiónNegativaEnY
	
	self should: [Wall origin: (0@0) extent: (0@-1) onLog:(Log new) ] raise: Error  withMessageText: Wall extentIsNegativeMessageError ! !

!WallTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:30:36'!
test03_ElOrigenDeLaParedDebeSerPositivoEnX
	
	self should: [Wall origin: (-1@0) extent: (1@1) onLog: (Log new) ] raise: Error  withMessageText: Wall originOutOfBoundsMessageError ! !

!WallTest methodsFor: 'tests' stamp: 'tom 7/17/2025 10:30:28'!
test04_ElOrigenDeLaParedDebeSerPositivoEnY
	
	self should: [Wall origin: (0@-1) extent: (1@1) onLog: (Log new) ] raise: Error  withMessageText: Wall originOutOfBoundsMessageError ! !


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

!Paintor methodsFor: 'assertion' stamp: 'tom 7/17/2025 10:59:53'!
sizeOfSelection: aNumberOfPaintings 
	
	^ selection size = aNumberOfPaintings ! !


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


!Wall methodsFor: 'assertion' stamp: 'tom 7/17/2025 10:49:15'!
amountOfPaintings: anAmountOfPaintings 
	
	^ paintings size = anAmountOfPaintings ! !

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


!Wall class methodsFor: 'error handling' stamp: 'tom 7/17/2025 10:33:01'!
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

!Wall class methodsFor: 'error handling' stamp: 'tom 7/17/2025 10:53:18'!
paintingSelectedIsNotPaintedMessageError
	^'Painting selected is not painted in wall'! !
