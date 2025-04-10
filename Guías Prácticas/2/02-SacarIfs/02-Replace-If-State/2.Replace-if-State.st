!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'tom 4/8/2025 15:24:37'!
initialize

	state := AutomobileOff  new.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'tom 4/8/2025 21:45:08'!
accelerate
	"sacamos los ifs porque tenemos que nosotros programadores hardcoderar el comportamiento en vez de dejar que los objetos se comuniquen entre sí. Los reemplazamos con la comunicación natural de los objetos. Reemplazando por polimorfismo. "
	"state accelerate: self."
		
	! !

!Automobile methodsFor: 'move' stamp: 'tom 4/8/2025 15:47:48'!
canAccelerate
	speed := speed + (10 * kilometer / hour).! !

!Automobile methodsFor: 'move' stamp: 'tom 4/8/2025 21:41:03'!
turnOn
	
	"state := AutomobileOn new."
	state := AutomobileOn on:self .! !


!classDefinition: #EstadoAutomobile category: #'2.Replace-if-State'!
Object subclass: #EstadoAutomobile
	instanceVariableNames: 'AssociatedVehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!EstadoAutomobile methodsFor: 'as yet unclassified' stamp: 'tom 4/8/2025 21:24:40'!
accelerate
	self subclassResponsibility .! !


!classDefinition: #AutomobileOff category: #'2.Replace-if-State'!
EstadoAutomobile subclass: #AutomobileOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileOff methodsFor: 'as yet unclassified' stamp: 'tom 4/8/2025 21:44:42'!
"accelerate: anAutomobile
	
	anAutomobile error: 'Can not accelerate when turned off'."
	
accelerate
	AssociatedVehicle error:'Can not accelerate when turned off'.! !


!classDefinition: #AutomobileOn category: #'2.Replace-if-State'!
EstadoAutomobile subclass: #AutomobileOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!AutomobileOn methodsFor: 'as yet unclassified' stamp: 'tom 4/8/2025 21:43:48'!
"accelerate: anAutomomobile"
	"si nosotros hacemos algo como : 
	anAutomobile speed: (anAutomobile speed + ...)
	de quién es la responsabilidad ? del estado del auto / motor ? o del auto ? Se rompe el encapsulamiento"
	"anAutomomobile canAccelerate."
accelerate 
	AssociatedVehicle accelerate.	! !
