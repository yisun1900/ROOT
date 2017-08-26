/***************************************************************************************
*感谢甜姝儿为本程序提供配色方案
****************************************************************************************/
/***************************************************************************************
*定义3D文字模版
****************************************************************************************/
var vml3dtext = "<v:shapetype id='3dtxt' coordsize='21600,21600' o:spt='136' adj='10800' > <v:path textpathok='t' v:connecttype='custom' /><v:textpath on='t' fitshape='t'/> <v:lock v:ext='edit' text='t' shapetype='t'/></v:shapetype>";
document.getElementById("ybllinetab").innerHTML = vml3dtext;
//======================================写入VML容器========================================
var vmlgroup = " <v:group ID='group1' style='position:relative;WIDTH:2000000px;HEIGHT:2000000px;left:0;top:30' coordsize = '2000000,2000000'><v:RoundRect ID='rect1' style='position:relative;width:800;height:400px' strokecolor='black' fillcolor='#FFFFFF' arcsize='0'><v:fill rotate='t' angle='-45' focus='100%' type='gradient'/><v:shadow on='T' type='single' color='#b3b3b3' offset='5px,5px'/></v:RoundRect><v:line ID='line1' style='position:relative;z-index:3;' from='30,350' to='770,350'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line><v:line ID='line2' style='position:relative;z-index:3;' from='50,370' to='50,30'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line></v:group> ";
//var vmlgroup = "正在读取数据,请稍后...";
document.getElementById("ybllinetab").innerHTML += vmlgroup;
//========================================写入图形上方工具列================================
var Toolbar = " <DIV id='linehead'><input type='button' value=' 打 印 ' name='button1'  onmouseup=\"hide()\" onclick=\"document.execCommand('print')\">&nbsp;&nbsp;<input type='button' value='增加宽度' name='button2' onClick=\"editgroup(1)\">&nbsp;&nbsp;<input type='button' value='减少宽度' name='button3' onClick=\"editgroup(2)\">&nbsp;&nbsp;<input type='button' value='增加高度' name='button4' onClick=\"editgroup(3)\">&nbsp;&nbsp;<input type='button' value='减少高度' name='button5' onClick=\"editgroup(4)\">&nbsp;&nbsp;<input type='button' value=' 放 大 ' name='button6' onClick=\"editgroup(5)\">&nbsp;&nbsp;<input type='button' value=' 缩 小 ' name='button7' onClick=\"editgroup(6)\">&nbsp;&nbsp;<input type='button' value=' 还 原 ' name='button8' onClick=\"editgroup(7)\">&nbsp;&nbsp;<input type='button' value=' 旋 转 ' name='button9' onClick=\"circumgyrate()\"></DIV>";
document.getElementById("ybllinehead").innerHTML = Toolbar;
//=====================================初始化数据========================================
var w=2000000,h=2000000,xsfs=1;//xsfs:显示方式；1：正常显示；2：大数据显示；
var xzjd=0;//初始化图形旋转的角度
//var xssj=[30,80,120,60,50,70,30,90,60,200,40,90];//用数组来存放要显示的数据
//var sjname=["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];//数据名字
var xssj = new Array();
var sjname = new Array();
var rectcolor =  ["#00ff00","#00BFFF","#FF00FF","#912CEE","#489620","#490761","#C82E31","#F1AF00","#00A06B","#8F006D","#1B4F93","#F9F400","#FF0000"];//定义颜色组
var rectcolor2 = ["#d1ffd1","#00F5FF","#FFDDFF","#9F79EE","#C8E2B1","#79378B","#F6B297","#FCE0A6","#C9E4D6","#AF4A92","#94AAD6","#FFFBD1","#FFCCCC"];//定义颜色组这里和上面是一一对应的
function init(arraysj,arraymc,arraysl)//数据,数据名称,数量
{
	if (arraysl==0)
	{
		alert("数据为空,请检查检索条件是否正确!");
		return false;
	}
	xssj=arraysj.split(",");//将javaben传递过来的参数分割成数组
	sjname=arraymc.split(",");
/************************************************************************************
*变量说明：fkkd：rect1高度；fkgd：rect1宽度；div1gd：div1高度；hx1,hx2,hy1,hy2：横箭头4点坐标；
*zx1,zx2,zy1,zy2：纵箭头4点坐标；xbc:X轴的步长；ybc:Y轴的步长；
*maxxssj:数据里面的最大值；minxssj:数据里面的最小值；sumxssj:数据总和；avgxssj:数据平均值；
*sjjh:显示的数据集合;x:线图的横坐标；y:线图的纵坐标；xssjd:将xssj[]转换成double；xsjd:旋转的角度；
*sjbl:数据比率；rectheight:柱图的高度；maxint:最大数的整数形式;maxstr:最大数的字符串形式;
*************************************************************************************/
var fkkd,fkgd,div1gd,hx1,hx2,hy1,hy2,zx1,zx2,zy1,zy2,xbc,ybc,maxxssj,minxssj,sjjh,x,ys,xssjd,sumxssj,avgxssj,sjbl,rectheight,maxint,txtl,txtt;
maxxssj=0;
sumxssj=0;
sjbl=0;
for (k=0;k<xssj.length ;k++ )//	查找数据里面的最大,最小值
{
	xssjd=xssj[k]-0;
	sumxssj+=xssjd;
	if (maxxssj<xssjd)
		{
			maxxssj=xssjd;
		}
		if (k==0)
		{
			minxssj=xssjd;
		}
		else
		{
			if (minxssj>xssjd)
			{
				minxssj=xssjd;
			}
		}
}
//===============================返回最大数的整数形式 maxfirstint 例如 1200 返回 2000 ===================
var maxfirst,maxfirstint;
maxint = parseInt(maxxssj);
maxstr = maxint+"";
maxfirst = maxstr.substring(0,1)-0;
maxfirstint = maxfirst+1;
for (hha=1;hha<maxstr.length ;hha++ )
{
	maxfirstint = maxfirstint*10;
}
//alert("maxfirstint:"+maxfirstint+"  maxfirst:"+maxfirst+"  maxstr.length:"+maxstr.length);


avgxssj=sumxssj/k;//平均值
avgxssj = parseInt(avgxssj*100)/100;
//alert(sumxssj+"--"+avgxssj+"--"+k);
if (maxxssj>9999)//判断数据里面的最大值长度，如果超过范围则自动加宽
{
//	this.w=1200000,this.h=2000000,this.xsfs=2;
//	document.getElementById("group1").coordsize = w+","+h;
}
fkkd=80*xssj.length+300;//根据数据长度计算rect1宽度
fkgd=500;//固定图形的高度为400，而实际显示数据的高度为300
ybc=(fkgd-100)/maxfirstint;//300除以最大值，计算出单位刻度即X轴步长，这样做是为了规范数据，因为数据的不确定性有上十万的，还有个位数，避免显示出来的图形看起来尴尬
//alert(maxxssj+"--"+ybc);
sjjh="";
colorleng=0;
for (i=0;i<xssj.length ;i++ )
{
	colorleng++;
	if (colorleng>=rectcolor.length)
	{
		colorleng=0;
	}
	x=80*(i+1)+50;
	y=fkgd-50-xssj[i]*ybc;
	rectheight=xssj[i]*ybc;
	sjjh+=x+","+y+" ";
	sjbl=xssj[i]/sumxssj;
	sjbl = parseInt(sjbl*100000+0.5)/1000;
	writesj(x,y,xssj[i],sjname[i],fkgd,sjbl)
	writerect(x,y,rectheight,rectcolor[colorleng],rectcolor2[colorleng],xssj[i],sjname[i],sjbl);//画柱图y:top; x:left;rectheight:柱图高度

}
var mxasjwidth=fkkd-150;
writemaxmin(mxasjwidth,maxxssj,minxssj,sumxssj,avgxssj);
//writeline(sjjh);//画线图
div1gd=fkgd+80;
hx1=80;hy1=fkgd-50;hx2=fkkd-180;hy2=fkgd-50;//根据方框的长度，高度计算X轴个点的位置
zx1=100;zy1=fkgd-30;zx2=100;zy2=30;//根据方框的长度，高度计算Y轴个点的位置
document.getElementById("rect1").style.width=fkkd;//初始化方框宽度
document.getElementById("rect1").style.height=fkgd;//初始化方框高度
//document.getElementById("div1").style.top=div1gd;//初始化下方调节栏高度
document.getElementById("line1").from=hx1+","+hy1;//横箭头起点坐标；
document.getElementById("line1").to=hx2+","+hy2;//横箭头终点坐标；
document.getElementById("line2").from=zx1+","+zy1;//纵箭头起点坐标；
document.getElementById("line2").to=zx2+","+zy2;//纵箭头终点坐标；
//=============================================初始化立体网格==========================================
//立体网格变量  变量中x轴不变 ,y轴间距为40,所以每循环一次将y-40
var lx0,ly0,lx1,lx2,lx3,ly1,ly2,ly3,hlx1,hly1,hlx2,hly2,wgtop,wgleft,wgkd;
lx0=zx1-50;
ly0=hy1;
lx1=zx1;
ly1=hy1;
lx2=zx1+15;
ly2=hy1-10;
lx3=hx2-10;
ly3=hy1-10;
wgkd=0;
for (k=0;k<=10 ;k++ )//画立体网格
{
	wgleft=lx0-10;
	wgtop=ly0;
	wgkd=maxfirstint/10*k;
//	alert("ly1="+ly1+"ly2="+ly2+"ly3="+ly3);
	var strltwg = "<v:PolyLine ID='wgline"+k+"' filled='false' strokecolor='#69f' Points='"+lx1+","+ly1+" "+lx2+","+ly2+" "+lx3+","+ly3+"' style='position:relative;Z-index:6;cursor:hand;' title='点击改变网格颜色' onClick=\"wgcolor(\'wgline"+k+"\')\"/>";
	var writeltwg = document.createElement(strltwg);
	group1.insertBefore(writeltwg);
	var strltwgas = "<v:PolyLine filled='false' strokecolor='black' Points='"+lx0+","+ly0+" "+lx1+","+ly1+"' style='position:relative;Z-index:6;cursor:hand;' onClick=\"wgcolor(\'wgline"+k+"\')\"/>";
	var writeltwgas = document.createElement(strltwgas);
	group1.insertBefore(writeltwgas);
	//网格刻度
	var strwgkd = "<v:RoundRect style='position:relative;width:80;height:40px;LEFT:"+wgleft+"px;TOP:"+wgtop+"px;cursor:hand;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF'  title='点击改变网格颜色' onClick=\"wgcolor(\'wgline"+k+"\')\" ><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+wgkd+" </v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strwgkd;
	ly1=ly1-40;
	ly2=ly2-40;
	ly3=ly3-40;
	ly0=ly0-40;
}
hlx1=zx1+15;
hly1=hy1-10;
hlx2=zx1+15;
hly2=zy2+10;
//网格竖线
var strltwgs = "<v:PolyLine filled='false' strokecolor='#69f' Points='"+hlx1+","+hly1+" "+hlx2+","+hly2+"' style='position:relative;Z-index:6'/>";
var writeltwgs = document.createElement(strltwgs);
group1.insertBefore(writeltwgs);

}
//==============================================画线函数===========================================
function writeline(sss)
{
	var strElement = "<v:PolyLine filled='false' strokecolor='red' Points='"+sss+" style='position:relative'/>";
	var newPoint = document.createElement(strElement);
	group1.insertBefore(newPoint);
}
//=============================================画柱图函数============================================
function writerect(rectx,recty,recth,rectc,rectc2,rectsj,rectsjmc,rectsjbl)
{
	rectx+=10;
	var rectwidth=25;//柱体宽度
	if (xsfs==2)
	{
		rectwidth=15;
	}
	var strElements = "<v:rect onmouseover=\"mouseover(\'txt"+i+"\')\"  onmouseout=\"mouseout(\'txt"+i+"\')\" style='position:relative;width:"+rectwidth+";height:"+recth+";left:"+rectx+";top:"+recty+";Z-index:7;cursor:hand;' strokecolor='black' fillcolor='"+rectc+"' arcsize='0.03' title='名 称："+rectsjmc+"&#10;数 据："+rectsj+"&#10;比 率："+rectsjbl+"%'><v:fill color2='"+rectc2+"' rotate='t' type='gradient'/><v:extrusion v:ext='view' backdepth='20pt' color='"+rectc+"' on='t'/></v:rect> ";
	document.getElementById("group1").innerHTML += strElements;
}
//===============================显示图形上方的数据和横坐标刻度==========================================
function writesj(xx,yy,sj,sjnames,sjy,bl)
{
//图形上方的数据
	yy=yy-50;
	xx=xx+5;
	txtl=xx;
	txtt=yy+30
//	var strElement1 = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+yy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center'><b>"+sj+"</b></DIV>";
	var strElement1 = "<v:RoundRect style='position:relative;width:80;height:20px;LEFT:"+xx+"px;TOP:"+yy+"px;Z-index:5' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF' title='名 称："+sjnames+"&#10;数 据："+sj+"&#10;比 率："+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sj+"</v:TextBox></v:RoundRect> ";
//TextBox 比较关键的属性是 inset(left,top,right,bottom)，意思是隔图形边的上下左右多少范围内定位文字：
	document.getElementById("group1").innerHTML += strElement1;
//=================================写入3D文字==========================================
	var text3d ="<v:shape id='txt"+i+"' type='#3dtxt' style='position:absolute;LEFT:"+txtl+"px;TOP:"+txtt+"px;z-index:200;width:50; height:18;cursor:hand;display:none;' fillcolor='#CCCCCC' > <v:fill opacity='60293f' color2='fill lighten(120)' rotate='t' angle='-135' method='linear sigma' focus='100%' type='gradient'/><v:textpath style='font-family:'宋体';v-text-kern:t' trim='t' fitpath='t' string='"+bl+"%'/> <v:extrusion v:ext='view' backdepth='8pt' on='t' lightposition='0,0' lightposition2='0,0'/></v:shape>";
	document.getElementById("group1").innerHTML += text3d;
//=======================================横坐标刻度======================================
	sjy=sjy-40;
	xx=xx-5;
//	var strname = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+sjy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center;font-size:12'>"+sjnames+"</DIV>";
	var strname = "<v:RoundRect style='position:relative;width:80;height:20px;LEFT:"+xx+"px;TOP:"+sjy+"px;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF'  title='名 称："+sjnames+"&#10;数 据："+sj+"&#10;比 率："+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sjnames+" </v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strname;
}
//================================右上角显示数据的最大值，最小值，总和，平均值======================================
function writemaxmin(zb,maxs,mins,sums,avgs)
{
	var strmax = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:10px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>总&nbsp;&nbsp;和:"+sums+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:30px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>平均值:"+avgs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:50px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>最大值:"+maxs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmin = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:70px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>最小值:"+mins+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmin;
}
//======================改变图形1：加宽；2：减宽；3：加高；4：减高；5：放大；6：缩小；7：还原==================
function editgroup(fs)
{
	if (fs==1)
		{
			if (w>200000)
			{
			w=w-200000;
			document.getElementById("group1").coordsize = w+","+h;
			}
		}
		else if (fs==2)
		{
			w=w+200000;
			document.getElementById("group1").coordsize = w+","+h;
		}
		else if (fs==3)
		{
			if (h>200000)
			{
			h=h-200000;
			document.getElementById("group1").coordsize = w+","+h;
			}
		}
		else if (fs==4)
		{
			h=h+200000;
			document.getElementById("group1").coordsize = w+","+h;
		}
		else if (fs==5)
		{
			if (h>200000 && w>200000)
			{
			h=h-200000;
			w=w-200000;
			document.getElementById("group1").coordsize = w+","+h;
			}
		}
		else if (fs==6)
		{
			h=h+200000;
			w=w+200000;
			document.getElementById("group1").coordsize = w+","+h;
		}
		else if (fs==7)
		{
			if (xsfs==2)
			{
				this.w=1200000;
				this.h=2000000;
				this.xzjd=0;
				document.getElementById("group1").coordsize = w+","+h;
				document.getElementById("group1").Rotation = xzjd;
			}
			else 
			{
				this.w=2000000;
				this.h=2000000;
				this.xzjd=0;
				document.getElementById("group1").coordsize = w+","+h;
				document.getElementById("group1").Rotation = xzjd;
			}
			
		}
}
//============================================旋转图形======================================
function circumgyrate()
{
	xzjd+=90;
	document.getElementById("group1").Rotation = xzjd;
}
//===========================================客户打印时隐藏修改菜单========================================
function hide()
{
	document.getElementById("linehead").style.display="none";
}
//==============================用户点击网格 颜色改变,利于用户分析数据 双击恢复===============================
function wgcolor(thisid)
{
	if (document.getElementById(thisid).strokecolor=="red")
	{
		document.getElementById(thisid).strokecolor ="#69f";
	}
	else
	{
		document.getElementById(thisid).strokecolor ="red";
	}
}
//===================================显示或隐藏3D文字===================================
function mouseover(txtid)
{
//	alert(txtid);
	document.getElementById(txtid).style.display = "";
}
function mouseout(txtid2)
{
	document.getElementById(txtid2).style.display = "none";
}