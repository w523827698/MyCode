
// 自定义的校验器
$.extend($.fn.validatebox.defaults.rules, {   
		midLength: {   
	 			validator: function(value, param){   
								return value.length >= param[0] && value.length <= param[1];    
				},   
				message: ''  
		} ,
		equalLength : {
	 			validator: function(value, param){   
								return value.length == param[0];    
				},   
				message: '密码必须为4个字符!'  
		}
}); 



$.extend($.fn.datagrid.defaults.editors, {   
    datetimebox: {   
        init: function(container, options){   
            var box = $('<input />').appendTo(container);   
            box.datetimebox(options);
            return box;   
        },   
        getValue: function(target){   
            return $(target).datetimebox('getValue');   
        },   
        setValue: function(target, value){   
            $(target).datetimebox('setValue',value);
        },   
        resize: function(target, width){   
            var box = $(target);   
			box.datetimebox('resize' , width);
        } ,
        destroy:function(target){
        	$(target).datetimebox('destroy');
        }
    }   
});  

/** 
 * 扩展combox验证，easyui原始只验证select text的值，不支持value验证 
 */  
$.extend($.fn.validatebox.defaults.rules, {  
    comboxValidate : {  
        validator : function(value, param,missingMessage) {  
            if($('#'+param).combobox('getValue')!='' && $('#'+param).combobox('getValue')!=null){  
                return true;  
            }  
            return false;  
        },  
        message : "{1}"  
    }  
});  





