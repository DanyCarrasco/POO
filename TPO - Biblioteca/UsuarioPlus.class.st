Class {
	#name : #UsuarioPlus,
	#superclass : #Usuario,
	#instVars : [
		'pagoCuota'
	],
	#category : #'TPO - Biblioteca'
}

{ #category : #constructor }
UsuarioPlus class >> crear: unDni yNombre: unNombre yApellido: unApellido yContrasenia: unaContrasenia [

	| unUsuario |
	unUsuario := super
		             crear: unDni
		             yNombre: unNombre
		             yApellido: unApellido
		             yContrasenia: unaContrasenia.
	unUsuario iniciar.
	^ unUsuario
]

{ #category : #propios }
UsuarioPlus >> esUsuarioPlus [

	^ true.
]

{ #category : #propios }
UsuarioPlus >> getPagoCuota [

	^ pagoCuota .
]

{ #category : #initialization }
UsuarioPlus >> iniciar [
pagoCuota := false.
]

{ #category : #propios }
UsuarioPlus >> registrarPagoCuota [
pagoCuota := true.
]
