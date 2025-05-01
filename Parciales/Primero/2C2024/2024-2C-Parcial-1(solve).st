!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'u 5/1/2025 15:27:57'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada)] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'u 4/29/2025 21:13:58'!
crearArmadura

	^ ItemDeDefensa crearArmadura! !

!TestMyA methodsFor: 'crear items' stamp: 'u 5/1/2025 16:11:38'!
crearBaculo
	
	^ ItemDeAtaque crearBaculo! !

!TestMyA methodsFor: 'crear items' stamp: 'u 4/29/2025 20:57:40'!
crearEscudoMagico

	^ ItemDeDefensa crearEscudoMagico 
! !

!TestMyA methodsFor: 'crear items' stamp: 'u 4/29/2025 21:43:21'!
crearEspadaPara: monstruo

	^ ItemDeAtaque crearEspadaPara: monstruo 
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'u 4/29/2025 20:39:21'!
crearGoblin
	
	^ Monstruo crearGoblin ! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'u 4/29/2025 20:40:16'!
crearGuerrero
	
	^ Aventurero crearGuerrero ! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'u 5/1/2025 15:44:23'!
crearMago

	^ Aventurero crearMago
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'u 4/29/2025 21:15:43'!
crearOgro

	^ Monstruo crearOgro ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'fuerza puntosDeVida itemsDeDefensa itemsDeAtaque'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'attack' stamp: 'u 5/1/2025 16:05:18'!
assertItemAtaque: anItem esDelTipo: aType
	^ anItem isKindOf: aType ! !

!Aventurero methodsFor: 'attack' stamp: 'u 5/1/2025 15:51:30'!
assertItemAtaqueEnInventario: unItemDeAtaque 
	
	(itemsDeAtaque anySatisfy: [:item | item = unItemDeAtaque ]) ifFalse: [self error: self itemNoDisponibleMensajeDeError]! !

!Aventurero methodsFor: 'attack' stamp: 'u 5/1/2025 15:45:56'!
equiparItemDeAtaque: itemDeAtaque 
	itemsDeAtaque add:itemDeAtaque ! !


!Aventurero methodsFor: 'defense' stamp: 'u 5/1/2025 15:46:06'!
equiparItemDeDefensa: aDefenseItem 
	itemsDeDefensa add: aDefenseItem ! !


!Aventurero methodsFor: 'error message' stamp: 'u 5/1/2025 15:54:17'!
itemNoDisponibleMensajeDeError
	^ 'Item no disponible'! !


!Aventurero methodsFor: 'accessing' stamp: 'u 5/1/2025 15:54:39'!
fuerza
	^fuerza ! !

!Aventurero methodsFor: 'accessing' stamp: 'u 5/1/2025 15:54:53'!
tienePuntosDeVida: aPV 
	^ puntosDeVida = aPV ! !


!Aventurero methodsFor: 'panalizacion' stamp: 'u 5/1/2025 16:10:55'!
penalizacionPorItemDeAtaque
	puntosDeVida := 0 * pv.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aventurero class' category: #'2024-2C-Parcial-1'!
Aventurero class
	instanceVariableNames: ''!

!Aventurero class methodsFor: 'instance creation' stamp: 'u 4/29/2025 20:40:54'!
crearGuerrero

	^Guerrero new initializeGuerrero! !

!Aventurero class methodsFor: 'instance creation' stamp: 'u 5/1/2025 15:44:47'!
crearMago
	
	^Mago new initializeMago! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: 'pvItemsDeDefensa'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'initialization' stamp: 'u 5/1/2025 15:23:51'!
initializeGuerrero
	puntosDeVida := 10 * pv.
	fuerza := 4.
	itemsDeDefensa := OrderedCollection new.
	itemsDeAtaque := OrderedCollection new.
	! !


!Guerrero methodsFor: 'accessing' stamp: 'u 4/29/2025 21:35:39'!
pvItemsDeDefensa
	^ itemsDeDefensa sum: [:itemDefensa | itemDefensa puntosDeProteccion ] ifEmpty:[0]! !


!Guerrero methodsFor: 'attack' stamp: 'u 5/1/2025 16:29:10'!
atacarA: aMonstruo con: itemDeAtaque 
	
	"chequeamos tener tal espada en el inventario"
	self assertItemAtaqueEnInventario: itemDeAtaque.
	
	aMonstruo teAtacaGuerrero: self con: itemDeAtaque ! !

!Guerrero methodsFor: 'attack' stamp: 'u 5/1/2025 17:23:54'!
atacasUnOgro: anOgro con: itemDeAtaque 
	
	"
	usamos la jerarquía polimórfica para que se constanten las especificaciones de:
	- si es espada : si la espada es para ese ogro
	- si  es báculo: que pueda atacarlo con él
	"
	
	itemDeAtaque puedoGuerrero: self AtacarOgro: anOgro .
	! !

!Guerrero methodsFor: 'attack' stamp: 'u 5/1/2025 17:20:30'!
podesAtacarAlOgro: anOgro 
	anOgro teAtacoConFuerza: (self fuerza)! !

!Guerrero methodsFor: 'attack' stamp: 'u 5/1/2025 17:22:34'!
podesAtacarConBaculo: anOgro 
	
	anOgro teAtacoConFuerza: (self fuerza )! !

!Guerrero methodsFor: 'attack' stamp: 'u 4/29/2025 21:29:07'!
teAtacaUnMonstruoConPV: aPuntosDeVida 
	puntosDeVida := puntosDeVida  - (0 max: (aPuntosDeVida - self pvItemsDeDefensa ))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Guerrero class' category: #'2024-2C-Parcial-1'!
Guerrero class
	instanceVariableNames: ''!

!Guerrero class methodsFor: 'error messages' stamp: 'u 5/1/2025 15:31:55'!
itemNoDisponibleMensajeDeError
	^ 'Item no disponible'! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'initialize' stamp: 'u 5/1/2025 15:46:45'!
initializeMago
	puntosDeVida := 15 * pv.
	fuerza := 2.
	itemsDeDefensa := OrderedCollection new.
	itemsDeAtaque := OrderedCollection new.! !


!Mago methodsFor: 'attack' stamp: 'u 5/1/2025 17:46:07'!
atacarA: aMonstruo con: itemDeAtaque 
	
	"no puede atacar sin constatar que tengamos ese item"
	self assertItemAtaqueEnInventario: itemDeAtaque .
	
	"chequeamos si es del tipo correcto usando la jerarquía polimórfica de los items de ataque"
	itemDeAtaque puedoMago: self atacarAlMonstruo: aMonstruo.
	! !

!Mago methodsFor: 'attack' stamp: 'u 5/1/2025 17:52:08'!
atacasUnGoblin: aGoblin con: itemDeAtaque 
	
	"usamos la jerarquía polimórfica para chequear si puede el mago usar el item o no"
	itemDeAtaque puedoMago: self AtacarGoblin: aGoblin! !

!Mago methodsFor: 'attack' stamp: 'u 5/1/2025 16:28:07'!
atacasUnOgro: anOgro con: itemDeAtaque 
	
	"no hace falta chequear que que sea para él como la espada"
	anOgro teAtacoConFuerza: self fuerza ! !

!Mago methodsFor: 'attack' stamp: 'u 5/1/2025 17:36:39'!
noPodesAtacarConEspada
	^self penalizacionPorItemDeAtaque! !

!Mago methodsFor: 'attack' stamp: 'u 5/1/2025 17:45:33'!
podesAtacarConBaculo: aBaculo AlMonstruo: aMonstruo 
	aMonstruo teAtacaMago: self con: aBaculo ! !

!Mago methodsFor: 'attack' stamp: 'u 5/1/2025 17:51:25'!
podesAtacarGoblin: aGoblin 
	
	aGoblin teAtacaMagoConBaculo! !


!classDefinition: #ItemDeAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeAtaque
	instanceVariableNames: 'targetMonster'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeAtaque methodsFor: 'accessing' stamp: 'u 5/1/2025 16:12:53'!
targetMonster
	^ targetMonster ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeAtaque class' category: #'2024-2C-Parcial-1'!
ItemDeAtaque class
	instanceVariableNames: ''!

!ItemDeAtaque class methodsFor: 'instance creation' stamp: 'u 5/1/2025 17:47:32'!
crearBaculo
	
	^Baculo new ! !

!ItemDeAtaque class methodsFor: 'instance creation' stamp: 'u 5/1/2025 16:39:09'!
crearEspadaPara: monstruo 
	
	self assertEspadaEsParaOgro: monstruo .
	^Espada new initializeEspadaPara: monstruo ! !


!ItemDeAtaque class methodsFor: 'assert' stamp: 'u 5/1/2025 16:41:13'!
assertEspadaEsParaOgro: monstruo 
	
	(monstruo isKindOf: Ogro ) ifFalse: [self error: self noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError ]! !


!ItemDeAtaque class methodsFor: 'error message' stamp: 'u 5/1/2025 16:41:51'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	^ 'No se puede atacar a monstruo menor a un metro de altura'! !


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
ItemDeAtaque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'assertion' stamp: 'u 5/1/2025 17:29:22'!
meAtacaUnGuerreroSoyGoblin: aGoblin 
	
	aGoblin meAtacaGuerreroConBaculo ! !

!Baculo methodsFor: 'assertion' stamp: 'u 5/1/2025 17:12:29'!
puedoGuerrero: unGuerrero AtacarOgro: anOgro 
	
	unGuerrero podesAtacarConBaculo: anOgro ! !

!Baculo methodsFor: 'assertion' stamp: 'u 5/1/2025 17:51:07'!
puedoMago: aMago AtacarGoblin: aGoblin 
	aMago podesAtacarGoblin: aGoblin ! !

!Baculo methodsFor: 'assertion' stamp: 'u 5/1/2025 17:44:37'!
puedoMago: aMago atacarAlMonstruo: aMonstruo 
	
	aMago podesAtacarConBaculo: self AlMonstruo: aMonstruo ! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
ItemDeAtaque subclass: #Espada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'initialization' stamp: 'u 5/1/2025 15:12:38'!
initializeEspadaPara: monstruo 
	
	targetMonster := monstruo.! !


!Espada methodsFor: 'assertion' stamp: 'u 5/1/2025 17:18:34'!
assertPuedeGuerrero: aGuerrero atacarA: anOgro 
	
	^ anOgro = targetMonster ! !

!Espada methodsFor: 'assertion' stamp: 'u 5/1/2025 17:19:55'!
puedoGuerrero: aGuerrero AtacarOgro: anOgro 
	
	(self assertPuedeGuerrero: aGuerrero atacarA: anOgro ) ifTrue: [aGuerrero podesAtacarAlOgro: anOgro ]! !

!Espada methodsFor: 'assertion' stamp: 'u 5/1/2025 17:36:20'!
puedoMago: aMago atacarAlMonstruo: aMonstruo 
	
	aMago noPodesAtacarConEspada! !


!classDefinition: #ItemDeDefensa category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeDefensa
	instanceVariableNames: 'puntosDeProteccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeDefensa methodsFor: 'accessing' stamp: 'u 4/29/2025 21:25:40'!
puntosDeProteccion
	^ puntosDeProteccion ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeDefensa class' category: #'2024-2C-Parcial-1'!
ItemDeDefensa class
	instanceVariableNames: ''!

!ItemDeDefensa class methodsFor: 'instance creation' stamp: 'u 4/29/2025 21:14:20'!
crearArmadura
	
	^Armadura new initializeArmadura! !

!ItemDeDefensa class methodsFor: 'instance creation' stamp: 'u 4/29/2025 20:58:38'!
crearEscudoMagico
	
	^EscudoMagico new initializeEscudoMagico! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
ItemDeDefensa subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'initialization' stamp: 'u 4/29/2025 21:37:16'!
initializeArmadura
	puntosDeProteccion := 5 * pv! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
ItemDeDefensa subclass: #EscudoMagico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'initialization' stamp: 'u 4/29/2025 21:37:29'!
initializeEscudoMagico
	puntosDeProteccion := 3 * pv! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruo
	instanceVariableNames: 'altura puntosDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'attack' stamp: 'u 4/29/2025 20:49:10'!
atacarA: guerrero 
	
	guerrero teAtacaUnMonstruoConPV: puntosDeVida ! !


!Monstruo methodsFor: 'accessing' stamp: 'u 5/1/2025 16:19:40'!
tienePuntosDeVida: puntos 
	^ puntosDeVida = puntos ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Monstruo class' category: #'2024-2C-Parcial-1'!
Monstruo class
	instanceVariableNames: ''!

!Monstruo class methodsFor: 'instance creation' stamp: 'u 4/29/2025 20:46:04'!
crearGoblin
	
	^Goblin new initializeGoblin! !

!Monstruo class methodsFor: 'instance creation' stamp: 'u 4/29/2025 21:16:02'!
crearOgro
	
	^Ogro new initializeOgro! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'initialization' stamp: 'u 4/29/2025 20:46:42'!
initializeGoblin
	puntosDeVida := 5 * pv.
	altura := 90 * centimeter .! !


!Goblin methodsFor: 'attack' stamp: 'u 5/1/2025 16:31:55'!
meAtacaGuerreroConBaculo
	puntosDeVida := puntosDeVida * 2! !

!Goblin methodsFor: 'attack' stamp: 'u 5/1/2025 17:31:28'!
teAtacaGuerrero: aGuerrero con: itemDeAtaque 
	
	"si me ataca un guerrero tenemos que chequear qué arma usa y decidir"
	itemDeAtaque meAtacaUnGuerreroSoyGoblin: self
	! !

!Goblin methodsFor: 'attack' stamp: 'u 5/1/2025 16:16:39'!
teAtacaMago: aMago con: itemDeAtaque 
	
	"tendríamos que ver que ese item sea efectivamente un báculo"
	aMago atacasUnGoblin: self con: itemDeAtaque ! !

!Goblin methodsFor: 'attack' stamp: 'u 5/1/2025 16:19:20'!
teAtacaMagoConBaculo
	puntosDeVida := 0 * pv! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'initialization' stamp: 'u 4/29/2025 21:16:38'!
initializeOgro
	altura := 220 * centimeter .
	puntosDeVida := 15 * pv.! !


!Ogro methodsFor: 'attack' stamp: 'u 5/1/2025 16:33:12'!
teAtacaGuerrero: aGuerrero con: itemDeAtaque 
	
	aGuerrero atacasUnOgro: self con: itemDeAtaque ! !

!Ogro methodsFor: 'attack' stamp: 'u 5/1/2025 15:57:19'!
teAtacaMago: aMago con: itemDeAtaque 
	
	aMago atacasUnOgro: self con: itemDeAtaque ! !

!Ogro methodsFor: 'attack' stamp: 'u 5/1/2025 15:42:54'!
teAtacoConFuerza: unaFuerza
	
	puntosDeVida := puntosDeVida - (unaFuerza * pv) 
	
	! !

TestMyA initialize!