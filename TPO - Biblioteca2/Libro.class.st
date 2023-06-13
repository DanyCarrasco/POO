Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'tipo',
		'nombre',
		'editorial',
		'anioEdicion',
		'colAutores'
	],
	#category : #'TPO - Biblioteca2'
}

{ #category : #constructor }
Libro class >> crear: unTipo yNombre: unNombre yEditorial: unaEditorial yAnioEdicion: unAnio [
|unLibro|
unLibro := self new.
unLibro iniciar: unTipo  yNombre: unNombre  yEditorial: unaEditorial  yAnioEdicion: unAnio .
^unLibro .
]

{ #category : #propios }
Libro >> agregarAutor: unAutor [
colAutores add: unAutor 
]

{ #category : #getters }
Libro >> getAnioEdicion [
^anioEdicion .
]

{ #category : #getters }
Libro >> getEditorial [
^editorial .
]

{ #category : #getters }
Libro >> getNombre [ 
^nombre .
]

{ #category : #getters }
Libro >> getTipo [
^tipo.
]

{ #category : #initialization }
Libro >> iniciar: unTipo yNombre: unNombre yEditorial: unaEditorial yAnioEdicion: unAnio [

	tipo := unTipo.
	nombre := unNombre.
	editorial := unaEditorial.
	anioEdicion := unAnio.
		colAutores := Autor.
	colAutores := OrderedCollection new.
]

{ #category : #settings }
Libro >> setAnioEdicion: unAnio [
anioEdicion := unAnio .
]

{ #category : #settings }
Libro >> setEditorial: unaEditorial [
editorial := unaEditorial .
]

{ #category : #settings }
Libro >> setNombre: unNombre [
nombre:= unNombre .
]

{ #category : #settings }
Libro >> setTipo: unTipo [
tipo := unTipo .
]

{ #category : #propios }
Libro >> toString [

	^ 'Tipo de libro: ' , self getTipo , ', nombre: ' , self getNombre
	  , ' editorial: ' , self getAnioEdicion asString , ', autores: ', self toStringAutores .
]

{ #category : #propios }
Libro >> toStringAutores [

	| cadena |
	cadena := 'No tiene autores'.
	colAutores isNotEmpty ifTrue: [ 
		cadena := '
'.
		colAutores do: [ :autor | 
			cadena := cadena , autor toString , '
' ] ].
	^ cadena
]

{ #category : #propios }
Libro >> verificarAudiolibro [
tipo caseInsensitiveLessOrEqual: 'audiolibro'.
]
