/**
 * 简单提示框，自动关闭
 * 
 * @param msg
 */
function g3Alert(msg) {
	ymPrompt.win({
		message : "<br/><center>" + msg + "</center>",
		showMask : false,
		titleBar : false,
		btn : [],
		width : 100,
		height : 45
	});
	setTimeout(function() {
		ymPrompt.close()
	}, 600);
}