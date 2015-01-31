(function( $ ) {
    $.widget("little2.dashpanel", {
    	container:null,
    	dialogID:null,
        version: "1.0.0",
        options: {
        	save:function(event){
        		var formContainer=$(event.target).parentsUntil('div.labDiv').parent();	        		
				var o = {
						data: $("#formPost",formContainer).serialize(),
						url:this.save_url,
						element_id:this.element_id,
						onSuccess:function(data){		
								var container =$('#container_'+this.element_id);
								var datafrom=container.attr('data-from')	
								
								if ($("#"+datafrom).length > 0) {
									$("#"+datafrom).jqGrid().trigger("reloadGrid");
								}
								else
								{
									$("#tabPanel").refreshitem();	
								}
								
								
								
								
								var dialogID=$(event.target).parentsUntil('div.ui-dialog').last().attr('id');		
								closeDialog(dialogID);							
							}					
				}				
				var msg=mypost(o);			
        	},
        	save_url:'',
        	element_id:''
        },
       
        
        /*当widget被创建的时候，这两个方法都会被创建，而当页面再次调用widget方法的时候，则只执行_init方法*/
        _create: function(){
        	this.container = this.element; // 加入這行，並將以下表示 div#mytab 的 this 改為 container
        	var that = this;
        	
        	
        	if ($("#bt_save",this.container).length <= 0) 
        	{
        		//不存在則新增
        		$('div.uc2',this.container).append('<input class="labButton" name="bt_save" id="bt_save" type="button"  value="保存"   />');
        	}
       

        	
        	this._on( $('#bt_save', this.container), {
    			  "click": this.save
    			});        	
        	
        	if ($("#bt_cancel",this.container).length <= 0) 
        	{
        		//不存在則新增
        		$('div.uc2',this.container).append('<input class="labButton" name="bt_cancel"  id="bt_cancel" type="button"  value="關閉" />		');
        	}
        	
        	this._on( $('#bt_cancel', this.container), {
  			  "click": this.bt_cancel
  			});
 
        	
        	this.dialogID=$(this.container).parentsUntil('div.ui-dialog').last().attr('id');    
        	

        	
        	
        	//新增按鈕
        	/*
        	 * 			<input class="labButton" name="bt_finish" id="bt_finish" type="button"  value="保存"/>
			<input class="labButton" name="bt_cancel"  id="bt_cancel" type="button"  value="關閉"/>	
        	 */
        	
        	
        },     
     


     
        
  	  //--- Private Function ---//
  	  
  	  

  	  
  	  //--- Public Function ---//    	 
        bt_cancel:function(event)
        { 
        	//var did=$(this.container).parentsUntil('div.ui-dialog').last().attr('id');    
        	closeDialog(this.dialogID);
        },
        
        save:function(event)
        {
        	this.options.save(event);
        	//alert('ori');
        }
        
    })
})( jQuery );