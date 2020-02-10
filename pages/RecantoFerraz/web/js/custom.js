$(document).ready(function(){
	$('#celular').mask('(00) 0000-00009');
	$('#celular').blur(function(event){
		if ($(this).val().length == 15){
			$('#celular').mask('(00) 00000-0009');
		}else{
			$('#celular').mask('(00) 0000-00009');
		}
	})
	jQuery.validator.addMethod("hashtagNoInicio",function(value, element){
		if (value.indexOf("#") == 0){
			return true
		}else{
			return false
		}
	},"Por favor, forneça a hashtag com # no início.")
	$("#formCadastro").validate({
		rules:{
			nome:{
				required: true,
				maxlength: 100,
				minlength: 10
			},
			email:{
				required: true,
				email: true
			},
			hashtag:{
				hashtagNoInicio: true
			},
			mensagem:{
				maxlength: 200
			}
		},
		submitHandler: function confirmacao(){
			$.notify({
				message: 'Pedido enviado com sucesso' 
			},{
				type: 'success'
			})
			return false
		}
	})
})