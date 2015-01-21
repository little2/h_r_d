(function( $ ) {
    $.widget("little2.dashpanel", {
    	container:null,
    	dialogID:null,
        version: "1.0.0",
        options: {
        	save:function(event){}
        },
       
        
        /*当widget被创建的时候，这两个方法都会被创建，而当页面再次调用widget方法的时候，则只执行_init方法*/
        _create: function(){
        	this.container = this.element; // 加入這行，並將以下表示 div#mytab 的 this 改為 container
        	var that = this;
        	
        	//$('.bt_cancel', container).bind('click', this, this.bt_cancel);    	
    		
        	this._on( $('#bt_cancel', this.container), {
  			  "click": this.bt_cancel
  			});
 
        	this._on( $('#bt_save', this.container), {
    			  "click": this.save
    			});        	
        	
        	this.dialogID=$(this.container).parentsUntil('div.ui-dialog').last().attr('id');    
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