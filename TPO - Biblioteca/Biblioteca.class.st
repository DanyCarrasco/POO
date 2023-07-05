Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'id',
		'direccion',
		'telefono',
		'nomRepresentante',
		'cantDiasPrestamo',
		'colPrestamos',
		'colLibros'
	],
	#category : #'TPO - Biblioteca'
}

{ #category : #constructor }
Biblioteca class >> crear: unId yDireccion: unaDireccion yTelefono: unTelefono yNomRepresentante: unNombre yCantDiasPrestamo: unaCantidad [
|unaBiblioteca|
unaBiblioteca := self new.
unaBiblioteca iniciar: unId  yDireccion: unaDireccion  yTelefono: unTelefono  yNomRepresentante: unNombre  yCantDiasPrestamo: unaCantidad .
^unaBiblioteca .
]

{ #category : #propios }
Biblioteca >> agregarLibro: unLibro [
colLibros add: unLibro .
]

{ #category : #propios }
Biblioteca >> agregarPrestamo: unPrestamo [
colPrestamos add: unPrestamo .
]

{ #category : #propios }
Biblioteca >> buscarAudiolibros: unaColLibros [

	| colAudiolibros  |
	colAudiolibros := unaColLibros collect: [ :libro| libro verificarAudiolibro . ].
	^colAudiolibros .
]

{ #category : #propios }
Biblioteca >> buscarPrestamoDe: unUsuario [

	| suPrestamo |
	colPrestamos do: [ :prestamo | 
		(prestamo verificarPrestamoDe: unUsuario) ifTrue: [ 
			suPrestamo := prestamo ] ].
	^ suPrestamo.
]

{ #category : #propios }
Biblioteca >> devolverPrestamo: unUsuario [

	| cadena prestamoUsuario |
	cadena := 'No se pudo registrar la devolucion del prestamo'.
	prestamoUsuario := self buscarPrestamoDe: unUsuario.
	(prestamoUsuario isNotNil) ifTrue: [ prestamoUsuario registrarDevolucion . cadena:= 'Se pudo registrar la devolucion del prestamo'. ].
	^cadena .
	
]

{ #category : #propios }
Biblioteca >> encontrarPrestamoDe: unUsuario [

	| encontrado |
	encontrado := false.
	colPrestamos do: [ :prestamo | 
		(prestamo verificarPrestamoDe: unUsuario) ifTrue: [ 
			encontrado := true ] ].
	^ encontrado
]

{ #category : #getters }
Biblioteca >> getCantDiasPrestamo [
^cantDiasPrestamo .
]

{ #category : #getters }
Biblioteca >> getDireccion [
^direccion.
]

{ #category : #getters }
Biblioteca >> getId [
^id.
]

{ #category : #getters }
Biblioteca >> getNomRepresentante [
^nomRepresentante .
]

{ #category : #getters }
Biblioteca >> getTelefono [
^telefono .
]

{ #category : #initialization }
Biblioteca >> iniciar: unId yDireccion: unaDireccion yTelefono: unTelefono yNomRepresentante: unNombre yCantDiasPrestamo: unaCantidad [

	id := unId.
	direccion := unaDireccion.
	telefono := unTelefono.
	nomRepresentante := unNombre.
	cantDiasPrestamo := unaCantidad.
	colPrestamos := Prestamo .
	colPrestamos :=OrderedCollection new.
	colLibros := Libro .
	colLibros := OrderedCollection new.
]

{ #category : #propios }
Biblioteca >> obtenerIdYUsuariosRegistrados [

	| cadena unaCantDias |
	cadena := 'Biblioteca ' , self getId asString , ':
'.
	unaCantDias := self getCantDiasPrestamo.
	colPrestamos do: [ :prestamo | 
		(prestamo verificarRetraso: unaCantDias) ifTrue: [ 
			cadena := cadena , prestamo toStringElUsuario ] ].
	^ cadena
]

{ #category : #propios }
Biblioteca >> registrarDosPrestamos: unUsuario con: unaColLibros y: colAudioLibro [

	| prestamoPlus |
	self registrarUnPrestamo: unUsuario con: unaColLibros.
	prestamoPlus := Prestamo crear: unUsuario  yColLibros: colAudioLibro .
	self agregarPrestamo: prestamoPlus .
	^prestamoPlus verificarPagoDeCuotaDelUsuario .
]

{ #category : #propios }
Biblioteca >> registrarPrestamo: unUsuario con: unaColLibros [

	| cadena colAudiolibros |
	colAudiolibros := OrderedCollection new.
	cadena := 'No se pudo registrar el prestamo'.
	(self buscarPrestamoDe: unUsuario) ifFalse: [ 
		cadena := 'Se pudo registrar el prestamo'.
		colAudiolibros := self buscarAudiolibros: unaColLibros ].
	colAudiolibros
		ifNotEmpty: [ 
			cadena := (self
				           registrarDosPrestamos: unUsuario
				           con: unaColLibros
				           y: colAudiolibros)
				          ifTrue: [ cadena , ', ha pagado la cuota del mes' ]
				          ifFalse: [ cadena , ', no ha pagado la cuota del mes' ] ]
		ifEmpty: [ self registrarUnPrestamo: unUsuario con: unaColLibros ].
	^ cadena
]

{ #category : #propios }
Biblioteca >> registrarUnPrestamo: unUsuario con: unaColLibros [

	self agregarPrestamo:
		(Prestamo crear: unUsuario yColLibros: unaColLibros)
]

{ #category : #settings }
Biblioteca >> setCantDiasPrestamo: unaCantidad [

	cantDiasPrestamo := unaCantidad
]

{ #category : #settings }
Biblioteca >> setDireccion: unaDireccion [
direccion := unaDireccion .
]

{ #category : #settings }
Biblioteca >> setNomRepresentante: unNombre [
nomRepresentante := unNombre .
]

{ #category : #settings }
Biblioteca >> setTelefono: unTelefono [
telefono := unTelefono .
]
