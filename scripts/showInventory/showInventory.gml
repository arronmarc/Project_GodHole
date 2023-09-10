function showInventory(){

obj_Game.paused = UI.exists("InventoryPanel");

var _panel = new UIPanel("Example", 20, 40, 400, 300, grey_panel);
var _button = _panel.add(new UIButton("TestButton", 0, -60, 300, 50, "Button", blue_button00, UI_RELATIVE_TO.BOTTOM_CENTER));
_panel.setCloseButtonSprite(green_cross);
_panel.setResizable(false);

with (_button) {
	setTextFormat("[C_black]");
	setSpriteMouseover(blue_button01);
	setTextFormatMouseover("[c_white]");
	
	setCallback(UI_EVENT.LEFT_RELEASE, function() {
		if (!UI.exists("Popup")) gooey_popup_panel();
	});
}

}

function gooey_popup_panel() {
	var _panel = new UIPanel("Popup", 0, 0, 350, 350, grey_panel, UI_RELATIVE_TO.MIDDLE_CENTER);
	_panel.setCloseButtonSprite(green_cross).setModal(true);
}