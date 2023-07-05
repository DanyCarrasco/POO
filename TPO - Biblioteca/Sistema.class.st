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
Sistema >> agregarBiblioteca: unId Direccion: unaDireccion Telefono: unTelefono NomRepresentante: unNomRepresentante yCantDiasPrestamo: cantDias [
"Se crea una biblioteca nueva con los datos recibidos por parametro y se agrega la biblioteca nueva creada"

	bibliotecas add: (Biblioteca new
			 crear: unId
			 yDireccion: unaDireccion
			 yTelefono: unTelefono
			 yNomRepresentante: unNomRepresentante
			 yCantDiasPrestamo: cantDias)
]

{ #category : #propios }
Sistema >> agregarUsuario: unUsuario [

	usuarios add: unUsuario
]

{ #category : #propios }
Sistema >> agregarUsuario: unDni Nombre: unNombre Apellido: unApellido yContrasenia: unaContrasenia [
"Se crea un Usuario nuevo con los datos recibidos por parametro y se agrega el usuario nuevo creado"

	usuarios add: (Usuario new
			 crear: unDni
			 yNombre: unNombre
			 yApellido: unApellido
			 yContrasenia: unaContrasenia)
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
