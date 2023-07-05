Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'bibliotecas',
		'usuarios',
		'autores'
	],
	#category : #'TPO - Biblioteca'
}

{ #category : #constructor }
Sistema class >> crear [
|unSistema|
unSistema := self new.
unSistema iniciar .
^unSistema .
]

{ #category : #propios }
Sistema >> agregarAutor: unAutor [
autores add: unAutor .
]

{ #category : #propios }
Sistema >> agregarBiblioteca: unaBiblioteca [
bibliotecas add: unaBiblioteca .
]

{ #category : #propios }
Sistema >> agregarUsuarios: unUsuario [
usuarios add: unUsuario .
]

{ #category : #propios }
Sistema >> generarListadoUsuariosRetrasados [

	| listaUsuariosRetrasados |
	listaUsuariosRetrasados := bibliotecas collect: [ :biblioteca |
			biblioteca obtenerIdYUsuariosRegistrados ].
	^ listaUsuariosRetrasados
]

{ #category : #initialization }
Sistema >> iniciar [
bibliotecas := Biblioteca .
bibliotecas := OrderedCollection new.
usuarios:= Usuario.
usuarios := OrderedCollection new.
autores := Autor .
autores := OrderedCollection new.
]
