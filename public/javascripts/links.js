if(typeof(loc)=="undefined"||loc==""){var loc="";if(document.body&&document.body.innerHTML){var tt=document.body.innerHTML.toLowerCase();var last=tt.indexOf("links.js\"");if(last>0){var first=tt.lastIndexOf("\"",last);if(first>0&&first<last)loc=document.body.innerHTML.substr(first+1,last-first-1);}}}

var bd=0
document.write("<style type=\"text/css\">");
document.write("\n<!--\n");
document.write(".links_menu {border-color:#000000;border-style:solid;border-width:"+bd+"px 0px "+bd+"px 0px;background-color:#a5d0e4;position:absolute;left:0px;top:0px;visibility:hidden;}");
document.write("a.links_plain:link, a.links_plain:visited{text-align:left;background-color:#a5d0e4;color:#000000;text-decoration:none;border-color:#000000;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:10pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("a.links_plain:hover, a.links_plain:active{background-color:#cfdfe4;color:#000000;text-decoration:none;border-color:#000000;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:10pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("\n-->\n");
document.write("</style>");

var fc=0x000000;
var bc=0xcfdfe4;
if(typeof(frames)=="undefined"){var frames=0;}

startMainMenu("",0,0,2,0,0)
mainMenuItem("links_b1",".gif",22,102,"javascript:;","","Clientes",2,2,"links_plain");
mainMenuItem("links_b2",".gif",22,102,"javascript:;","","Pedidos",2,2,"links_plain");
mainMenuItem("links_b3",".gif",22,102,"javascript:;","","Produtos",2,2,"links_plain");
mainMenuItem("links_b4",".gif",22,102,"javascript:;","","Contabilidade",2,2,"links_plain");
mainMenuItem("links_b5",".gif",22,102,"javascript:;","","Users",2,2,"links_plain");
mainMenuItem("links_b6",".gif",22,102,"javascript:;","","Login",2,2,"links_plain");
mainMenuItem("links_b7",".gif",22,102,"javascript:;","","Logout",2,2,"links_plain");
endMainMenu("",0,0);

startSubmenu("links_b1","links_menu",102);
submenuItem("---","javascript:;","","links_plain");
endSubmenu("links_b1");

loc="";
