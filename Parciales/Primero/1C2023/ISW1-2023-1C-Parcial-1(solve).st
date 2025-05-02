!classDefinition: #TestDePerforación category: #'ISW1-2023-1C-Parcial-1'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:41:37'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa
	| excavadora |
	
	excavadora := self crearPerforadoraConMechaSoftSobre: { [ CapaDeSuelo arenoso ]. [ CapaDeSuelo tierra ]. [ CapaDeSuelo concretoConResistencia: 5 ] }.
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:41:21'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo
	
	| excavadora |
	
	excavadora := self crearPerforadoraConMechaSoftSobre: { [ CapaDeSuelo tierra ]. [ CapaDeSuelo concretoConResistencia: 5 ] }.
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:45:04'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora |
	
	excavadora := self crearPerforadoraConMechaSoftSobre: {[CapaDeSuelo concretoConResistencia: 5.]. [CapaDeSuelo tierra.]}.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:47:39'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora |
	
	excavadora := self crearPerforadoraConMechaWidiaSobre: { [CapaDeSuelo arenoso]. [CapaDeSuelo tierra].[CapaDeSuelo concretoConResistencia: 5] }.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata.
	
.! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:49:56'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora |
	
	excavadora := self crearPerforadoraConMechaWidiaSobre: { [CapaDeSuelo tierra].[			CapaDeSuelo concretoConResistencia: 5] } .
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:50:48'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora |
	
	excavadora := self crearPerforadoraConMechaWidiaSobre: { [CapaDeSuelo concretoConResistencia: 5]	. 			[CapaDeSuelo tierra]}.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:54:31'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora  |
	
	excavadora := self crearPerforadoraConMechaDiamanteSobre: { [CapaDeSuelo arenoso].			[CapaDeSuelo tierra].			[CapaDeSuelo concretoConResistencia: 5] } .
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:57:40'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora |
	
	excavadora := self crearPerforadoraConMechaDiamanteSobre: {[CapaDeSuelo tierra]. [			CapaDeSuelo concretoConResistencia: 5] } .
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:58:22'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora |
	excavadora := self crearPerforadoraConMechaDiamanteSobre: {[CapaDeSuelo concretoConResistencia: 5].[CapaDeSuelo tierra.]} .
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:52:13'!
test10CuandoRemueveLaCapaYHayPiedrasLasRecolectaEnSuContainer

	| excavadora |
	excavadora := self crearPerforadoraConMechaSoftSobre: {[CapaDeSuelo arenoso]. ['Mica'].['Marmol'].			} .
	
	excavadora darGolpeDeTaladro.
	
	self assert: {	'Mica'. 'Marmol'} equals: excavadora elementsInContainer
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:52:41'!
test11CuandoRemueveLaCapaYNoHayNadaNoRecogeNada

	| excavadora |
	
	excavadora := self crearPerforadoraConMechaSoftSobre: {CapaDeSuelo arenoso }.
	
	excavadora darGolpeDeTaladro.
	
	self assert: excavadora elementsInContainer isEmpty
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 19:05:31'!
test12NoPuedePerforarSinMecha

	| excavadora |
	
	excavadora := self crearExcavadoraSobreSuelo: {			[CapaDeSuelo arenoso.		]	} .
		
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No puede perforar' equals: unError messageText.
			self assert: (CapaDeSuelo arenoso) equals: excavadora capaDeSueloInmediata ].	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 19:05:08'!
test13PuedeCalcularProfundidadDelSuelo

	| excavadora |
	
	excavadora := self crearExcavadoraSobreSuelo: { [CapaDeSuelo arenoso setAltura: 2]. [CapaDeSuelo tierra setAltura: 40]. [CapaDeSuelo arenoso]} .
	
	self assert: 42 equals: excavadora calcularProfundidadDelSuelo.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:25:18'!
test14PuedeContarLasCapasDeTipoArenoso
	
	self assert: 2 equalsCantidadDeCapasDe: Arenoso new 

	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:25:41'!
test15PuedeContarLasCapasDeTipoTierra
	
	self assert: 1 equalsCantidadDeCapasDe: Tierra new.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:26:01'!
test16PuedeContarLasCapasDeTipoConcreto

	self assert: 1 equalsCantidadDeCapasDe: Concreto new

	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:27:26'!
test17PuedeCalcularProfundidadHastaPrimerCapaDeTipoArenoso
	
	self assert: 0 equalsProfundidadDelSueloHasta:  Arenoso new.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:28:32'!
test18PuedeCalcularProfundidadHastaPrimerCapaDeTipoTierra
	
	self assert: 2 equalsProfundidadDelSueloHasta: Tierra new

	! !

!TestDePerforación methodsFor: 'test' stamp: 'to 5/2/2025 18:28:55'!
test19PuedeCalcularProfundidadHastaPrimerCapaDeTipoConcreto

	self assert: 42 equalsProfundidadDelSueloHasta: Concreto new! !


!TestDePerforación methodsFor: 'assertions' stamp: 'to 5/2/2025 18:24:43'!
assert: aNumber equalsCantidadDeCapasDe: unSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: aNumber equals: (excavadora contarCapas: unSuelo ).
	! !

!TestDePerforación methodsFor: 'assertions' stamp: 'to 5/2/2025 18:28:05'!
assert: aNumber equalsProfundidadDelSueloHasta: aSuelo 
	
	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: aNumber equals: (excavadora calcularProfundidadDelSueloHasta: aSuelo ).! !


!TestDePerforación methodsFor: 'create' stamp: 'to 5/2/2025 19:03:16'!
crearExcavadoraSobreSuelo: listaDeCapas
	
	| suelo perforadora |
	
	suelo := self crearSuelo: listaDeCapas .
	
	perforadora := Perforadora sobreSuelo: suelo.
	
	^perforadora ! !

!TestDePerforación methodsFor: 'create' stamp: 'to 5/2/2025 19:02:44'!
crearPerforadoraConMechaDiamanteSobre: listaDeCapas 
	
	| perforadora  |

	perforadora := self crearExcavadoraSobreSuelo: listaDeCapas .
	
	perforadora ponerMechaDiamante .
	
	^perforadora 
! !

!TestDePerforación methodsFor: 'create' stamp: 'to 5/2/2025 19:03:45'!
crearPerforadoraConMechaSoftSobre: unaListaDeCapas
	
	| perforadora |
	
	perforadora := self crearExcavadoraSobreSuelo: unaListaDeCapas .
	
	perforadora ponerMechaSoft.
	
	^ perforadora
! !

!TestDePerforación methodsFor: 'create' stamp: 'to 5/2/2025 19:04:03'!
crearPerforadoraConMechaWidiaSobre: listaDeCapas 
	
	|perforadora|

	perforadora := self crearExcavadoraSobreSuelo: listaDeCapas .
	
	perforadora ponerMechaWidia .
	
	^ perforadora ! !

!TestDePerforación methodsFor: 'create' stamp: 'to 5/2/2025 18:41:03'!
crearSuelo: unaListaDeCapas
	
	^ unaListaDeCapas collect: [:capa | capa value ].
! !


!classDefinition: #CapaDeSuelo category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: 'altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSuelo methodsFor: 'initialization' stamp: 'to 5/2/2025 16:24:36'!
initializeArenoso
	
	self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'to 5/2/2025 16:24:30'!
initializeConcretoConResistencia: resistenciaInicial 

	self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'to 5/2/2025 16:24:23'!
initializeTierra
	
	self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'assertion' stamp: 'to 5/2/2025 16:28:56'!
esArenoso
	^false! !

!CapaDeSuelo methodsFor: 'assertion' stamp: 'to 5/2/2025 16:29:01'!
esConcreto
	^false! !

!CapaDeSuelo methodsFor: 'assertion' stamp: 'to 5/2/2025 16:29:05'!
esTierra
	^false! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'to 5/2/2025 17:52:39'!
= unaCapaDeSuelo
    ^(unaCapaDeSuelo isKindOf: self class)
        and: [tipo = unaCapaDeSuelo tipo and: [resistencia = unaCapaDeSuelo resistencia]].! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'to 5/2/2025 17:52:55'!
hash
    ^tipo hash + resistencia hash.! !


!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'to 5/2/2025 16:35:12'!
bajaUnDecimoDeResistencia
	self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'to 5/2/2025 16:35:07'!
sinResistencia
	self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'FRT 5/5/2023 16:48:52'!
altura

	^ altura.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 5/8/2023 13:10:35'!
resistencia

	^ resistencia.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:18:41'!
tipo

	^tipo! !


!CapaDeSuelo methodsFor: 'scan' stamp: 'FRT 5/5/2023 16:31:36'!
scan

	self esArenoso ifTrue: [ ^ 7 ].
	self esTierra ifTrue: [ ^ 10 ].
	^ 50. ! !


!CapaDeSuelo methodsFor: 'setters' stamp: 'FRT 5/5/2023 16:07:55'!
setAltura: unaAltura

	altura := unaAltura! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'to 5/2/2025 16:25:58'!
arenoso

	^Arenoso  new initializeArenoso! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'to 5/2/2025 16:26:05'!
concretoConResistencia: resistencia 

	^Concreto new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'to 5/2/2025 16:26:10'!
tierra

	^Tierra new initializeTierra! !


!classDefinition: #Arenoso category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Arenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Arenoso methodsFor: 'initialization' stamp: 'to 5/2/2025 18:11:28'!
initializeArenoso
	
	altura := 0! !


!Arenoso methodsFor: 'assertion' stamp: 'to 5/2/2025 16:27:46'!
esArenoso
	^true! !


!Arenoso methodsFor: 'accessing' stamp: 'to 5/2/2025 17:43:49'!
cantidadDeCapas
	^ 7 ! !

!Arenoso methodsFor: 'accessing' stamp: 'to 5/2/2025 17:40:58'!
valorDeProfundidad
	^ 7! !


!Arenoso methodsFor: 'excavation' stamp: 'to 5/2/2025 18:02:13'!
perforarConMecha: mechaPuesta yPerforadora: aPerforadora 
	
	^mechaPuesta puedoPerforarSueloArenoso: aPerforadora ! !


!classDefinition: #Concreto category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Concreto
	instanceVariableNames: 'resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Concreto methodsFor: 'initialization' stamp: 'to 5/2/2025 18:11:19'!
initializeConcretoConResistencia: resistenciaInicial 

	resistencia := resistenciaInicial.
	altura := 0.! !


!Concreto methodsFor: 'assertion' stamp: 'to 5/2/2025 16:28:25'!
esConcreto
	^true! !


!Concreto methodsFor: 'bajar resistencia' stamp: 'to 5/2/2025 16:34:19'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!Concreto methodsFor: 'bajar resistencia' stamp: 'to 5/2/2025 16:34:59'!
sinResistencia
	^resistencia = 0! !


!Concreto methodsFor: 'accessing' stamp: 'to 5/2/2025 17:44:21'!
cantidadDeCapas
	^ 50! !

!Concreto methodsFor: 'accessing' stamp: 'to 5/2/2025 17:41:39'!
valorDeProfundidad
	^ 50
	! !


!Concreto methodsFor: 'excavation' stamp: 'to 5/2/2025 18:04:45'!
perforarConMecha: mechaPuesta yPerforadora: aPerforadora 
	
	^mechaPuesta puedoPerforarSueloConcreto: aPerforadora ! !


!classDefinition: #Tierra category: #'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Tierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Tierra methodsFor: 'initialization' stamp: 'to 5/2/2025 18:11:49'!
initializeTierra
	"le sacamos el nil, no modela la realidad"
	altura := 0! !


!Tierra methodsFor: 'assertion' stamp: 'to 5/2/2025 16:28:47'!
esTierra
	^true! !


!Tierra methodsFor: 'accessing' stamp: 'to 5/2/2025 17:44:05'!
cantidadDeCapas
	^ 10 ! !

!Tierra methodsFor: 'accessing' stamp: 'to 5/2/2025 17:41:23'!
valorDeProfundidad
	^10 ! !


!Tierra methodsFor: 'excavation' stamp: 'to 5/2/2025 18:03:10'!
perforarConMecha: mechaPuesta yPerforadora: aPerforadora 
	
	^mechaPuesta puedoPerforarSueloTerroso: aPerforadora ! !


!classDefinition: #Mecha category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #Mecha
	instanceVariableNames: 'perforadora'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Mecha methodsFor: 'initialization' stamp: 'to 5/2/2025 17:06:21'!
initializeWith: aPerforadora 
	perforadora := aPerforadora.! !


!Mecha methodsFor: 'assertion' stamp: 'to 5/2/2025 17:32:23'!
estaSinMecha: aPerforadora 
	"si una mecha lo recibe es porque efectivamente tiene puesta una mecha"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mecha class' category: #'ISW1-2023-1C-Parcial-1'!
Mecha class
	instanceVariableNames: ''!

!Mecha class methodsFor: 'instance creation' stamp: 'to 5/2/2025 16:43:21'!
on: aPerforadora
	^self new initializeWith: aPerforadora ! !


!classDefinition: #Diamante category: #'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Diamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Diamante methodsFor: 'as yet unclassified' stamp: 'to 5/2/2025 17:17:23'!
puedoPerforarSueloArenoso: aPerforadora 
	^aPerforadora rompisteLaMecha ! !

!Diamante methodsFor: 'as yet unclassified' stamp: 'to 5/2/2025 17:20:45'!
puedoPerforarSueloConcreto: aPerforadora 
	
	^aPerforadora perforarConMechaDiamante
			! !

!Diamante methodsFor: 'as yet unclassified' stamp: 'to 5/2/2025 17:18:01'!
puedoPerforarSueloTerroso: aPerforadora 
	^ aPerforadora podesPasarALaSiguienteCapa ! !


!classDefinition: #Soft category: #'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Soft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!


!Soft methodsFor: 'excavation' stamp: 'to 5/2/2025 16:51:42'!
puedoPerforarSueloArenoso: aPerforadora 
	^aPerforadora podesPasarALaSiguienteCapa
	! !

!Soft methodsFor: 'excavation' stamp: 'to 5/2/2025 17:16:58'!
puedoPerforarSueloConcreto: aPerforadora

	^aPerforadora rompisteLaMecha	! !

!Soft methodsFor: 'excavation' stamp: 'to 5/2/2025 16:55:57'!
puedoPerforarSueloTerroso: aPerforadora 
	
	^ aPerforadora sueloTerrosoNoHaceNada! !


!classDefinition: #Widia category: #'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Widia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Widia methodsFor: 'as yet unclassified' stamp: 'to 5/2/2025 17:09:01'!
puedoPerforarSueloArenoso: aPerforadora 
	^aPerforadora podesPasarALaSiguienteCapa ! !

!Widia methodsFor: 'as yet unclassified' stamp: 'to 5/2/2025 17:12:25'!
puedoPerforarSueloConcreto: aPerforadora 
	
	^aPerforadora siGolpeasteTresVecesLaCapaActualRompisteLaMecha
	
			! !

!Widia methodsFor: 'as yet unclassified' stamp: 'to 5/2/2025 17:10:52'!
puedoPerforarSueloTerroso: aPerforadora 
	 
	^aPerforadora assertGolpeasteCapaActualDosVeces
		! !


!classDefinition: #Perforadora category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #Perforadora
	instanceVariableNames: 'mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 5/1/2023 20:07:29'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self]. 
	(capasDeSueloDebajo first isKindOf: CapaDeSuelo) ifFalse:[
			container addAll: capasDeSueloDebajo.
		]! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 4/27/2023 20:46:30'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 17:11:09'!
assertGolpeasteCapaActualDosVeces

	vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
	^self ! !

!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 18:04:54'!
darGolpeDeTaladro
		
	self sinMecha .

	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	
	^capasDeSueloDebajo first perforarConMecha: mechaPuesta yPerforadora: self.
	! !

!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 17:21:03'!
perforarConMechaDiamante
	
	vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
	capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
	^vecesQueGolpeoCapaActual ! !

!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 16:51:59'!
podesPasarALaSiguienteCapa
	 ^self pasarAProximaCapa 
		! !

!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 17:16:58'!
rompisteLaMecha
	mechaPuesta := Rota on:self.
	^ self error: 'Se rompió' .! !

!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 17:12:50'!
siGolpeasteTresVecesLaCapaActualRompisteLaMecha
	
	vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := Rota on: self. self error: 'Se rompió' ].
	^self ! !

!Perforadora methodsFor: 'excavation' stamp: 'to 5/2/2025 16:56:08'!
sueloTerrosoNoHaceNada
	^ self! !


!Perforadora methodsFor: 'initialization' stamp: 'to 5/2/2025 16:42:14'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	container := OrderedCollection new.
	mechaPuesta := SinMecha on: self! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'to 5/2/2025 17:04:53'!
conMechaRota

	^mechaPuesta estaRota! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:12:20'!
elementsInContainer
	^container asArray! !

!Perforadora methodsFor: 'accessing' stamp: 'to 5/2/2025 17:27:23'!
sinMecha

	^ mechaPuesta estaSinMecha:self! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:17'!
sobreSueloArenoso
	^capasDeSueloDebajo first esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:16:14'!
sobreSueloConcreto
	^capasDeSueloDebajo first esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:58'!
sobreSueloTierra
	^capasDeSueloDebajo first esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'to 5/2/2025 16:44:15'!
ponerMechaDiamante
	mechaPuesta := Diamante on:self! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'to 5/2/2025 16:43:57'!
ponerMechaSoft
	mechaPuesta := Soft on: self! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'to 5/2/2025 16:44:06'!
ponerMechaWidia
	mechaPuesta := Widia on: self! !


!Perforadora methodsFor: 'scan' stamp: 'to 5/2/2025 18:13:12'!
calcularProfundidadDelSuelo
	
	"acumulamos las alturas de las capas"
	^capasDeSueloDebajo inject: 0 into:[:total :capa | total + (capa altura)]
	 ! !

!Perforadora methodsFor: 'scan' stamp: 'to 5/2/2025 18:17:51'!
calcularProfundidadDelSueloHasta: tipoDeCapa
	
	| valor suma |
	.
	valor := tipoDeCapa valorDeProfundidad.
	
	suma := 0.
	
	capasDeSueloDebajo do: [:capa | (valor = capa scan) ifTrue:[^suma]. suma := suma + (capa altura )]. ^ suma
	 
	! !

!Perforadora methodsFor: 'scan' stamp: 'to 5/2/2025 18:08:13'!
contarCapas: tipoDeCapa
	
	"Cuenta las capas de tipo tipoDeCapa. Recordar que para identificar cada capa se utiliza el valor de scan que retorna. Por ej. un capa tipo Arenoso retorna 7 al scan"
	
	| valor |
	
	valor := tipoDeCapa cantidadDeCapas.

	^capasDeSueloDebajo count:[:capa | valor = capa scan]
	
	"contamos las que cumplen que el valor = al scan de capa "! !


!Perforadora methodsFor: 'error handling' stamp: 'to 5/2/2025 17:31:01'!
estasSinMecha
	^self error: 'No puede perforar'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-2023-1C-Parcial-1'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !


!classDefinition: #StateMecha category: #'ISW1-2023-1C-Parcial-1'!
Object subclass: #StateMecha
	instanceVariableNames: 'perforadora'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!StateMecha methodsFor: 'initialization' stamp: 'to 5/2/2025 17:03:23'!
initializeWith: aPerforadora 
	perforadora := aPerforadora.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateMecha class' category: #'ISW1-2023-1C-Parcial-1'!
StateMecha class
	instanceVariableNames: ''!

!StateMecha class methodsFor: 'instance creation' stamp: 'to 5/2/2025 16:41:37'!
on: aPerforadora
	^self new initializeWith: aPerforadora ! !


!classDefinition: #Rota category: #'ISW1-2023-1C-Parcial-1'!
StateMecha subclass: #Rota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Rota methodsFor: 'assertion' stamp: 'to 5/2/2025 17:05:22'!
estaRota
	^true! !


!classDefinition: #SinMecha category: #'ISW1-2023-1C-Parcial-1'!
StateMecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!SinMecha methodsFor: 'assertion' stamp: 'to 5/2/2025 17:25:10'!
estaRota
	^false ! !

!SinMecha methodsFor: 'assertion' stamp: 'to 5/2/2025 17:29:41'!
estaSinMecha: aPerforadora 
	^aPerforadora estasSinMecha! !
