<!--pngmoving logo-->

var pngbrOK=false;
var mie=false;
var aver=parseInt(navigator.appVersion.substring(0,1));
var aname=navigator.appName;
var pngmystop=0;

function pngcheckbrOK()
{if(aname.indexOf("Internet Explorer")!=-1)
{if(aver>=4) pngbrOK=navigator.javaEnabled();
mie=true;
}
if(aname.indexOf("Netscape")!=-1)  
{if(aver>=4) pngbrOK=navigator.javaEnabled();}
}
var vmin=2;
var vmax=5;
var vr=2;
var timer1;

function pngchip(chipname,width,height)
{
this.named=chipname;
this.vx=vmin+vmax*Math.random();
this.vy=vmin+vmax*Math.random();
this.w=width;
this.h=height;
this.xx=0;
this.yy=0;
this.timer1=null;
}

function pngmovechip(chipname)
{
if(pngbrOK && pngmystop==0)
{eval("pngchip="+chipname);
if(!mie)
{pageX=window.pageXOffset;
pageW=window.innerWidth;
pageY=window.pageYOffset;
pageH=window.innerHeight;
}
else
{pageX=window.document.body.scrollLeft;
pageW=window.document.body.offsetWidth-8;
pageY=window.document.body.scrollTop;
pageH=window.document.body.offsetHeight;
} 
pngchip.xx=pngchip.xx+pngchip.vx;
pngchip.yy=pngchip.yy+pngchip.vy;
pngchip.vx+=vr*(Math.random()-0.5);
pngchip.vy+=vr*(Math.random()-0.5);
if(pngchip.vx>(vmax+vmin))  pngchip.vx=(vmax+vmin)*2-pngchip.vx;
if(pngchip.vx<(-vmax-vmin)) pngchip.vx=(-vmax-vmin)*2-pngchip.vx;
if(pngchip.vy>(vmax+vmin))  pngchip.vy=(vmax+vmin)*2-pngchip.vy;
if(pngchip.vy<(-vmax-vmin)) pngchip.vy=(-vmax-vmin)*2-pngchip.vy;
if(pngchip.xx<=pageX)
{pngchip.xx=pageX;
pngchip.vx=vmin+vmax*Math.random();
}
if(pngchip.xx>=pageX+pageW-pngchip.w)
{pngchip.xx=pageX+pageW-pngchip.w;
pngchip.vx=-vmin-vmax*Math.random();
}
if(pngchip.yy<=pageY)
{pngchip.yy=pageY;
pngchip.vy=vmin+vmax*Math.random();
}
if(pngchip.yy>=pageY+pageH-pngchip.h)
{pngchip.yy=pageY+pageH-pngchip.h;
pngchip.vy=-vmin-vmax*Math.random();
}
if(!mie)
{eval('document.'+pngchip.named+'.top ='+pngchip.yy);
eval('document.'+pngchip.named+'.left='+pngchip.xx);
} 
else
{eval('document.all.'+pngchip.named+'.style.pixelLeft='+pngchip.xx);
eval('document.all.'+pngchip.named+'.style.pixelTop ='+pngchip.yy); 
}
	pngchip.timer1=setTimeout("pngmovechip('"+pngchip.named+"')",100);
}
}
function pngstop(x)
{
pngbrOK=true;
pngmystop=x;
pngmovechip("pngtome");
}
var pngtome;
var pngchip;
function pngtome()
{pngcheckbrOK(); 
pngtome=new pngchip("pngtome",100,100);
if(pngbrOK) 
{ pngmovechip("pngtome");
}
}

ns4=(document.layers)?true:false;
ie4=(document.all)?true:false;

function pngover()
{
if(ns4){
	//document.png.left=window.innerWidth/2-400;
	eval('document.png.left=document.'+pngchip.named+'.left');
	eval('document.png.top=document.'+pngchip.named+'.top-15');
	document.png.visibility="show";
	}else if(ie4) 
	{
	//document.all.png.style.left=window.document.body.offsetWidth/2-400;
	document.all.png.style.left=parseInt(document.all.pngtome.style.left);
	document.all.png.style.top=parseInt(document.all.pngtome.style.top);
	document.all.png.style.visibility="visible";
	pngstop(1);
	}
}

function pngout()
{
if(ns4){
	document.png.visibility="hide";
	}else if(ie4) 
	{
	document.all.png.style.visibility="hidden";
	pngstop(0);
	}
}

document.write("<div id='pngtome' style='position:absolute;'><a href='../yixiang/index.asp' target=_blank onMouseOver=pngover() onMouseOut=pngout() target='_blank'><img src='../images/dingdan.jpg' border=0></a>"
+"</div>"
+"	<div id='png' style='position:absolute; left:0;top:0;;visibility:hidden;'>"
+"	<a href='../yixiang/index.asp' target=_blank onMouseOver=pngover() onMouseOut=pngout()><img border=0 src='../images/dingdan.jpg'></a>"
+"	</div>");
pngtome()

<!--moving logo ½áÊø-->