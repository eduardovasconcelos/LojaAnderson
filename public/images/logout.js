if(typeof(loc)=="undefined"||loc==""){var loc="";if(document.body&&document.body.innerHTML){var tt=document.body.innerHTML.toLowerCase();var last=tt.indexOf("logout.js\"");if(last>0){var first=tt.lastIndexOf("\"",last);if(first>0&&first<last)loc=document.body.innerHTML.substr(first+1,last-first-1);}}}

var bd=0
document.write("<style type=\"text/css\">");
document.write("\n<!--\n");
document.write(".logout_menu {border-color:#000000;border-style:solid;border-width:"+bd+"px 0px "+bd+"px 0px;background-color:#847b69;position:absolute;left:0px;top:0px;visibility:hidden;}");
document.write("a.logout_plain:link, a.logout_plain:visited{text-align:left;background-color:#847b69;color:#ffffff;text-decoration:none;border-color:#000000;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:10pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("a.logout_plain:hover, a.logout_plain:active{background-color:#b5ff00;color:#000000;text-decoration:none;border-color:#000000;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:10pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("\n-->\n");
document.write("</style>");

var fc=0x000000;
var bc=0xb5ff00;
if(typeof(frames)=="undefined"){var frames=0;}

startMainMenu("logout_left.gif",21,6,2,0,0)
mainMenuItem("logout_b1",".gif",21,68,"javascript:;","","Logout",2,2,"logout_plain");
endMainMenu("logout_right.gif",21,6)

startSubmenu("logout_b1","logout_menu",68);
submenuItem("---","javascript:;","","logout_plain");
endSubmenu("logout_b1");

loc="";
