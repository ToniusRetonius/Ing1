!classDefinition: #ProjectTest category: #'2P-ISW1-1C2024'!
TestCase subclass: #ProjectTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 16:15:49'!
adeleGoldberg
	^'Adele Goldberg'! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 15:08:42'!
devAlanKay

	^ Developer withDedication: (6*hour/day) named: 'Alan Kay' cost: (60*dollar/hour)! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 15:08:51'!
devDanIngalls

	^ Developer withDedication: (8*hour/day) named: 'Dan Ingalls' cost: (60*dollar/hour)! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 16:13:01'!
modelo
	^'Modelo'! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 16:13:53'!
modeloProject

	^ Project on:{self ssa. self ssb. self ssc} name: self modelo! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 16:19:35'!
sistemaERP
	^'Sistema ERP'! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 15:12:32'!
ssa

	^ ConcreteTask named: 'SS A' responsible: self devDanIngalls withEffortRequiered: (8*hour) andDependecies: {}! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 16:12:01'!
ssb
	
	| team |
	team := Team on: { self devDanIngalls. self devAlanKay } name: self modelo.
	^ ConcreteTask named: 'SS B' responsible: team withEffortRequiered: (16*hour) andDependecies: {}! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 15:16:11'!
ssc

	^ ConcreteTask named: 'SS C' responsible: self devAlanKay withEffortRequiered: (16*hour) andDependecies: {self ssa .self ssb}! !

!ProjectTest methodsFor: 'setup' stamp: 't 7/3/2025 16:16:55'!
uiTask

	^ ConcreteTask named: 'UI' responsible: self adeleGoldberg  withEffortRequiered: (6*hour)  andDependecies:{self modeloProject}! !


!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:02:47'!
test01ConcreteTaskEndsSameDayWhenDeveloperHasSameDedicationAsTheEffortRequiered
	
	self assert: self ssa estimatedFinalization equals: self ssa initializationDate .
	! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 15:48:37'!
test02ConcreteTaskEndsNextDayWhenDeveloperHasLessDedicationThanTheEffortRequiered
	
	| ssaAlan |
	ssaAlan := ConcreteTask named: 'SS A alan' responsible: self devAlanKay withEffortRequiered: (8*hour) andDependecies: {}.
		
	self assert: (ssaAlan takesDays: 2).
	! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:02:56'!
test03ConcreteTaskDependsOnOneTaskThatTakesADayToFinishStartsInItsFinalizationDate
	
	| ssTest1 ssTest2 |
	ssTest1 := ConcreteTask named: 'SS B' responsible: self devDanIngalls withEffortRequiered: (16*hour) andDependecies: {}.
	ssTest2 :=  ConcreteTask named: 'SS Test' responsible: self devDanIngalls withEffortRequiered: (8*hour) andDependecies: {ssTest1}.
	
	self assert: ssTest2 initializationDate equals: ssTest1 estimatedFinalization .! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:03:06'!
test04ConcreteTaskThatDependsOnManyTasksThatTakeTwoDaysEachToFinishAndEachDependOnOneAnotherStartsInLatestFinalizationDate
	
	| ssTest1 ssTest2 |
	ssTest1 :=  ConcreteTask named: 'SS B' responsible: self devDanIngalls withEffortRequiered: (16*hour) andDependecies: {}.
	ssTest2 :=  ConcreteTask named: 'SS C' responsible: self devDanIngalls withEffortRequiered: (16*hour) andDependecies: {self ssa .ssTest1}.
		
	self assert: ssTest2 initializationDate equals: ssTest1 estimatedFinalization .! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:12:12'!
test05ConcreteTaskDependsOnTheSlowestDevInTeam
	
	| ssTest team |
	team := Team on: { self devDanIngalls. self devAlanKay } name: self modelo.
	ssTest := ConcreteTask named: 'SS Test' responsible: team withEffortRequiered: (16*hour) andDependecies: {}.
	
	self assert: (team teamDedication: (6*hour/day)).
	self assert: (ssTest takesDays:3).
		
! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:13:53'!
test06ProjectStartsAtEarliestDateOfTheTaskWithinItself
		
	| modelo |

	modelo := self modeloProject.	
	
	self assert: modelo initializationDate equals: (self ssa) initializationDate .! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:51:53'!
test07ProjectStartsAtEarliestDateOfTheTaskWithinASubproject
		
	| sistemaERP |

	sistemaERP := Project on: {self modeloProject } name: (self sistemaERP).
	
	self assert: self modeloProject initializationDate equals: sistemaERP initializationDate ! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:13:53'!
test08ProjectEndsAtLatestDateOfTheTaskWithinItself
		
	| modelo |

	modelo := self modeloProject.	
	
	self assert: modelo finalizationDate equals: (self ssc) estimatedFinalization .! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 16:52:19'!
test09ProjectEndsAtLatestDateOfTheTaskWithinASubproject
		
	| sistemaERP |

	sistemaERP := Project on: {self modeloProject } name: (self sistemaERP).
	
	self assert: self modeloProject finalizationDate equals: sistemaERP finalizationDate ! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 17:33:08'!
test10DanIngallsOnTaskSSACalculatesItsCostCorrectly
	
	self assert: self ssa totalCost equals: (60*8* (self ssa daysItTakesTask)) * dollar ! !

!ProjectTest methodsFor: 'tests' stamp: 't 7/3/2025 17:47:11'!
test11ProjectWithMultipleTasksCalculatesItsCostCorrectly
	
	self assert: self modeloProject totalCost equals:  (4080*dollar)  .! !


!classDefinition: #Responsible category: #'2P-ISW1-1C2024'!
Object subclass: #Responsible
	instanceVariableNames: 'dedication name'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!Responsible methodsFor: 'task finalization' stamp: 't 7/3/2025 17:49:44'!
howManyDaysTakesYouToFinish: anEffortRequieredToFinishAConcreteTask 
	
	^(anEffortRequieredToFinishAConcreteTask / dedication) ceiling .! !


!classDefinition: #Developer category: #'2P-ISW1-1C2024'!
Responsible subclass: #Developer
	instanceVariableNames: 'cost'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!Developer methodsFor: 'initialization' stamp: 't 7/3/2025 17:17:41'!
initializeWithDedication: aDedicationUnit named: aName cost: aCost   
	dedication := aDedicationUnit.
	name := aName .
	cost := aCost .! !


!Developer methodsFor: 'access' stamp: 't 7/3/2025 14:35:33'!
dedication
	^dedication! !


!Developer methodsFor: 'cost' stamp: 't 7/3/2025 17:35:27'!
calculateCostWhenItTakes: anAountOfDays 
	^ (anAountOfDays * ((cost*hour) * (dedication/hour*day)))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Developer class' category: #'2P-ISW1-1C2024'!
Developer class
	instanceVariableNames: ''!

!Developer class methodsFor: 'instance creation' stamp: 't 7/3/2025 17:17:27'!
withDedication: aDedicationUnit named: aName cost: aCost   
	^self new initializeWithDedication: aDedicationUnit named: aName cost: aCost ! !


!classDefinition: #Team category: #'2P-ISW1-1C2024'!
Responsible subclass: #Team
	instanceVariableNames: 'developers'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!Team methodsFor: 'initialization' stamp: 't 7/3/2025 16:45:23'!
initializeOn: anArrayOfDevs aName: aName  
	developers := anArrayOfDevs.
	name := aName .
	self slowestInTeam.! !


!Team methodsFor: 'team' stamp: 't 7/3/2025 14:38:42'!
slowestInTeam
	
	| speed |
	speed := (developers asOrderedCollection first dedication)/(hour/day).
	developers asOrderedCollection do:[:dev | ((dev dedication)/(hour/day) > speed) ifTrue: (speed := (dev dedication)/(hour/day))].
	dedication := speed*(hour/day).
	^speed
	! !


!Team methodsFor: 'assertion' stamp: 't 7/3/2025 14:40:14'!
teamDedication: aDedicationTime 
	
	^ dedication = aDedicationTime 	! !


!Team methodsFor: 'cost' stamp: 't 7/3/2025 17:41:16'!
calculateCostWhenItTakes: anAmountOfDays 
	
	^ developers inject: (0*dollar ) into:[:sum :aDev | sum + (aDev calculateCostWhenItTakes: anAmountOfDays )].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Team class' category: #'2P-ISW1-1C2024'!
Team class
	instanceVariableNames: ''!

!Team class methodsFor: 'instance creation' stamp: 't 7/3/2025 16:44:39'!
on: anArrayOfDevs name: named  
	^self new initializeOn: anArrayOfDevs aName: name ! !


!classDefinition: #Task category: #'2P-ISW1-1C2024'!
Object subclass: #Task
	instanceVariableNames: 'initializationDate finalizationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!Task methodsFor: 'access' stamp: 't 7/3/2025 17:51:04'!
finalizationDate
	^finalizationDate! !


!classDefinition: #ConcreteTask category: #'2P-ISW1-1C2024'!
Task subclass: #ConcreteTask
	instanceVariableNames: 'name responsible effort dependencies'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!ConcreteTask methodsFor: 'initialization' stamp: 't 7/3/2025 14:49:02'!
affectInitializationBecauseOfDependencies
	
	| dependenciesAsOCollection estimatedInitialization|
	dependenciesAsOCollection := dependencies asOrderedCollection .
	estimatedInitialization := dependenciesAsOCollection first estimatedFinalization.
	dependenciesAsOCollection do: [:task | (estimatedInitialization < task estimatedFinalization) ifTrue: [estimatedInitialization :=  task estimatedFinalization]].

	^finalizationDate := estimatedInitialization .! !

!ConcreteTask methodsFor: 'initialization' stamp: 't 7/3/2025 17:13:46'!
initializeNamed: aName responsible: aDeveloper withEffortRequiered: anEffort andDependecies: anArrayOfDependencies 
	
	name := aName.
	responsible := aDeveloper.
	effort := anEffort.
	dependencies := anArrayOfDependencies.
	
	initializationDate := self instantiateDesiredInitialization.
	
	finalizationDate := self estimatedFinalization .
	! !

!ConcreteTask methodsFor: 'initialization' stamp: 't 7/3/2025 12:28:19'!
instantiateDesiredInitialization
	
	dependencies ifEmpty: [^Date current].
	
	^self affectInitializationBecauseOfDependencies.! !


!ConcreteTask methodsFor: 'finalization' stamp: 't 7/3/2025 17:13:05'!
defineFinalizationDateWithTakenDaysByTheTeam: daysTakenToFinish 

	finalizationDate := initializationDate .
	(daysTakenToFinish - 1)  timesRepeat: [finalizationDate := finalizationDate next].
	^finalizationDate ! !

!ConcreteTask methodsFor: 'finalization' stamp: 't 7/3/2025 17:13:31'!
estimatedFinalization
	
	| daysTakenToFinish |
	daysTakenToFinish := (responsible howManyDaysTakesYouToFinish: effort)/day .
	
	(daysTakenToFinish <= 1) ifTrue: [^initializationDate ] ifFalse: [^self defineFinalizationDateWithTakenDaysByTheTeam: daysTakenToFinish].
	
	! !


!ConcreteTask methodsFor: 'assertion' stamp: 't 7/3/2025 17:29:12'!
daysItTakesTask

	^ (finalizationDate dayOfMonth)- (initializationDate dayOfMonth) + 1! !

!ConcreteTask methodsFor: 'assertion' stamp: 't 7/3/2025 17:29:15'!
takesDays: anAmountOfDays 
	
	
	^ (self daysItTakesTask)	 = anAmountOfDays ! !


!ConcreteTask methodsFor: 'access' stamp: 't 7/3/2025 17:15:14'!
initializationDate
	^ initializationDate ! !


!ConcreteTask methodsFor: 'cost' stamp: 't 7/3/2025 17:29:29'!
totalCost
	^responsible calculateCostWhenItTakes: (self daysItTakesTask) ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConcreteTask class' category: #'2P-ISW1-1C2024'!
ConcreteTask class
	instanceVariableNames: ''!

!ConcreteTask class methodsFor: 'instance creation' stamp: 't 7/3/2025 11:28:47'!
named: aName responsible: aDeveloper withEffortRequiered: anEffort andDependecies: anArrayOfDependencies 
	^self new initializeNamed: aName responsible: aDeveloper withEffortRequiered: anEffort andDependecies: anArrayOfDependencies ! !


!classDefinition: #Project category: #'2P-ISW1-1C2024'!
Task subclass: #Project
	instanceVariableNames: 'subprojects'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2P-ISW1-1C2024'!

!Project methodsFor: 'initialization' stamp: 't 7/3/2025 16:20:34'!
defineInitializationDate
	
	initializationDate  := subprojects asOrderedCollection first initializationDate .
	subprojects do:[:aTask | (aTask initializationDate < initializationDate ) ifTrue: [initializationDate := aTask initializationDate ]].
	^initializationDate .! !

!Project methodsFor: 'initialization' stamp: 't 7/3/2025 16:05:47'!
initializeOn: anArrayOfSubprojectsOrTasks 
	subprojects := anArrayOfSubprojectsOrTasks.
	
	initializationDate := self defineInitializationDate.
	
	finalizationDate := self estimatedFinalizationDate.! !


!Project methodsFor: 'access' stamp: 't 7/3/2025 17:45:08'!
daysItTakesTask
	^subprojects asOrderedCollection inject: 0 into: [:sum :subProject | sum + (subProject daysItTakesTask)]. ! !

!Project methodsFor: 'access' stamp: 't 7/3/2025 16:40:23'!
initializationDate
	^ self defineInitializationDate ! !


!Project methodsFor: 'finalization' stamp: 't 7/3/2025 16:41:14'!
estimatedFinalization
	^ self finalizationDate ! !

!Project methodsFor: 'finalization' stamp: 't 7/3/2025 16:08:51'!
estimatedFinalizationDate
	
	finalizationDate := subprojects asOrderedCollection first estimatedFinalization .
	subprojects asOrderedCollection do:[:aTask | (finalizationDate < aTask estimatedFinalization ) ifTrue: [finalizationDate := aTask estimatedFinalization]].
	^ finalizationDate .! !


!Project methodsFor: 'cost' stamp: 't 7/3/2025 17:36:29'!
totalCost
	
	^subprojects inject:(0*dollar) into:[:sum :subProject | sum + (subProject totalCost )].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Project class' category: #'2P-ISW1-1C2024'!
Project class
	instanceVariableNames: ''!

!Project class methodsFor: 'instance creation' stamp: 't 7/3/2025 16:11:39'!
on: anArrayOfSubprojectsOrTasks name: named  
	^self new initializeOn: anArrayOfSubprojectsOrTasks ! !
