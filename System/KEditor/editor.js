		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="a_content"]', {
				cssPath : 'Keditor/plugins/code/prettify.css',
				uploadJson : 'Keditor/asp/upload_json.asp',
				fileManagerJson : 'Keditor/asp/file_manager_json.asp',
				allowFileManager : false,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});