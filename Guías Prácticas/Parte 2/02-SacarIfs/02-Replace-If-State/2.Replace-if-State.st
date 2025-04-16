!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 't 4/14/2025 17:51:08'!
initialize

	self turnOff.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 't 4/14/2025 17:44:31'!
accelerate
	"Hicimos la jerarquía polimórfica, le pusimos el mismo nombre de mensaje y mandamos los cuerpos de los Ifs"
	state accelerate .! !

!Automobile methodsFor: 'move' stamp: 't 4/14/2025 17:54:37'!
accelerateWhenOff
	self error: 'Can not accelerate when turned off'.! !

!Automobile methodsFor: 'move' stamp: 't 4/14/2025 17:55:04'!
accelerateWhenOn
	speed := speed + (10 * kilometer / hour)! !

!Automobile methodsFor: 'move' stamp: 't 4/14/2025 18:02:06'!
speed
	^speed.! !

!Automobile methodsFor: 'move' stamp: 't 4/14/2025 17:56:02'!
turnOff
	"Qué pasa cuando inicializamos un auto ? Está apagado su estado... para modelar eso, queremos que el componente que sabe su estado, sepa de qué auto está representando el estado... para ello,  nos vamos a la Clase State Automobile"
	state := AutomobileOff on: self.! !

!Automobile methodsFor: 'move' stamp: 't 4/14/2025 17:56:52'!
turnOn
	"Análogo al turnOff, utilizamos el mensaje on: que conoce la super clase del AutomobileOn para que sepa a qué auto representa"
	state := AutomobileOn on: self.! !


!classDefinition: #StateAutomobile category: #'2.Replace-if-State'!
Object subclass: #StateAutomobile
	instanceVariableNames: 'myAutomobile'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!StateAutomobile methodsFor: 'move' stamp: 't 4/14/2025 17:49:41'!
accelerate
	self subclassResponsibility .! !


!StateAutomobile methodsFor: 'init' stamp: 't 4/14/2025 17:53:04'!
initializeStateOf: anAutomobile
	myAutomobile := anAutomobile .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateAutomobile class' category: #'2.Replace-if-State'!
StateAutomobile class
	instanceVariableNames: ''!

!StateAutomobile class methodsFor: 'init' stamp: 't 4/14/2025 17:53:27'!
on: anAutomobile
	^ self new initializeStateOf: anAutomobile .! !


!classDefinition: #AutomobileOff category: #'2.Replace-if-State'!
StateAutomobile subclass: #AutomobileOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileOff methodsFor: 'move' stamp: 't 4/14/2025 17:55:24'!
accelerate
	myAutomobile accelerateWhenOff .! !


!classDefinition: #AutomobileOn category: #'2.Replace-if-State'!
StateAutomobile subclass: #AutomobileOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileOn methodsFor: 'move' stamp: 't 4/14/2025 17:55:34'!
accelerate
	myAutomobile accelerateWhenOn ! !
