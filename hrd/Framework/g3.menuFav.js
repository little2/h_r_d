/**
 * 收藏菜单
 * 
 * @param menuCode
 */
function saveFav(menuCode) {
	var img1 = document.getElementById("image1");
	if (isSaved) {
		img1.src = "detail_fav.png";
		g3Alert("取消收藏");
		setTimeout(function() {
			ymPrompt.close()
		}, 600);
		isSaved = false;
	} else {
		img1.src = "detail_fav_light.png";
		g3Alert("成功收藏");
		setTimeout(function() {
			ymPrompt.close()
		}, 600);
		isSaved = true;
	}
}

