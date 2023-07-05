Class {
	#name : #BotonAccion,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque',
		'bloqueAccion'
	],
	#category : #'TPO - Biblioteca'
}

{ #category : #propios }
BotonAccion >> mouseAction: unBloque [
bloqueAccion := unBloque.
]

{ #category : #propios }
BotonAccion >> mouseUp: unEvento [
super mouseUp: unEvento.
bloqueAccion value.
]
