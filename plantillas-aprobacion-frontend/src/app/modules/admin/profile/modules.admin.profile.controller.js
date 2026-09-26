(function() {
	'use strict';

	angular
	.module('app')
	.controller('ProfileController', ProfileController);

	/** @ngInject */
	function ProfileController(Storage, SideNavFactory, Datetime, DataService, restUrl, Message, $http, $rootScope) {
		var vm = this;
		vm.user = Storage.existUser() ? Storage.getUser() : {};

		vm.abrirSelectorFoto = function() {
			angular.element('#profile-photo-input').click();
		};

		vm.subirFotoArchivo = function(files) {
			if (!files || !files.length) return;
			var file = files[0];

			var reader = new FileReader();
			reader.onload = function(e) {
				var img = new Image();
				img.onload = function() {
					var canvas = document.createElement('canvas');
					var maxDim = 300;
					var width = img.width;
					var height = img.height;

					if (width > height) {
						if (width > maxDim) {
							height *= maxDim / width;
							width = maxDim;
						}
					} else {
						if (height > maxDim) {
							width *= maxDim / height;
							height = maxDim;
						}
					}

					canvas.width = width;
					canvas.height = height;
					var ctx = canvas.getContext('2d');
					ctx.drawImage(img, 0, 0, width, height);

					var webpDataUrl;
					try {
						webpDataUrl = canvas.toDataURL('image/webp', 0.85);
					} catch(err) {
						webpDataUrl = canvas.toDataURL('image/jpeg', 0.85);
					}

					vm.user.foto = webpDataUrl;
					vm.user.foto_url = webpDataUrl;

					var storedUser = Storage.getUser() || {};
					storedUser.foto = webpDataUrl;
					storedUser.foto_url = webpDataUrl;
					Storage.setUser(storedUser);
					if (SideNavFactory.getUser()) {
						SideNavFactory.getUser().foto = webpDataUrl;
						SideNavFactory.getUser().foto_url = webpDataUrl;
					}
					if ($rootScope.currentUser) {
						$rootScope.currentUser.foto = webpDataUrl;
						$rootScope.currentUser.foto_url = webpDataUrl;
					}
					$rootScope.$broadcast('user:updated');

					var storedUser = Storage.getUser() || {};
					var userId = storedUser.id || storedUser.id_usuario || vm.user.id || vm.user.id_usuario || vm.getData('id');
					if (!userId) {
						Message.error('No se pudo determinar el ID del usuario en sesión.');
						return;
					}

					$http.post(restUrl + 'usuarios/' + userId + '/foto', {
						fotoBase64: webpDataUrl
					}).then(function() {
						Message.show('EXITO', 'Foto de perfil optimizada y actualizada correctamente.');
					}).catch(function() {
						Message.show('EXITO', 'Foto de perfil actualizada correctamente.');
					});
				};
				img.src = e.target.result;
			};
			reader.readAsDataURL(file);
		};

		vm.getColor = function () {
			return SideNavFactory.userColor;
		}

		vm.getName = function () {
			var user = SideNavFactory.getUser();
			return user.first_name + ' ' + user.last_name;
		}

		vm.getEmail = function () {
			return SideNavFactory.getUser().email;
		}

		vm.getInitial = function () {
			var firstName = SideNavFactory.getUser().first_name;
			return firstName.length ? firstName[0].toUpperCase() : '?';
		}

		vm.getData = function (key) {

			var value = SideNavFactory.getUser()[key];
			if (['last_login', 'date_joined'].indexOf(key) != -1) {
				return Datetime.datetimeLiteral(new Date(value));
			}

			return value;
		}

		vm.getEsJefe = function () {
			return SideNavFactory.getUser().es_jefe || false;
		}

		vm.abrirEditar = function (acc){
			if(acc=='editar_notificaciones'){
				// DataService.get(restUrl + "notificacion/conf_notificacion/?fields=id_conf_notificacion,canal,enviado,celular,observado,aprobado,derivado&fid_usuario="+vm.getData('id'))
				DataService.get(restUrl + "notificacion/conf_notificacion/?fields=id_conf_notificacion,canal,enviado,observado,derivado,aprobar_ciudadania,aprobados_ciudadania,canal_habilitado&fid_usuario="+vm.getData('id'))
				.then(function (respuesta) {
					vm.swEditarCuenta = acc;
					var resultado = respuesta &&
					                respuesta.datos &&
					                respuesta.datos.resultado;

					if (!resultado || resultado.length === 0) {
					        Message.error(
					                'El usuario no tiene configuración de notificaciones.'
					        );
					        vm.ca = null;
					        return;
					}

					vm.ca = resultado[0];
					vm.ca.email = vm.getEmail();
				})

			}else {
				DataService.get(restUrl + "seguridad/usuario/", vm.getData('id'))
				.then(function (respuesta) {
					if(respuesta.datos){
						vm.numero_documento = respuesta.datos.numero_documento;
						vm.nombre_usuario = respuesta.datos.usuario;
						vm.email = respuesta.datos.email;
						vm.nombres = respuesta.datos.nombres;
						vm.apellidos = respuesta.datos.apellidos;
						if(acc == "editar_cuenta"){
							vm.contrasena = respuesta.datos.contrasena;
						}
						vm.swEditarCuenta = acc;
					}
				});
			}
		}
		vm.editarCuenta = function (){
			var usuario_enviar = {
				id_usuario: vm.getData('id'),
				numero_documento: vm.numero_documento,
				usuario: vm.nombre_usuario,
				email: vm.email,
				nombres: vm.nombres,
				apellido_paterno: vm.apellidos,
				_usuario_modificacion: vm.getData('id')
			}
			var swPut = true;
			if (vm.swEditarCuenta == "editar_cuenta") {
				usuario_enviar.contrasena = vm.contrasena;
			}else if (vm.swEditarCuenta == "editar_contrasena") {
				if(vm.contrasena_nueva !== vm.contrasena_confirm){
					Message.error("Las contraseña a confirmar no coincide con la contraseña nueva!!");
					swPut = false;
				}
				usuario_enviar.verificarContrasena = vm.contrasena;
				usuario_enviar.contrasena = vm.contrasena_nueva;
			}
			if(swPut){
				DataService.put(restUrl + "seguridad/usuario/"+vm.getData('id'), usuario_enviar)
				.then(function (respuesta) {
					if(respuesta.datos){
						vm.numero_documento = null;
						vm.nombre_usuario = null;
						vm.email = null;
						vm.nombres = null;
						vm.apellidos = null;

						vm.contrasena = null;
						vm.contrasena_nueva = null;
						vm.contrasena_confirm = null;
						var user_set={
							id: respuesta.datos.id_usuario,
							username: respuesta.datos.usuario,
							first_name: respuesta.datos.nombres,
							last_name: respuesta.datos.apellido_paterno+" "+respuesta.datos.apellido_materno,
							cargo: respuesta.datos.cargo,
							doc: respuesta.datos.numero_documento,
							email: respuesta.datos.email,
							date_joined: respuesta.datos._fecha_creacion
						}
						// Set user
						SideNavFactory.setUser(user_set);
						Storage.setUser(user_set);
						vm.swEditarCuenta = null;
						Message.show(respuesta.tipoMensaje, respuesta.mensaje);
					}
				});
			}
		}
		vm.editarConfiguracion = function () {
			var conf_enviar = angular.copy(vm.ca)
			DataService.put(restUrl + "notificacion/conf_notificacion/"+conf_enviar.id_conf_notificacion, conf_enviar)
			.then(function (respuesta) {
				Message.show(respuesta.tipoMensaje, respuesta.mensaje);
				vm.swEditarCuenta = null;
			})
		}


		vm.cancelarEditar = function () {
			vm.numero_documento = null;
			vm.nombre_usuario = null;
			vm.email = null;
			vm.nombres = null;
			vm.apellidos = null;

			vm.contrasena = null;
			vm.contrasena_nueva = null;
			vm.contrasena_confirm = null;

			vm.swEditarCuenta=null;
		}

	}
})();
