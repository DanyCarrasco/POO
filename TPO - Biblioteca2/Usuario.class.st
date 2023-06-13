Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'dni',
		'nombre',
		'apellido',
		'contrasenia',
		'colBibliotecas'
	],
	#category : #'TPO - Biblioteca2'
}

{ #category : #constructor }
Usuario class >> crear:unDni yNombre: unNombre yApellido: unApellido yContrasenia: unaContrasenia [
|unUsuario|
unUsuario := self new.
unUsuario iniciar: unDni yNombre: unNombre yApellido: unApellido yContrasenia: unaContrasenia.
^unUsuario .
]

{ #category : #propios }
Usuario >> esIgualA: unUsuario [
^dni = (unUsuario getDni ).
]

{ #category : #getters }
Usuario >> getApellido [ 
^apellido.
]

{ #category : #getters }
Usuario >> getDni [
^dni.
]

{ #category : #getters }
Usuario >> getNombre [ 
^nombre .
]

{ #category : #propios }
Usuario >> getPagoCuota [
^false.
]

{ #category : #initialization }
Usuario >> iniciar: unDni yNombre: unNombre yApellido: unApellido yContrasenia: unaContrasenia [

	dni := unDni.
	nombre := unNombre.
	apellido := unApellido.
	contrasenia := unaContrasenia .
	colBibliotecas := Biblioteca.
	colBibliotecas := OrderedCollection new
]

{ #category : #settings }
Usuario >> setApellido: unApellido [
apellido := unApellido .
]

{ #category : #settings }
Usuario >> setContrasenia: unaContrasenia [

	contrasenia := unaContrasenia
]

{ #category : #settings }
Usuario >> setNombre: unNombre [
nombre := unNombre .
]

{ #category : #propios }
Usuario >> toString [ 
^'Dni del usuario: ', self getDni asString, ', nombre: ', self getNombre , ', apellido: ', self getApellido .
]
