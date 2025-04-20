!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo negativeOneHalf'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 't 4/20/2025 16:25:52'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:48'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:25'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:15:37'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:16:19'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/24/2020 02:23:47'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 't 4/20/2025 16:56:46'!
setUp

	zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	negativeOneHalf := Numero with: negativeOne over: two
	
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:53:51'!
* aMultiplier 

	self subclassResponsibility .
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:33:41'!
+ anAdder 
	
	self subclassResponsibility .
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:46:55'!
// aDivisor 
	
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:50:25'!
greatestCommonDivisorWith: anEntero 
	
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:53:42'!
negated
	
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:53:33'!
printOn: aStream
	
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:39:59'!
type
	
	"es polimorfismo ahora"! !


!Numero methodsFor: 'testing' stamp: 't 4/20/2025 16:15:22'!
isNegative
	self subclassResponsibility .! !

!Numero methodsFor: 'testing' stamp: 't 4/20/2025 16:15:17'!
isOne
	self subclassResponsibility .! !

!Numero methodsFor: 'testing' stamp: 't 4/20/2025 16:15:04'!
isZero
	self subclassResponsibility .! !


!Numero methodsFor: 'initialization' stamp: 't 4/20/2025 16:11:29'!
initializeWith: aValue
	"responsabilidad del Entero"
	self subclassResponsibility .! !

!Numero methodsFor: 'initialization' stamp: 't 4/20/2025 16:11:49'!
initializeWith: aNumerator over: aDenominator
	"responsabilidad de la fracción"
	self subclassResponsibility .! !


!Numero methodsFor: 'accessing' stamp: 't 4/20/2025 16:39:20'!
denominator

	self subclassResponsibility .! !

!Numero methodsFor: 'accessing' stamp: 't 4/20/2025 16:39:16'!
integerValue

	self subclassResponsibility .! !

!Numero methodsFor: 'accessing' stamp: 't 4/20/2025 16:39:08'!
numerator
	self subclassResponsibility .! !


!Numero methodsFor: 'comparing' stamp: 't 4/20/2025 17:08:35'!
= anObject
	self subclassResponsibility .
	
	"antes estaba : (anObject isKindOf: self class)... isKindOf: es un mensaje para verificar si un objeto es instancia de una clase específica o de alguna de sus subclases (es decir, pertenece este objeto a la jerarquía que incluye a la que le pasamos por parámetro ?) "! !

!Numero methodsFor: 'comparing' stamp: 't 4/20/2025 16:55:00'!
hash
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:49:48'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !


!Numero class methodsFor: 'instance creation' stamp: 't 4/20/2025 16:18:02'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^Entero new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 't 4/20/2025 16:19:56'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'testing' stamp: 't 4/20/2025 16:13:50'!
isNegative
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 't 4/20/2025 16:13:33'!
isOne
	^value = 1 ! !

!Entero methodsFor: 'testing' stamp: 't 4/20/2025 16:13:08'!
isZero
	^value = 0! !


!Entero methodsFor: 'initialization' stamp: 't 4/20/2025 16:09:21'!
initializeWith: aValue
	
	value := aValue! !


!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:30:13'!
* aNumber
	^aNumber multiplyUs: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:30:05'!
+ aNumber
	"a priori no sabemos si es entero"
	"el ret es para que devuelva el número que queremos sumar o , en caso de fallar, el error"
	^ aNumber addUs: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:46:45'!
// aDivisor 
	
	^ Numero with: value // aDivisor integerValue.
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:15:03'!
addUs: anInteger
	^Numero with: (value + anInteger integerValue).! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:47:52'!
greatestCommonDivisorWith: anEntero 
	
	^ Numero with: (value gcd: anEntero integerValue)
		
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:18:34'!
multiplyUs: anIntegerMultiplier
	^Numero with: value * anIntegerMultiplier integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:51:24'!
negated
	
	^self * (Numero with: -1).! !

!Entero methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:52:40'!
printOn: aStream
	
	 aStream print: value ! !


!Entero methodsFor: 'accessing' stamp: 't 4/20/2025 16:38:29'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'operations with fractions' stamp: 't 4/20/2025 17:31:50'!
addFraction: aFraction
	^self error: 'Tipo de número no soportado'.! !

!Entero methodsFor: 'operations with fractions' stamp: 't 4/20/2025 17:34:01'!
equalToFraction: aFraction
	^self error: 'Tipo de número no soportado'.! !

!Entero methodsFor: 'operations with fractions' stamp: 't 4/20/2025 17:28:34'!
multiplyWithFraction: aFraction
	^self error: 'Tipo de número no soportado'.
	! !


!Entero methodsFor: 'comparing' stamp: 't 4/20/2025 17:22:33'!
= anObject
	"no podemos asumir que anObject es un entero"
	^ anObject areWeEquals: self.
! !

!Entero methodsFor: 'comparing' stamp: 't 4/20/2025 17:22:09'!
areWeEquals: anInteger
	^value = anInteger integerValue .! !

!Entero methodsFor: 'comparing' stamp: 't 4/20/2025 16:54:36'!
hash
	 ^value hash.
	! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'initialization' stamp: 't 4/20/2025 16:08:23'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:29:54'!
* aNumber 
		
	^aNumber multiplyWithFraction: self.
		
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:30:38'!
+ aNumber
	
	^aNumber addFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:38:17'!
addFraction: aFraction
	| newNumerator newDenominator |
		
	newNumerator := (numerator * aFraction denominator) + (denominator * aFraction numerator).
	newDenominator := denominator * aFraction denominator.
		
	^ Numero with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 17:27:14'!
multiplyWithFraction: aFraction
	^Numero with: (numerator * aFraction numerator) over: (denominator * aFraction denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:51:10'!
negated
	
	^Numero with: numerator * (self class with: -1) over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 't 4/20/2025 16:53:18'!
printOn: aStream
	
	aStream print: numerator; nextPut: $/; print: denominator .! !


!Fraccion methodsFor: 'accessing' stamp: 't 4/20/2025 16:38:57'!
denominator

	^denominator! !

!Fraccion methodsFor: 'accessing' stamp: 't 4/20/2025 16:38:46'!
numerator

	^numerator! !


!Fraccion methodsFor: 'comparing' stamp: 't 4/20/2025 17:33:30'!
= anObject

	^anObject equalToFraction: self! !

!Fraccion methodsFor: 'comparing' stamp: 't 4/20/2025 17:33:16'!
equalToFraction: aFraction
	^(numerator * aFraction denominator) = (denominator * aFraction numerator)! !

!Fraccion methodsFor: 'comparing' stamp: 't 4/20/2025 16:54:51'!
hash
	 ^(numerator hash / denominator hash) hash ! !


!Fraccion methodsFor: 'testing' stamp: 't 4/20/2025 16:14:29'!
isNegative
	^denominator < 0 ! !

!Fraccion methodsFor: 'testing' stamp: 't 4/20/2025 16:14:47'!
isOne
	^ false ! !

!Fraccion methodsFor: 'testing' stamp: 't 4/20/2025 16:14:54'!
isZero
	^ false ! !


!Fraccion methodsFor: 'operations with integers' stamp: 't 4/20/2025 17:20:53'!
// aDivisor 
	^self error: 'Tipo de número no soportado'.
	
		! !

!Fraccion methodsFor: 'operations with integers' stamp: 't 4/20/2025 17:17:30'!
addUs: anInteger
	^self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'operations with integers' stamp: 't 4/20/2025 17:24:08'!
areWeEquals: anInteger
	^self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'operations with integers' stamp: 't 4/20/2025 17:20:04'!
multiplyUs: anIntegerMultiplier
	^self error: 'Tipo de número no soportado'.! !
