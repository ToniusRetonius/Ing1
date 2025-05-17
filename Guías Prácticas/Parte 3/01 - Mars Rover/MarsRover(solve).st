!classDefinition: #TestMarsRover category: #'Mars Rover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!TestMarsRover methodsFor: 'first tests' stamp: 'tom 5/16/2025 20:57:19'!
test01MoveForwardNorth
	|marsRover|
	marsRover := MarsRover new.
	
	self assert: marsRover moveNorth equals: (0@1).! !

!TestMarsRover methodsFor: 'first tests' stamp: 'tom 5/16/2025 21:02:41'!
test02MoveForwardSouth
	|marsRover|
	marsRover := MarsRover new.
	
	self assert: marsRover moveSouth equals: (0@-1).! !

!TestMarsRover methodsFor: 'first tests' stamp: 'tom 5/16/2025 21:11:54'!
test03TurnEast
	|marsRover|
	marsRover := MarsRover new.
	marsRover turnEast.
	
	self assert:  marsRover position equals: (0@0).
	self assert: marsRover orientation equals: #East.! !

!TestMarsRover methodsFor: 'first tests' stamp: 'tom 5/16/2025 21:11:51'!
test04TurnWest
	|marsRover|
	marsRover := MarsRover new.
	marsRover turnWest.
	
	self assert:  marsRover position equals: (0@0).
	self assert: marsRover orientation equals: #West.! !

!TestMarsRover methodsFor: 'first tests' stamp: 'tom 5/16/2025 21:17:14'!
test05MoveNorthTurnEastMoveEast
	|marsRover|
	marsRover := MarsRover new.
	marsRover moveNorth; turnEast ; moveEast.
	
	self assert:  marsRover position equals: (1@1).
	self assert: marsRover orientation equals: #East.! !

!TestMarsRover methodsFor: 'first tests' stamp: 'tom 5/16/2025 21:18:57'!
test06MoveNorthTurnEastMoveEastTurnNorthMoveNorth
	|marsRover|
	marsRover := MarsRover new.
	marsRover moveNorth; turnEast ; moveEast.
	
	self assert:  marsRover position equals: (1@1).
	self assert: marsRover orientation equals: #East.! !


!TestMarsRover methodsFor: 'second tests' stamp: 't 5/17/2025 18:15:29'!
test01MoveForwardLookingNorth
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'f'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (0@1).
	self assert: marsrRover orientation equals: #North.! !

!TestMarsRover methodsFor: 'second tests' stamp: 'tom 5/16/2025 21:34:28'!
test02MoveBackwardLookingNorth
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'b'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (0@-1).
	self assert: marsrRover orientation equals: #North.! !

!TestMarsRover methodsFor: 'second tests' stamp: 't 5/17/2025 17:16:36'!
test03MoveBackwardLookingNorthTurnEast
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'b'; add:'l'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (0@-1).
	self assert: marsrRover orientation equals: #West.! !

!TestMarsRover methodsFor: 'second tests' stamp: 'tom 5/16/2025 21:51:05'!
test04MoveBackwardLookingNorthTurnEastMoveEast
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'b'; add:'r';add:'f'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (1@-1).
	self assert: marsrRover orientation equals: #East.! !

!TestMarsRover methodsFor: 'second tests' stamp: 'tom 5/16/2025 21:54:49'!
test05MoveBackwardLookingNorthTurnWestMoveWest
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'b'; add:'l';add:'f'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (-1@-1).
	self assert: marsrRover orientation equals: #West.! !

!TestMarsRover methodsFor: 'second tests' stamp: 't 5/17/2025 17:21:55'!
test06TurnFourTimesRigthEndsUpLookingSameDirectionSamePosition
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'r'; add:'r';add:'r'; add:'r'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (0@0).
	self assert: marsrRover orientation equals: #North.! !

!TestMarsRover methodsFor: 'second tests' stamp: 't 5/17/2025 17:22:41'!
test07TurnFourTimesLeftEndsUpLookingSameDirectionSamePosition
	|marsrRover commands |
	marsrRover := self createRobot.
	
	commands := OrderedCollection new.
	commands add:'l'; add:'l';add:'l'; add:'l'.
	
	marsrRover move:commands .
	
	self assert: marsrRover position equals: (0@0).
	self assert: marsrRover orientation equals: #North.! !


!TestMarsRover methodsFor: 'setup' stamp: 'tom 5/16/2025 21:25:04'!
createRobot
	^ MarsRover new! !


!classDefinition: #Command category: #'Mars Rover'!
Object subclass: #Command
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!


!classDefinition: #Backward category: #'Mars Rover'!
Command subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Backward methodsFor: 'execution' stamp: 't 5/17/2025 18:15:18'!
executeWithOrientation: anOrientation marsRover: aMarsRover 
	
	anOrientation moveBackward: aMarsRover ! !


!classDefinition: #Forward category: #'Mars Rover'!
Command subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Forward methodsFor: 'execution' stamp: 't 5/17/2025 18:13:51'!
executeWithOrientation: anOrientation marsRover: aMarsRover 
	
	anOrientation moveForward: aMarsRover ! !


!classDefinition: #Left category: #'Mars Rover'!
Command subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Left methodsFor: 'execution' stamp: 't 5/17/2025 18:16:06'!
executeWithOrientation: anOrientation marsRover: aMarsRover 
	anOrientation turnLeft: aMarsRover ! !


!classDefinition: #Rigth category: #'Mars Rover'!
Command subclass: #Rigth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Rigth methodsFor: 'execution' stamp: 't 5/17/2025 18:30:22'!
executeWithOrientation: anOrientation marsRover: aMarsRover 
	
	anOrientation turnRigth: aMarsRover ! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation commandLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 't 5/17/2025 18:25:12'!
initializeInMars
	position := 0@0.
	orientation := MarsRoverOrientationModule headingNorthOn: self.
	commandLog := OrderedCollection new.! !


!MarsRover methodsFor: 'move' stamp: 't 5/17/2025 18:13:01'!
move: commands 
	
	"
	|command command2 |
	command := commands at: 1.
	command2 := commands at:2.
	
	(command = 'f') ifTrue: [
		(orientation = #North) ifTrue: [self moveNorth].
		].
	
	(command = 'b') ifTrue: [
		(orientation = #North) ifTrue: [self moveSouth ].
		].
	
	(command2 = 'l') ifTrue: [
		(orientation = #North) ifTrue: [self turnEast ]
		]
	"
	
	"
	commands do:[:command | 
		|roverOrientation|
		roverOrientation := orientation .
		(command = 'b') ifTrue: [ 
			(roverOrientation = #North) ifTrue: [self moveSouth].
			(roverOrientation = #South) ifTrue: [self moveNorth].
			(roverOrientation = #East) ifTrue: [self moveWest ].
			(roverOrientation = #West) ifTrue: [self moveEast]
			].
		(command = 'r') ifTrue: [
			(roverOrientation = #North) ifTrue: [self turnEast].
			(roverOrientation = #South) ifTrue: [self turnWest ].
			(roverOrientation = #East) ifTrue: [self turnSouth ].
			(roverOrientation = #West) ifTrue: [self turnNorth ]
			].
		
		(command = 'f') ifTrue: [
			(roverOrientation = #North) ifTrue: [self moveNorth].
			(roverOrientation = #South) ifTrue: [self moveSouth ].
			(roverOrientation = #East) ifTrue: [self moveEast ].
			(roverOrientation = #West) ifTrue: [self moveWest ]
			
			].
		
		(command = 'l') ifTrue: [
			(roverOrientation = #North) ifTrue: [self turnWest ].
			(roverOrientation = #South) ifTrue: [self turnEast ].
			(roverOrientation = #East) ifTrue: [self turnNorth ].
			(roverOrientation = #West) ifTrue: [self turnSouth ]
			]
		]
	
	"
	self logCommands: commands .
	commandLog do: [:command | command executeWithOrientation: orientation marsRover: self].
	! !

!MarsRover methodsFor: 'move' stamp: 'tom 5/16/2025 21:17:44'!
moveEast
	position := ((position x) +1)@ (position y)! !

!MarsRover methodsFor: 'move' stamp: 't 5/17/2025 18:10:23'!
moveNorth
	position := (position x)@((position y ) + 1).! !

!MarsRover methodsFor: 'move' stamp: 't 5/17/2025 18:10:20'!
moveSouth
	position := (position x)@((position y)-1)! !

!MarsRover methodsFor: 'move' stamp: 'tom 5/16/2025 21:29:24'!
moveWest
	position := ((position x) -1)@ (position y)! !


!MarsRover methodsFor: 'accessing' stamp: 't 5/17/2025 18:00:41'!
orientation
	
	^orientation tellMeOrientation! !

!MarsRover methodsFor: 'accessing' stamp: 'tom 5/16/2025 21:10:46'!
position
	
	^position! !


!MarsRover methodsFor: 'command log' stamp: 't 5/17/2025 18:11:48'!
logCommands: commands 
	
	commands do:[:command | 
		(command ='f') ifTrue: [commandLog add: (Forward new) ].
		(command ='b') ifTrue:[commandLog add: (Backward new) ].
		(command ='l') ifTrue: [commandLog add: (Left new) ].
		(command ='r') ifTrue:[commandLog add: (Rigth new) ].
		]! !


!MarsRover methodsFor: 'orientation' stamp: 't 5/17/2025 18:28:40'!
turnEast
	orientation := MarsRoverOrientationModule headingEastOn: self.! !

!MarsRover methodsFor: 'orientation' stamp: 't 5/17/2025 18:28:27'!
turnNorth
	orientation := MarsRoverOrientationModule headingNorthOn: self.! !

!MarsRover methodsFor: 'orientation' stamp: 't 5/17/2025 18:28:52'!
turnSouth
	orientation := MarsRoverOrientationModule headingSouthOn: self.! !

!MarsRover methodsFor: 'orientation' stamp: 't 5/17/2025 18:29:02'!
turnWest
	orientation := MarsRoverOrientationModule headingWestOn: self.! !


!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:03:43'!
moveBackwardOrientationNorth
	
	self moveSouth ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:32:58'!
moveForwardOrientationEast
	self moveEast ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 17:59:19'!
moveForwardOrientationNorth
	self moveNorth ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:34:08'!
moveForwardOrientationWest
	self moveWest ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:38:36'!
turnLeftOrientationEast
	self turnNorth ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:38:03'!
turnLeftOrientationSouth
	self turnEast ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:37:32'!
turnLeftOrientationWest
	self turnSouth ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:08:30'!
turnLeftWithOrientationNorth
	self turnWest ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:34:48'!
turnRigthOrientationEast
	self turnSouth ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:31:39'!
turnRigthOrientationNorth
	
	self turnEast ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:35:56'!
turnRigthOrientationSouth
	self turnWest ! !

!MarsRover methodsFor: 'move with dispatch' stamp: 't 5/17/2025 18:36:32'!
turnRigthOrientationWest
	self turnNorth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'tom 5/16/2025 20:58:21'!
new
	^ self basicNew initializeInMars! !


!classDefinition: #MarsRoverOrientationModule category: #'Mars Rover'!
Object subclass: #MarsRoverOrientationModule
	instanceVariableNames: 'rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverOrientationModule methodsFor: 'initialization' stamp: 't 5/17/2025 17:40:22'!
initializeOn: aMarsRover 
	
	rover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationModule class' category: #'Mars Rover'!
MarsRoverOrientationModule class
	instanceVariableNames: ''!

!MarsRoverOrientationModule class methodsFor: 'instance creation' stamp: 't 5/17/2025 18:32:04'!
headingEastOn: aMarsRover 
	
	^MarsRoverOrientationEast new initializeOn: aMarsRover ! !

!MarsRoverOrientationModule class methodsFor: 'instance creation' stamp: 't 5/17/2025 18:26:41'!
headingNorthOn: aMarsRover 
	
	^MarsRoverOrientationNorth new initializeOn: aMarsRover ! !

!MarsRoverOrientationModule class methodsFor: 'instance creation' stamp: 't 5/17/2025 18:35:08'!
headingSouthOn: aMarsRover 
	
	^MarsRoverOrientationSouth new initializeOn: aMarsRover ! !

!MarsRoverOrientationModule class methodsFor: 'instance creation' stamp: 't 5/17/2025 18:29:28'!
headingWestOn: aMarsRover 
	
	^MarsRoverOrientationWest new initializeOn: aMarsRover ! !


!classDefinition: #MarsRoverOrientationEast category: #'Mars Rover'!
MarsRoverOrientationModule subclass: #MarsRoverOrientationEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverOrientationEast methodsFor: 'execution' stamp: 't 5/17/2025 18:32:38'!
moveForward: aMarsRover 
	
	aMarsRover moveForwardOrientationEast! !

!MarsRoverOrientationEast methodsFor: 'execution' stamp: 't 5/17/2025 18:38:20'!
turnLeft: aMarsRover 
	aMarsRover turnLeftOrientationEast! !

!MarsRoverOrientationEast methodsFor: 'execution' stamp: 't 5/17/2025 18:34:31'!
turnRigth: aMarsRover 
	aMarsRover turnRigthOrientationEast! !


!MarsRoverOrientationEast methodsFor: 'accessing' stamp: 't 5/17/2025 18:33:23'!
tellMeOrientation
	^'East'! !


!classDefinition: #MarsRoverOrientationNorth category: #'Mars Rover'!
MarsRoverOrientationModule subclass: #MarsRoverOrientationNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverOrientationNorth methodsFor: 'execution' stamp: 't 5/17/2025 18:03:24'!
moveBackward: aMarsRover 
	
	aMarsRover moveBackwardOrientationNorth! !

!MarsRoverOrientationNorth methodsFor: 'execution' stamp: 't 5/17/2025 17:58:50'!
moveForward: aMarsRover 
	
	aMarsRover moveForwardOrientationNorth! !

!MarsRoverOrientationNorth methodsFor: 'execution' stamp: 't 5/17/2025 18:07:21'!
turnLeft: aMarsRover 
	
	aMarsRover turnLeftWithOrientationNorth! !

!MarsRoverOrientationNorth methodsFor: 'execution' stamp: 't 5/17/2025 18:31:17'!
turnRigth: aMarsRover 
	
	aMarsRover turnRigthOrientationNorth! !


!MarsRoverOrientationNorth methodsFor: 'accessing' stamp: 't 5/17/2025 18:20:09'!
tellMeOrientation
	^'North'! !


!classDefinition: #MarsRoverOrientationSouth category: #'Mars Rover'!
MarsRoverOrientationModule subclass: #MarsRoverOrientationSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverOrientationSouth methodsFor: 'accessing' stamp: 't 5/17/2025 18:40:27'!
tellMeOrientation
	^'South'! !


!MarsRoverOrientationSouth methodsFor: 'execution' stamp: 't 5/17/2025 18:37:47'!
turnLeft: aMarsRover 
	aMarsRover turnLeftOrientationSouth! !

!MarsRoverOrientationSouth methodsFor: 'execution' stamp: 't 5/17/2025 18:35:35'!
turnRigth: aMarsRover 
	aMarsRover turnRigthOrientationSouth! !


!classDefinition: #MarsRoverOrientationWest category: #'Mars Rover'!
MarsRoverOrientationModule subclass: #MarsRoverOrientationWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverOrientationWest methodsFor: 'accessing' stamp: 't 5/17/2025 18:29:45'!
tellMeOrientation
	^'West'! !


!MarsRoverOrientationWest methodsFor: 'execution' stamp: 't 5/17/2025 18:33:54'!
moveForward: aMarsRover 
	aMarsRover moveForwardOrientationWest! !

!MarsRoverOrientationWest methodsFor: 'execution' stamp: 't 5/17/2025 18:37:13'!
turnLeft: aMarsRover 
	aMarsRover turnLeftOrientationWest! !

!MarsRoverOrientationWest methodsFor: 'execution' stamp: 't 5/17/2025 18:36:16'!
turnRigth: aMarsRover 
	aMarsRover turnRigthOrientationWest! !
