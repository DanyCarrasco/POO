Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido'
	],
	#category : #'TPO - Biblioteca'
}

{ #category : #constructor }
Autor class >> crear: unNombre yApellido: unApellido [
|unAutor|
unAutor := self new.
unAutor iniciar: unNombre YApellido: unApellido .
^unAutor .
]

{ #category : #getters }
Autor >> getApellido [
^	apellido.
]

{ #category : #getters }
Autor >> getNombre [
^nombre .
]

{ #category : #initialization }
Autor >> iniciar: unNombre YApellido: unApellido [
nombre := unNombre .
apellido := unApellido .
]

{ #category : #settings }
Autor >> setApellido: unApellido [

	apellido := unApellido
]

{ #category : #settings }
Autor >> setNombre: unNombre [
nombre := unNombre .
]

{ #category : #propios }
Autor >> toString [

	^ 'Nombre del autor: ' , self getNombre , ', apellido: '
	  , self getApellido.
]
