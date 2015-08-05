(function( $ ) {
    $.widget("little2.dashpanel", {
    	container:null,
    	dialogID:null,
        version: "1.0.0",      
        options: {
        	check_before_save:function(){return true},
        	trigger_element:'',
        	save:function(event){        		
        		if(!this.check_before_save())
        		{        			
        			return false;
        		}        		
        		
        		var formContainer=$(event.target).parentsUntil('div.labDiv').parent();	     
        		
				var o = {
						data: $("#formPost",formContainer).serialize(),
						url:this.save_url,
						element_id:this.element_id,
						close_after_save:this.close_after_save,
						trigger_element:this.trigger_element,
						onSuccess:function(data)
							{		
								var container =$('#container_'+this.element_id);
								if(data.errmsg)
								{
									$(container).message(data.errmsg);
								}
								else
								{									
									var datafrom=container.attr('data-from');	
									
									var index;	
									for (index = 0; index < this.trigger_element.length; ++index) {		
										var obj="#"+this.trigger_element[index];										
										if (obj.length > 0) {										
											$(obj).jqGrid().trigger("reloadGrid");											
										}
									}
									
									
									if ($("#"+datafrom).length > 0) {
										$("#"+datafrom).jqGrid().trigger("reloadGrid");
									}
									else
									{
										$("#tabPanel").refreshitem();	
									}
									var dialogID=$(event.target).parentsUntil('div.ui-dialog').last().attr('id');
									
									if(this.close_after_save)
									{
										closeDialog(dialogID);		
									}
													
								}										
							}					
				}				
				var msg=mypost(o);			
        	},
        	pick:function(event){
        		var url=this.pick_url;
        
            	var sels = $("#" +  this.pick_list_id).jqGrid('getGridParam', 'selarrrow');        
        		var len = (sels.length);
   		
        		
        		if (sels) {
        			
        			if(len>0)
        			{
        			
        				for ( var i = 0; i < len; i++) {
        					var rowdata = $("#" + this.pick_list_id).jqGrid("getRowData", sels[i]);
                			if (url.indexOf('?') > -1) {
        	        			url += '&';
        	        		} else {
        	        			url += '?';
        	        		}	
        					url += 'keys['+rowdata.key+']=' + rowdata.key;
        				}
        			}
        			else
        			{
 
                		sels = $("#" + this.pick_list_id).jqGrid('getGridParam', 'selrow');	
                		if (sels)
                		{
	                		len = (sels.length);
	            		   
	        				if(len>0)
	        				{
		            			if (url.indexOf('?') > -1) {
		    	        			url += '&';
		    	        		} else {
		    	        			url += '?';
		    	        		}	
		        				
		        				var rowdata = $("#" +  this.pick_list_id).jqGrid("getRowData", sels[0]);
		        				console.log(rowdata)
		    	        		url += "entity.key=" + rowdata.key;
	        				}
                		}
        			}
        		
        		}        	
        		
        		this.save_url=url;
        		return this.save(event);
        	},        	
        	search:function(event){
        		var formContainer=$(event.target).parentsUntil('div.labDiv').parent();	        	        	
        		$("#" + this.pick_list_id).jqGrid('setGridParam', {				
        					postData : $("#formPost",formContainer).serialize(),
        					page : 1
        				}).trigger("reloadGrid");	
        	},
        	save_url:'undefined',
        	close_after_save:true,
        	pick_url:'undefined',
        	pick_list_id:'',
        	element_id:'',
        	dialog_title:'',
        },
       
        
        /*当widget被创建的时候，这两个方法都会被创建，而当页面再次调用widget方法的时候，则只执行_init方法*/
        _create: function(){
        	this.container = this.element; // 加入這行，並將以下表示 div#mytab 的 this 改為 container
        	var that = this;       	
        	
        	if ($("#bt_save",this.container).length <= 0  && this.options.save_url !='undefined') 
        	{        		
        		//不存在則新增
        		$('div.uc2',this.container).append('<input class="labButton" name="bt_save" id="bt_save" type="button"  value="保存"   />');
        	}
       
        	if ($("#bt_pick",this.container).length <= 0  && this.options.pick_url !='undefined') 
        	{        	
        		//不存在則新增
        		$('div.uc2',this.container).append('<input class="labButton" name="bt_pick" id="bt_pick" type="button"  value="挑選"   />');
        	}
        	
        	this._on( $('#bt_save', this.container), {
    			  "click": this.save
    			});        	
        	
        	this._on( $('#bt_pick', this.container), {
  			  "click": this.pick
  			});        	
        	

        	this._on( $('#bt_inner_search', this.container), {
    			  "click": this.search
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
        	
        	this.modify_dialog_title();
        	
        	
        },     
     


     
        
  	  //--- Private Function ---//
  	  
  	  

  	  
  	  //--- Public Function ---//    	 
        modify_dialog_title:function()
        {
        	this.labelledby=$(this.container).parentsUntil('div.ui-dialog').parent().attr('aria-labelledby');
        	
        	//dialog_cache
        
        	var dialog_title=null;
        	if(this.options.dialog_title.length>0)
        	{        		
        		dialog_title=' : '+this.options.dialog_title;
        		$(this.container).parentsUntil('div.ui-dialog').attr('data-dialogidtitle',dialog_title);
        		/*
        		if($('#'+this.labelledby).text().indexOf(dialog_title)<0)
        		{
        			$('#'+this.labelledby).append(dialog_title);       
        		}
        		 */ 	
        	}
        	else if( typeof($('#DialogTitle',$(this.container)).val())!="undefined" && $('#DialogTitle',$(this.container)).val()!="" )
        	{        		
        		$('#'+this.labelledby).append(' : '+$('#DialogTitle',$(this.container)).val());            	
        	}        	
        	
    		//##Diglog Cache
        	/*
        	var datafrom=$('#container_'+this.options.element_id).attr('data-from');        	
        	var dig_id="dig_"+this.options.element_id;        	
        	console.log('ItemID-EDIT:'+this.options.element_id);
        	console.log('FromListID:'+datafrom);	 		
        	
        	var dig_cache=$('#dialog_cache');
        	
        	if ($('#'+dig_id,$(dig_cache)).length <= 0 ) 
        	{      
        		$(dig_cache).append('<div id="'+dig_id+'">'+$('#'+this.labelledby).text()+'</div>')
        		//$('#'+this.labelledby).prepend($(dig_cache).text());
        	}
        	else
        	{
        		$('#'+dig_id).text($('#'+this.labelledby).text())
        	}
        	
        		
        	//$(dig_cache).text($('#'+this.labelledby).text());
        	//console.log($(dig_cache).text());
        	//<div  id="container_{elementID}"  data-from="{From_elementID}" >
        	*/
        },
        
        
        bt_cancel:function(event)
        { 
        	//var did=$(this.container).parentsUntil('div.ui-dialog').last().attr('id');    
        	closeDialog(this.dialogID);
        },
        
        save:function(event)
        {
        	this.options.save(event);
        	//alert('ori');
        },
        
        pick:function(event)
        {
        	this.options.pick(event);
        	//alert('ori');
        },
        
        search:function(event)
        {
        	this.options.search(event);
        },
        
    })
})( jQuery );