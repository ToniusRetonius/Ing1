!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'type speed altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'tom 4/10/2025 09:11:29'!
initialize

	self subclassResponsibility.! !

!Vehicle methodsFor: 'initialization' stamp: 'tom 4/10/2025 09:11:44'!
initializeWithType: typeToTake

	type := typeToTake .
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!Vehicle methodsFor: 'move' stamp: 'ARM 4/29/2024 11:03:19'!
accelerate

	type = #Helicopter
		ifTrue:[speed := speed + (10 * kilometer / hour).
			altitude := altitude + (5 * meter)].
		
	type = #Motorcycle
		ifTrue:[speed := speed + (20 * kilometer / hour)].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'1.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'move' stamp: 'tom 4/8/2025 14:41:39'!
accelerate
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter). ! !


!classDefinition: #Motorcicle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcicle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcicle methodsFor: 'move' stamp: 'tom 4/8/2025 14:42:27'!
accelerate
	speed := speed + (20 * kilometer / hour).! !
