/**
 * http://usejsdoc.org/
 */

ClassicEditor
	.create( document.querySelector( '#editor' ), {
		
		toolbar: {
			items: [
				'heading',
				'|',
				'bold',
				'italic',
				'link',
				'fontColor',
				'fontSize',
				'fontFamily',
				'bulletedList',
				'numberedList',
				'alignment',
				'|',
				'indent',
				'outdent',
				'|',
				'imageUpload',
				'blockQuote',
				'insertTable',
				'mediaEmbed',
				'undo',
				'redo'
			]
		},
		language: 'ko',
		image: {
			toolbar: [
				'imageTextAlternative',
				'imageStyle:full',
				'imageStyle:side'
			]
		},
		table: {
			contentToolbar: [
				'tableColumn',
				'tableRow',
				'mergeTableCells',
				'tableCellProperties',
				'tableProperties'
			]
		},
		licenseKey: '',
	} )
	.then( editor => {
		window.editor = editor;
	} )
	.catch( error => {
		console.error( error );
	} );
	
	$('#registerForm').bind('submit', function() {
		const editorData = editor.getData();
		send_to_server(editorData);
		return false;
	});
	
	function send_to_server(data) {
		$.ajax({
			url: "register.product",
			type: "post",
			data: {
					'sId' : $('#id').val(),
					'sNickname' : $('#nick').val(),
					'language' : $('#lang option:selected').val(),
					'sGender' : $('#gen').val(),
					'sAge' : $('#age').val(),
					'className' : $('#cName').val(),
					'classTime' : $('#cTime option:selected').val(),
					'classNum' : $('#cNum').val(),
					'classPlace' : $('#cPlace').val(),
					'classPrice' : $('#cPrice').val(),
					'classData' : data
				},
			dataType: "text",
			success: location.href = "main.product",
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}