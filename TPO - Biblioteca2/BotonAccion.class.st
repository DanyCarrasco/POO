Class {
	#name : #BotonAccion,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque',
		'bloqueAccion'
	],
	#category : #'TPO - Biblioteca2'
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
