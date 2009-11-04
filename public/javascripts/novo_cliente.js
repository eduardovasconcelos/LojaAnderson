if(typeof(loc)=="undefined"||loc==""){var loc="";if(document.body&&document.body.innerHTML){var tt=document.body.innerHTML.toLowerCase();var last=tt.indexOf("novo_cliente.js\"");if(last>0){var first=tt.lastIndexOf("\"",last);if(first>0&&first<last)loc=document.body.innerHTML.substr(first+1,last-first-1);}}}

var bd=0
document.write("<style type=\"text/css\">");
document.write("\n<!--\n");
document.write(".novo_cliente_menu {border-color:#ffffff;border-style:solid;border-width:"+bd+"px 0px "+bd+"px 0px;background-color:#184360;position:absolute;left:0px;top:0px;visibility:hidden;}");
document.write("a.novo_cliente_plain:link, a.novo_cliente_plain:visited{text-align:left;background-color:#184360;color:#ffffff;text-decoration:none;border-color:#ffffff;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:10pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("a.novo_cliente_plain:hover, a.novo_cliente_plain:active{background-color:#3085bf;color:#ffffff;text-decoration:none;border-color:#ffffff;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:10pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("\n-->\n");
document.write("</style>");

var fc=0xffffff;
var bc=0x3085bf;
if(typeof(frames)=="undefined"){var frames=0;}

startMainMenu("",0,0,2,0,0)
mainMenuItem("novo_cliente_b1",".gif",28,98,"javascript:;","","Novo Cliente",2,2,"novo_cliente_plain");
endMainMenu("",0,0);

startSubmenu("novo_cliente_b1","novo_cliente_menu",98);
submenuItem("---","javascript:;","","novo_cliente_plain");
endSubmenu("novo_cliente_b1");

loc="";
