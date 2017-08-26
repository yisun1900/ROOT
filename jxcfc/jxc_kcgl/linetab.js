//======================================写入VML容器========================================
var vmlgroup = " <v:group ID='group1' style='position:relative;WIDTH:2000000px;HEIGHT:2000000px;left:0;top:30' coordsize = '2000000,2000000'><v:RoundRect ID='rect1' style='position:relative;width:800;height:400px' strokecolor='black' fillcolor='#FFFFFF' arcsize='0'><v:fill rotate='t' angle='-45' focus='100%' type='gradient'/><v:shadow on='T' type='single' color='#FFFFFF' offset='5px,5px'/></v:RoundRect><v:line ID='line1' style='position:relative;z-index:3;' from='30,350' to='770,350'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line><v:line ID='line2' style='position:relative;z-index:3;' from='50,370' to='50,30'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line></v:group> ";
//var vmlgroup = "正在读取数据,请稍后...";
document.getElementById("ybllinetab").innerHTML = vmlgroup;
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
*sjbl:数据比率；
*************************************************************************************/
var fkkd,fkgd,div1gd,hx1,hx2,hy1,hy2,zx1,zx2,zy1,zy2,xbc,ybc,maxxssj,minxssj,sjjh,x,ys,xssjd,sumxssj,avgxssj,sjbl;
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
avgxssj=sumxssj/k;
avgxssj = parseInt(avgxssj*100)/100;
//alert(sumxssj+"--"+avgxssj+"--"+k);
if (maxxssj>9999)//判断数据里面的最大值长度，如果超过范围则自动加宽
{
	this.w=1200000,this.h=2000000,this.xsfs=2;
	document.getElementById("group1").coordsize = w+","+h;
}
fkkd=50*xssj.length+200;//根据数据长度计算rect1宽度
fkgd=400;//固定图形的高度为400，而实际显示数据的高度为300
ybc=(fkgd-100)/maxxssj;//300除以最大值，计算出单位刻度即X轴步长，这样做是为了规范数据，因为数据的不确定性有上十万的，还有个位数，避免显示出来的图形看起来尴尬
//alert(maxxssj+"--"+ybc);
sjjh="";
for (i=0;i<xssj.length ;i++ )
{
	x=50*(i+1);
	y=fkgd-50-xssj[i]*ybc;
	sjjh+=x+","+y+" ";
	sjbl=xssj[i]/sumxssj;
	sjbl = parseInt(sjbl*100000+0.5)/1000;
	writesj(x,y,xssj[i],sjname[i],fkgd,sjbl)
}
var mxasjwidth=fkkd-100;
writemaxmin(mxasjwidth,maxxssj,minxssj,sumxssj,avgxssj);
writeline(sjjh);
div1gd=fkgd+80;
hx1=30;hy1=fkgd-50;hx2=fkkd-130;hy2=fkgd-50;//根据方框的长度，高度计算X轴个点的位置
zx1=50;zy1=fkgd-30;zx2=50;zy2=30;//根据方框的长度，高度计算Y轴个点的位置
document.getElementById("rect1").style.width=fkkd;//初始化方框宽度
document.getElementById("rect1").style.height=fkgd;//初始化方框高度
//document.getElementById("div1").style.top=div1gd;//初始化下方调节栏高度
document.getElementById("line1").from=hx1+","+hy1;//横箭头起点坐标；
document.getElementById("line1").to=hx2+","+hy2;//横箭头终点坐标；
document.getElementById("line2").from=zx1+","+zy1;//纵箭头起点坐标；
document.getElementById("line2").to=zx2+","+zy2;//纵箭头终点坐标；
}
//==============================================画线函数===========================================
function writeline(sss)
{
	var strElement = "<v:PolyLine filled='false' strokecolor='red' Points='"+sss+" style='position:relative' strokeweight='3pt'><v:extrusion on='t' backdepth='3pt' color='white' diffusity='1'/></v:PolyLine>";
	var newPoint = document.createElement(strElement);
	group1.insertBefore(newPoint);
}
//===============================显示图形上方的数据和横坐标刻度==========================================
function writesj(xx,yy,sj,sjnames,sjy,bl)
{
//图形上方的数据
	yy=yy-20;
	xx=xx+5;
//	var strElement1 = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+yy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center'><b>"+sj+"</b></DIV>";
var strElement1 = "<v:RoundRect style='position:relative;width:50;height:20px;LEFT:"+xx+"px;TOP:"+yy+"px;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF' title='名 称："+sjnames+"&#10;数 据："+sj+"&#10;比 率："+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sj+"</v:TextBox></v:RoundRect> ";
//TextBox 比较关键的属性是 inset(left,top,right,bottom)，意思是隔图形边的上下左右多少范围内定位文字：
	document.getElementById("group1").innerHTML += strElement1;
//横坐标刻度
	sjy=sjy-40;
	xx=xx-5;
//	var strname = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+sjy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center;font-size:12'>"+sjnames+"</DIV>";
var strname = "<v:RoundRect style='position:relative;width:45;height:20px;LEFT:"+xx+"px;TOP:"+sjy+"px;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF'  title='名 称："+sjnames+"&#10;数 据："+sj+"&#10;比 率："+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sjnames+" </v:TextBox></v:RoundRect> ";
document.getElementById("group1").innerHTML += strname;
}
//================================右上角显示数据的最大值，最小值，总和，平均值======================================
function writemaxmin(zb,maxs,mins,sums,avgs)
{
	var strmax = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:10px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>●总&nbsp;&nbsp;和："+sums+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:30px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>●平均值："+avgs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:50px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>●最大值："+maxs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmin = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:70px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>●最小值："+mins+" </b></v:TextBox></v:RoundRect> ";
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