!classDefinition: #PenalesTest category: #'ISW1-2023-2C-Parcial-1'!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Arquero
	instanceVariableNames: 'fuerza maneraDeAtajar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Arquero methodsFor: 'initialization' stamp: 't 5/3/2025 13:44:50'!
initializeEligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerza 

	fuerza := unaFuerza.
	maneraDeAtajar := ManeraDeAtajar eligeDireccionOn: self ! !

!Arquero methodsFor: 'initialization' stamp: 't 5/3/2025 13:04:17'!
initializeEsperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza 
	
	fuerza := unaFuerza.
	maneraDeAtajar := ManeraDeAtajar EsperaYSeAdelantaOn: self! !


!Arquero methodsFor: 'accessing' stamp: 't 5/3/2025 13:38:43'!
fuerza
	
	^fuerza! !


!Arquero methodsFor: 'penales' stamp: 't 5/3/2025 14:39:14'!
recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal 
	
	maneraDeAtajar recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal ! !

!Arquero methodsFor: 'penales' stamp: 't 5/3/2025 15:33:18'!
recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal 
	
	maneraDeAtajar recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal ! !

!Arquero methodsFor: 'penales' stamp: 't 5/3/2025 15:20:57'!
recibePlayeraAColocarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal 
	
	maneraDeAtajar recibePlayeraAColocarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal ! !

!Arquero methodsFor: 'penales' stamp: 't 5/3/2025 15:54:22'!
recibePlayeraAMatarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal 
	
	maneraDeAtajar recibePlayeraAMatarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #'ISW1-2023-2C-Parcial-1'!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:44:11'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeEligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerza ! !

!Arquero class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:03:31'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeEsperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza ! !


!classDefinition: #Delantero category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Delantero
	instanceVariableNames: 'fuerza maneraDePatear'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Delantero methodsFor: 'initialization' stamp: 't 5/3/2025 13:41:22'!
initializeDecideTirarAColocarSuFuerzaBaseEs: unaFuerza 
	
	fuerza := unaFuerza / 2.
	maneraDePatear := ManeraDePatear aColocarOn: self.! !

!Delantero methodsFor: 'initialization' stamp: 't 5/3/2025 15:30:59'!
initializeDecideTirarAMatarSuFuerzaBaseEs: unaFuerza 

	fuerza := unaFuerza.
	maneraDePatear := ManeraDePatear initializeAMatarOn: self! !


!Delantero methodsFor: 'accessing' stamp: 't 5/3/2025 13:38:56'!
fuerza
	
	^fuerza! !


!Delantero methodsFor: 'penales' stamp: 't 5/3/2025 14:07:27'!
patea: pelota conDireccion: direccionTiro alArquero: unArquero queSeTiraA: direccionArquero unPenal: enPenal  
	
	maneraDePatear pateo: pelota conDireccion: direccionTiro  alArquero: unArquero queSeTiraA: direccionArquero enPenal: enPenal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #'ISW1-2023-2C-Parcial-1'!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:00:20'!
decideTirarAColocarSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeDecideTirarAColocarSuFuerzaBaseEs: unaFuerza ! !

!Delantero class methodsFor: 'instance creation' stamp: 't 5/3/2025 15:29:37'!
decideTirarAMatarSuFuerzaBaseEs: unaFuerza 
	
	^self new initializeDecideTirarAMatarSuFuerzaBaseEs: unaFuerza ! !


!classDefinition: #ManeraDeAtajar category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #ManeraDeAtajar
	instanceVariableNames: 'arquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ManeraDeAtajar class' category: #'ISW1-2023-2C-Parcial-1'!
ManeraDeAtajar class
	instanceVariableNames: ''!

!ManeraDeAtajar class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:05:41'!
EsperaYSeAdelantaOn: anArquero 

	^EsperaYSeAdelanta new initializeEsperaYSeAdelantaOn: anArquero ! !

!ManeraDeAtajar class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:46:35'!
eligeDireccionOn: anArquero 
	
	^EligeAntesDeTiro new initializeEligeDireccionOn: anArquero ! !


!classDefinition: #EligeAntesDeTiro category: #'ISW1-2023-2C-Parcial-1'!
ManeraDeAtajar subclass: #EligeAntesDeTiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!EligeAntesDeTiro methodsFor: 'initialization' stamp: 't 5/3/2025 13:46:53'!
initializeEligeDireccionOn: anArquero 

	arquero := anArquero.
	! !


!EligeAntesDeTiro methodsFor: 'penales' stamp: 't 5/3/2025 14:42:53'!
recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal 
	
	unPenal recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroQueEligeAntesDeTiroHacia: direccionArquero! !

!EligeAntesDeTiro methodsFor: 'penales' stamp: 't 5/3/2025 15:33:47'!
recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal 
	
	unPenal recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroQueEligeAntesDeTiroHacia: direccionArquero! !

!EligeAntesDeTiro methodsFor: 'penales' stamp: 't 5/3/2025 15:21:30'!
recibePlayeraAColocarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal 
	
	unPenal recibePlayeraAColocarHacia: direccionTiro conDireccionArqueroQueEligeAntesDeTiro: direccionArquero! !

!EligeAntesDeTiro methodsFor: 'penales' stamp: 't 5/3/2025 15:55:11'!
recibePlayeraAMatarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal 
	
	
	unPenal recibePlayeraAMatarHacia: direccionTiro  conDireccionArqueroQueEligeAntesDeTiro: direccionArquero ! !


!classDefinition: #EsperaYSeAdelanta category: #'ISW1-2023-2C-Parcial-1'!
ManeraDeAtajar subclass: #EsperaYSeAdelanta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!EsperaYSeAdelanta methodsFor: 'initialization' stamp: 't 5/3/2025 13:05:51'!
initializeEsperaYSeAdelantaOn: anArquero 
	arquero := anArquero.! !


!EsperaYSeAdelanta methodsFor: 'penales' stamp: 't 5/3/2025 14:39:59'!
recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal 
	
	unPenal recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroQueEsperaYSeAdelantaHacia: direccionArquero ! !

!EsperaYSeAdelanta methodsFor: 'penales' stamp: 't 5/3/2025 16:02:19'!
recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal 
	
	unPenal recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroQueEsperaYSeAdelantaHacia: direccionArquero! !

!EsperaYSeAdelanta methodsFor: 'penales' stamp: 't 5/3/2025 15:24:25'!
recibePlayeraAColocarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal 
	
	unPenal recibePlayeraAColocarHacia: direccionTiro conDireccionArqueroQueEsperaYSeAdelanta: direccionArquero! !

!EsperaYSeAdelanta methodsFor: 'penales' stamp: 't 5/3/2025 16:19:29'!
recibePlayeraAMatarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal 
	
	unPenal recibePlayeraAMatarHacia: direccionTiro conDireccionArqueroQueEsperaYSeAdelanta: direccionArquero! !


!classDefinition: #ManeraDePatear category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #ManeraDePatear
	instanceVariableNames: 'delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ManeraDePatear class' category: #'ISW1-2023-2C-Parcial-1'!
ManeraDePatear class
	instanceVariableNames: ''!

!ManeraDePatear class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:01:46'!
aColocarOn: aDelantero 
	
	^AColocar new initializeAColocarOn: aDelantero ! !

!ManeraDePatear class methodsFor: 'instance creation' stamp: 't 5/3/2025 15:31:20'!
initializeAMatarOn: aDelantero 
	
	^AMatar new initializeInitializeAMatarOn: aDelantero ! !


!classDefinition: #AColocar category: #'ISW1-2023-2C-Parcial-1'!
ManeraDePatear subclass: #AColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!AColocar methodsFor: 'initialization' stamp: 't 5/3/2025 13:01:57'!
initializeAColocarOn: aDelantero 
	delantero := aDelantero.! !


!AColocar methodsFor: 'penales' stamp: 't 5/3/2025 14:37:21'!
pateo: pelota conDireccion: direccionTiro alArquero: unArquero queSeTiraA: direccionArquero enPenal: unPenal 
	
	pelota pateaDelanteroAColocarHacia: direccionTiro alArquero: unArquero queSeTira: direccionArquero enPenal: unPenal ! !


!classDefinition: #AMatar category: #'ISW1-2023-2C-Parcial-1'!
ManeraDePatear subclass: #AMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!AMatar methodsFor: 'initialization' stamp: 't 5/3/2025 15:31:28'!
initializeInitializeAMatarOn: aDelantero 
	delantero := aDelantero.! !


!AMatar methodsFor: 'penales' stamp: 't 5/3/2025 15:32:23'!
pateo: pelota conDireccion: direccionTiro alArquero: unArquero queSeTiraA: direccionArquero enPenal: unPenal 
	
	pelota pateaDelanteroAMatarHacia: direccionTiro alArquero: unArquero  queSeTira: direccionArquero enPenal: unPenal ! !


!classDefinition: #Pelota category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #'ISW1-2023-2C-Parcial-1'!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:02:48'!
jabulaniSudafricanaRapida
	
	^Jabulani new! !

!Pelota class methodsFor: 'instance creation' stamp: 't 5/3/2025 15:17:53'!
playeraLentaCostaAzul
	
	^Playera new ! !


!classDefinition: #Jabulani category: #'ISW1-2023-2C-Parcial-1'!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Jabulani methodsFor: 'penales' stamp: 't 5/3/2025 14:38:40'!
pateaDelanteroAColocarHacia: direccionTiro alArquero: unArquero queSeTira: direccionArquero enPenal: unPenal 
	
	unArquero recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroHacia: direccionArquero enPenal: unPenal ! !

!Jabulani methodsFor: 'penales' stamp: 't 5/3/2025 15:32:56'!
pateaDelanteroAMatarHacia: direccionTiro alArquero: unArquero queSeTira: direccionArquero enPenal: unPenal 
	
	
	unArquero recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroHacia: direccionArquero  enPenal: unPenal ! !


!classDefinition: #Playera category: #'ISW1-2023-2C-Parcial-1'!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Playera methodsFor: 'penales' stamp: 't 5/3/2025 15:19:55'!
pateaDelanteroAColocarHacia: direccionTiro alArquero: unArquero queSeTira: direccionArquero enPenal: unPenal 
	
	unArquero recibePlayeraAColocarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal ! !

!Playera methodsFor: 'penales' stamp: 't 5/3/2025 15:53:56'!
pateaDelanteroAMatarHacia: direccionTiro alArquero: unArquero queSeTira: direccionArquero enPenal: unPenal 
	
	unArquero recibePlayeraAMatarHacia: direccionTiro conDireccionArquero: direccionArquero enPenal: unPenal ! !


!classDefinition: #Penales category: #'ISW1-2023-2C-Parcial-1'!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero puntajeDeDelantero puntajeDeArquero direccionRemateResultante fuerzaResultanteDeTiro fuerzaResultanteDeAtajada direccionArqueroResultante'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-2C-Parcial-1'!

!Penales methodsFor: 'ayuda diseñador del juego' stamp: 't 5/3/2025 16:31:10'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionTiro arqueroSeLanzaEnDirección: direccionArquero
	
	self assertDireccionTiroEnRango: direccionTiro.
	self assertDireccionDeAtajadaEnRango: direccionArquero .
	delantero patea: pelota conDireccion: direccionTiro alArquero: arquero queSeTiraA: direccionArquero unPenal: self 	.
	
	"Hola de nuevo!!"
	"Bueno, yo soy sólo el diseñador del juego pero ojo que algo de programación sé, eh?"
	"Te tiro una mano... para mi esto sale más o menos así:"
	
	"[asserts, chequeos de errores, etc..].
	
	[inicialización de ''cosas'' que se modifican dependiendo de los ifs de abajo... Por ej la fuerza del jugador o del arquero iniciales pueden cambiar segun el escenario del test en cuestión].
	
	xxx = #AColocar ifTrue:[
		[Lo que sea que aplica sólo para estos tiros, si algo...],
		yyy = #Jabulani ifTrue: [
			[lo que sea que aplique para estos tiros y la pelota, si algo...]
			zzz  = #EligeDireccionAntesTiro ifTrue:
				[Caso específico de los tres al mismo tiempo...].
			zzz = #EsperaTiroYSeAdelanta ifTrue: 
				[...].
		].
		yyy = #Playera ifTrue:[
			[...].
			zzz  = #EligeDireccionAntesTiro ifTrue:
				[...].
			zzz = #EsperaTiroYSeAdelanta ifTrue:
				[...].
		].
	].
	xxx = #AMatar ifTrue:[
		[...].
		yyy = #Jabulani ifTrue: [
			[...].
			zzz = #EligeDireccionAntesTiro ifTrue:
				[...].
			zzz = #EsperaTiroYSeAdelanta ifTrue:
				[...].
		].
		yyy = #Playera ifTrue:[
			[...].
			zzz  = #EligeDireccionAntesTiro ifTrue:
				[...].
			zzz= #EsperaTiroYSeAdelanta ifTrue:
				[...].
		].
	].
	
	[Se decide quién ganó en base a como quedaron las ''cosas'' después de los ifs...]
	
	o sea, el caso general sería algo como lo que sigue, no?
	
	[trayectoraFinalTiro between: 0@0 and 2@2] ifFalse:
		[puntajeArquero := 1] ifTrue:
			Esta parte que sigue no me salió...  ayudame vos a mi ;) mi idea es:
			[algo que chequee si las coordenadas finales de ambos quedaron iguales despues de los ifs?]
			[y que la fuerza del arquero final es mayor o igual a la del tiro?] ifTrue:
				[puntajeArquero := 1] ifFalse:
				[puntajeDelantero := 1]."
	
	
	"Bueno, algo así..."
	"jajaj, sí, ya sé, vos seguro lo podes hacer mucho mejor... pero nada, es gratis y lo tenés de referencia si lo queres usar. Por ahí te sirve... ;)"! !


!Penales methodsFor: 'initialization' stamp: 't 5/3/2025 13:42:31'!
initializeConDelantero: unDelantero yArquero: unArquero 

	delantero := unDelantero.
	arquero := unArquero.
	puntajeDeDelantero := 0.
	puntajeDeArquero := 0.
	direccionRemateResultante := 0@0.
	fuerzaResultanteDeTiro := 0! !


!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 16:14:41'!
arqueroIgnoraAncho: direccionArquero 
	direccionArqueroResultante := (direccionRemateResultante x)@(direccionArquero y)! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 15:00:47'!
assert: direccionArquero equals: direccionTiro

	^ direccionTiro = direccionArquero! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 15:38:38'!
assertDelanteroPateaAlAngulo: direccionTiro 
	
	^(direccionTiro = (0@0)) or:(direccionTiro = (0@2)) or: (direccionTiro = (2@0)) or:(direccionTiro = (2@2))! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 13:21:04'!
assertDireccionDeAtajadaEnRango: direccionArquero 
	
	(self enRango: direccionArquero ) ifFalse: [self error: self class direccionArqueroFueraDeRango ]! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 13:20:07'!
assertDireccionTiroEnRango: direccionTiro 
	
	(self enRango: direccionTiro ) ifFalse: [self error: self class direccionTiroFueraDeRango ]! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 16:12:39'!
assertDireccionesEnRangoDiferentesTiroA: direccionTiro yAtajadaA: direccionArquero 
	
	((self assert: direccionArquero equals: direccionTiro))  ifTrue: [self assertFuerza] ifFalse: [ (self enRango: direccionTiro ) ifTrue: [puntajeDeDelantero := 1.] ifFalse: [puntajeDeArquero := 1]].

	direccionRemateResultante := direccionTiro 
	! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 14:45:18'!
assertFuerza

	(fuerzaResultanteDeAtajada >= fuerzaResultanteDeTiro ) ifTrue: [puntajeDeArquero  := 1] ifFalse: [puntajeDeDelantero := 1].
	! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 13:20:42'!
enRango: direccionTiro 
	^ direccionTiro between: (0@0) and: (2@2) ! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 15:39:16'!
remateAlturaMedia: direccionTiro 
	
	direccionRemateResultante := (direccionTiro x)@1! !

!Penales methodsFor: 'assertions' stamp: 't 5/3/2025 16:07:04'!
remateSumaDosAltura: direccionTiro 
	direccionRemateResultante := (direccionTiro x)@((direccionTiro y)+2)! !


!Penales methodsFor: 'accessing' stamp: 't 5/3/2025 13:13:31'!
puntajeDeArquero
	^puntajeDeArquero! !

!Penales methodsFor: 'accessing' stamp: 't 5/3/2025 13:12:28'!
puntajeDeDelantero
	^puntajeDeDelantero! !

!Penales methodsFor: 'accessing' stamp: 't 5/3/2025 13:30:49'!
varDireccionRemateResultante
	^direccionRemateResultante! !

!Penales methodsFor: 'accessing' stamp: 't 5/3/2025 14:45:42'!
varFuerzaResultanteDeAtajada
	^ fuerzaResultanteDeAtajada ! !

!Penales methodsFor: 'accessing' stamp: 't 5/3/2025 13:42:06'!
varFuerzaResultanteDeTiro
	^ fuerzaResultanteDeTiro! !


!Penales methodsFor: 'penales' stamp: 't 5/3/2025 14:44:16'!
recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroQueEligeAntesDeTiroHacia: direccionArquero 
	
	"aumenta 50% fuerza arquero"
	fuerzaResultanteDeAtajada := (arquero fuerza ) * 1.5.
	fuerzaResultanteDeTiro := delantero fuerza.
	
	self assertDireccionesEnRangoDiferentesTiroA: direccionTiro yAtajadaA: direccionArquero ! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 14:59:34'!
recibeJabulaniDeDelanteroAColocarHacia: direccionTiro conArqueroQueEsperaYSeAdelantaHacia: direccionArquero 
	
	"ignora el arquero la 2da coordenada"
	|direccionAtajada|
	direccionAtajada := (direccionArquero x) @ (direccionTiro  y).
	
	fuerzaResultanteDeTiro := delantero fuerza.
	fuerzaResultanteDeAtajada := arquero fuerza.
	
	self assertDireccionesEnRangoDiferentesTiroA: direccionTiro yAtajadaA: direccionAtajada ! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 16:01:02'!
recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroQueEligeAntesDeTiroHacia: direccionArquero 
	
	"como tira a matar, tenemos que chequear los ángulos"
	(self assertDelanteroPateaAlAngulo: direccionTiro ) ifTrue: [self remateAlturaMedia:direccionTiro ] ifFalse: [direccionRemateResultante := direccionTiro ].
	
	"también se modifica la direccion del arquero"
	direccionArqueroResultante := (direccionArquero x)@(direccionRemateResultante y).
	
	"si es jabulani gana 20%"
	fuerzaResultanteDeTiro := (delantero fuerza) * 1.2.
	fuerzaResultanteDeAtajada := arquero fuerza.
	
	self assertDireccionesEnRangoDiferentesTiroA: direccionRemateResultante yAtajadaA: direccionArqueroResultante ! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 16:03:15'!
recibeJabulaniDeDelanteroAMatarHacia: direccionTiro conArqueroQueEsperaYSeAdelantaHacia: direccionArquero 
	
	direccionRemateResultante := direccionTiro .
	
	"siempre pierde el arquero"
	puntajeDeDelantero := 1! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 15:23:33'!
recibePlayeraAColocarHacia: direccionTiro conDireccionArqueroQueEligeAntesDeTiro: direccionArquero 
	
	fuerzaResultanteDeTiro := (delantero fuerza) * 0.8.
	fuerzaResultanteDeAtajada := (arquero fuerza ) * 2.
	
	self assertDireccionesEnRangoDiferentesTiroA: direccionTiro yAtajadaA: direccionArquero ! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 15:25:56'!
recibePlayeraAColocarHacia: direccionTiro conDireccionArqueroQueEsperaYSeAdelanta: direccionArquero 
	
	"el var siempre lo atrapa"
	direccionRemateResultante := direccionTiro.
	puntajeDeDelantero := 1! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 16:18:16'!
recibePlayeraAMatarHacia: direccionTiro conDireccionArqueroQueEligeAntesDeTiro: direccionArquero 
	
	"como tira a matar, tenemos que chequear los ángulos. Si va al ángulo queda en zona media, sino, suma 2 de altura"
	(self assertDelanteroPateaAlAngulo: direccionTiro ) ifTrue: [self remateAlturaMedia:direccionTiro. ] ifFalse: [self remateSumaDosAltura: direccionTiro ].
	
	self arqueroIgnoraAncho: direccionArquero .
	
	fuerzaResultanteDeTiro := delantero fuerza.
	fuerzaResultanteDeAtajada := arquero fuerza.
	
	self assertDireccionesEnRangoDiferentesTiroA: direccionRemateResultante yAtajadaA: direccionArqueroResultante ! !

!Penales methodsFor: 'penales' stamp: 't 5/3/2025 16:22:54'!
recibePlayeraAMatarHacia: direccionTiro conDireccionArqueroQueEsperaYSeAdelanta: direccionArquero 
	
	(self assertDelanteroPateaAlAngulo: direccionTiro ) ifTrue: [self remateAlturaMedia:direccionTiro. ] ifFalse: [self remateSumaDosAltura: direccionTiro ].
	self arqueroIgnoraAncho: direccionArquero .
	
	fuerzaResultanteDeTiro := delantero fuerza.
	fuerzaResultanteDeAtajada := arquero fuerza.
	
	"siempre ataja"
	puntajeDeArquero := 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #'ISW1-2023-2C-Parcial-1'!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 't 5/3/2025 13:06:21'!
conDelantero: delantero yArquero: arquero 
	
	^self new initializeConDelantero: delantero yArquero: arquero ! !
