Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'fechaEntrega',
		'elUsuario',
		'colLibros'
	],
	#category : #'TPO - Biblioteca2'
}

{ #category : #constructor }
Prestamo class >> crear: unUsuario yColLibros: unaColLibros [
|unPrestamo|
unPrestamo := self new.
unPrestamo iniciar: unUsuario yColLibros: unaColLibros .
^unPrestamo .
]

{ #category : #getters }
Prestamo >> getFecha [
^fecha .
]

{ #category : #getters }
Prestamo >> getUsuario [
^elUsuario  .
]

{ #category : #initialization }
Prestamo >> iniciar: unUsuario yColLibros: unaCol [
fecha := Date today.
elUsuario := unaCol .
colLibros := unaCol.
]

{ #category : #propios }
Prestamo >> registrarDevolucion [
fechaEntrega := Date today .
]

{ #category : #settings }
Prestamo >> setColLibros: unaColLibros [

	colLibros := unaColLibros.
]

{ #category : #settings }
Prestamo >> setElUsuario: unUsuario [
elUsuario := unUsuario .
]

{ #category : #settings }
Prestamo >> setFecha: unaFecha [
fecha := unaFecha .
]

{ #category : #propios }
Prestamo >> toStringElUsuario [
^self getUsuario toString .

]

{ #category : #propios }
Prestamo >> verificarPagoDeCuotaDelUsuario [
^elUsuario getPagoCuota.
]

{ #category : #propios }
Prestamo >> verificarPrestamoDe: unUsuario [
^elUsuario esIgualA: unUsuario .
]

{ #category : #propios }
Prestamo >> verificarRetraso:cantDias [
|cantDiasTranscurridos|
cantDiasTranscurridos := Date today subtractDate: self getFecha .
^cantDias < cantDiasTranscurridos .


]
