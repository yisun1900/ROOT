/***************************************************************************************
*感谢甜姝儿为本程序提供配色方案
****************************************************************************************/
/***************************************************************************************
*定义3D文字模版
****************************************************************************************/
var vml3dtext = "<v:shapetype id='3dtxt' coordsize='21600,21600' o:spt='136' adj='10800' > <v:path textpathok='t' v:connecttype='custom' /><v:textpath on='t' fitshape='t'/> <v:lock v:ext='edit' text='t' shapetype='t'/></v:shapetype>";
document.getElementById("ybllinetab").innerHTML = vml3dtext;
//======================================写入VML容器========================================
var vmlgroup = " <v:group ID='group1' style='position:relative;WIDTH:5000px;HEIGHT:5000px;left:0;top:0' coordsize = '5000,5000'></v:group> ";
document.getElementById("ybllinetab").innerHTML += vmlgroup;
/*************************************************************************************
*变量声明 sumsj:数据总和; lssj:临时数据; sjmxjh:数据明细集合; mcmxjh:名称明细集合;r:半径;
*sjhd:数据的弧度;sumsjhd:数据弧度和;sjx:数据的横坐标;sjy:数据的纵坐标;
*pieleft:饼图左边坐标(,pieleft,pietop,pieright,piebottom:左,右,上,下)
*piestartx,piestarty:起点坐标;pieendx,pieendy:终点坐标;zjx,zjy:横纵坐标增加的值
*pieox,pieoy:圆心坐标;cdgd:菜单高度;fkgd:方框高度;cdleft:菜单左边距;textl,texty:3D文字坐标
**************************************************************************************/
var as=-1,ass=-1,u=0;
function init(sjlist,mclist,sjsl)
{
var piecolor =  ["#DF0029","#FCDAD5","#EC870E","#FDE2CA","#C18C00","#FCE0A6","#9C9900","#F9F400","#367517","#E6F1D8","#006241","#C9E4D6","#00676B","#CAE5E8","#79378B","#BFCAE6","#FF00FF","#A095C4","#00FFFF","#C9B5D4","#A2007C","#E8D3E3"];
//var piecolor =  ["#00B2BF","#8F006D","#F1AF00","#99CCFF","#912CEE","#F458A2","#1F228D","#FFF200","#8080FB","#5A3131","#00A06B","#FF0000","#1B4F93"];

var sumsj,sjmxjh,mcmxjh,lssj,sjhd,sjhd2,sjx,sjy,sjx2,sjy2,sumsjhd,sumsjhd2,r,pai,zjx,zjy,pieleft,pietop,pieright,piebottom,piestartx,piestarty,pieendx,pieendy,pieox,pieoy,sjbfb,colors,indexs,indexsum,bz,cdgd,fkgd,cdleft,cdleft2,cdgd2,textl,texty;
sjmxjh = sjlist.split(",");
mcmxjh = mclist.split(","); 
sjbfb=0;
n=3;
r=200;
sumsj=0;
sumsjhd=0;
sumsjhd2=0;
zjx=300;
zjy=300;
pai=Math.PI;
pieleft=100;
pietop=100;
pieright=500;
piebottom=500;
piestartx=300;
piestarty=300;
pieox=300;
pieoy=300;
pieendx=300;
pieendy=300;
colors=-1;
indexs=30;
indexs2=160;
indexsum=0;
bz=0;
cdgd=830;
cdgd2=830;
fkgd=35*(15)+50;
var cdhsxs=parseInt(sjmxjh.length/15+0.5);
for (k=0;k<sjmxjh.length ;k++ )
	{
		lssj = sjmxjh[k]-0;
		sumsj += lssj;//计算数据的总和
	}
for (l=0;l<sjmxjh.length ;l++ ) //ID 2334
	{
		sjbfb = parseInt((sjmxjh[l]-0)/sumsj*10000+0.5)/100;
		sjhd = (sjmxjh[l]-0)/sumsj*Math.PI*2;
		sjhd = parseInt(sjhd*100+0.5)/100;//计算每个数据的弧度
		sumsjhd += sjhd-0;
		sjx = r*parseInt(Math.cos(sumsjhd)*100+0.5)/100+zjx;//计算每个数据的实际坐标
		sjy = 0-r*parseInt(Math.sin(sumsjhd)*100+0.5)/100+zjy;
		if (l==0)//第一次 固定起点坐标
			{
				sjx2 = r+zjx;
				sjy2 = 0+zjy;
			}
		else if (l==sjmxjh.length-1)//最后一次 固定终点坐标
			{
				sjx = r+zjx;
				sjy = 0+zjy;
				sjhd2 = (sjmxjh[l-1]-0)/sumsj*Math.PI*2;
				sjhd2 = parseInt(sjhd2*100+0.5)/100;//计算每个数据的弧度
				sumsjhd2 += sjhd2-0;
				sjx2 = r*parseInt(Math.cos(sumsjhd2)*100+0.5)/100+zjx;//计算每个数据的实际坐标
				sjy2 = 0-r*parseInt(Math.sin(sumsjhd2)*100+0.5)/100+zjy;
			}
		else 
			{
				sjhd2 = (sjmxjh[l-1]-0)/sumsj*Math.PI*2;
				sjhd2 = parseInt(sjhd2*100+0.5)/100;//计算每个数据的弧度
				sumsjhd2 += sjhd2-0;
				sjx2 = r*parseInt(Math.cos(sumsjhd2)*100+0.5)/100+zjx;//计算每个数据的实际坐标
				sjy2 = 0-r*parseInt(Math.sin(sumsjhd2)*100+0.5)/100+zjy;
			}
			textl=(pieox+(sjx+sjx2)/2)/2+280;//定义3D文字left
			texty=(pieoy+(sjy+sjy2)/2)/2+730;//定义3D文字top
/******************************************************************************
*设置Z-index属性,达到完美视觉效果
*计算出大于平均值的项,从这项开始下滑Z-index属性,使得显示效果加强
*******************************************************************************/
	indexsum+=sjmxjh[l]-0;
	if (indexsum>=sumsj/4*3)
		{
			indexs=indexs2-as;
			indexs2=indexs;
			as=1;
		}
	else if (indexsum<=sumsj/4)
		{
			indexs=indexs-1;
		}
	else
		{
			indexs=indexs+ass;
			ass=1;

		}
//alert(indexs);
/*****************************************************************************
*设置颜色,在piecolor循环取色,避免数据项数量正好是piecolor.length+1时出现的颜色重叠现象
******************************************************************************/
	colors+=1;
	if (colors>=piecolor.length)
		{
			colors=colors-piecolor.length;
		}
	bz=sjmxjh.length%piecolor.length
	if (bz==1)
	{
		if (l==sjmxjh.length-1)
		{
			colors=colors+3;
		}
	}
/*******************************************************************************
*输出饼图
*画图规则:LEFT,TOP,RIGHT,BOTTOM  Start(X,Y) End(X,Y)
********************************************************************************/
	var vmlpie = " <v:shape ID='pie"+l+"' fillcolor='"+piecolor[colors]+"' style='position:absolute;z-index:"+indexs+";width:5000;height:5000;left:300;top:100;cursor:hand;' path='m "+pieox+","+pieoy+"l"+sjx2+","+sjy2+"ar"+pieleft+" "+pietop+" "+pieright+" "+piebottom+" "+sjx2+" "+sjy2+","+sjx+" "+sjy+"l"+piestartx+","+piestarty+"xe' title='名 称:"+mcmxjh[l]+"&#10;数 值:"+sjmxjh[l]+"&#10;比 例:"+sjbfb+"%' onmouseover=\"mouseover(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\" onmouseout=\"mouseout(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\"><v:fill opacity='60293f' color2='fill lighten(120)' v:opacity2='60293f' rotate='t' angle='-135' method='linear sigma' focus='100%' type='gradient'/><v:extrusion v:ext='view' on='t'backdepth='25' rotationangle='45' viewpoint='0,0'viewpointorigin='0,0' skewamt='0' lightposition='-50000,-50000' lightposition2='50000'/></shape> ";
	document.getElementById("group1").innerHTML += vmlpie;

	cdgd=cdgd+35;
	cdgd2=cdgd2+35;
	if (l%15==0)//每15个菜单换一次行
	{
		cdleft = parseInt(l/15+1.5)*180+700;
		cdleft2 = cdleft+50;
		cdgd = 830;
		cdgd2 = 830;
	}
/******************************************************************************
*画右边的说明菜单
*******************************************************************************/
//===================================画右侧圆柱========================================
	var vmlcd = "<v:rect onmouseover=\"mouseover(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\" ID='cd"+l+"' onmouseout=\"mouseout(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\" style='width:30px;height:20px;behavior:URL(#default#VML);z-index:3;LEFT:"+cdleft+"px;TOP:"+cdgd+"px;cursor:hand;' fillcolor='"+piecolor[colors]+"' O:SpT=\"132\" title='名 称:"+mcmxjh[l]+"&#10;数 值:"+sjmxjh[l]+"&#10;比 例:"+sjbfb+"%'></rect>";
	document.getElementById("group1").innerHTML += vmlcd;
//===================================写右侧菜单数据========================================
	var vmlmc = "<v:RoundRect onmouseover=\"mouseover(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\"  onmouseout=\"mouseout(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\" ID='sj"+l+"' title='名 称:"+mcmxjh[l]+"&#10;数 值:"+sjmxjh[l]+"&#10;比 例:"+sjbfb+"%' style='position:relative;width:100;height:20px;LEFT:"+cdleft2+"px;TOP:"+cdgd2+"px;Z-index:5;cursor:hand;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF' ><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+mcmxjh[l]+"</v:TextBox></v:RoundRect>";
	document.getElementById("group1").innerHTML += vmlmc;
//=================================写入3D文字==========================================
	var text3d ="<v:shape onmouseover=\"mouseover(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\"  onmouseout=\"mouseout(\'cd"+l+"\',\'pie"+l+"\',\'sj"+l+"\',\'"+piecolor[colors]+"\',\'txt"+l+"\')\" id='txt"+l+"' type='#3dtxt' style='position:absolute;LEFT:"+textl+"px;TOP:"+texty+"px;z-index:2000;width:50; height:18;display:none;cursor:hand;' fillcolor='#CCCCCC' > <v:fill opacity='60293f' color2='fill lighten(120)' rotate='t' angle='-135' method='linear sigma' focus='100%' type='gradient'/><v:textpath style='font-family:'宋体';v-text-kern:t' trim='t' fitpath='t' string='"+sjbfb+"%'/> <v:extrusion v:ext='view' backdepth='8pt' on='t' lightposition='0,0' lightposition2='0,0'/></v:shape>";
	document.getElementById("group1").innerHTML += text3d;
	}//EDN 2334
/***********************************************************************************
*画方框 增加显示效果
************************************************************************************/
var fkkdxs=parseInt(sjmxjh.length/15+0.99);//方框宽度系数
var fkkd=700+fkkdxs*200;//方框的宽度
var vmlrec = " <v:rect  style='WIDTH:"+fkkd+";HEIGHT:"+fkgd+";left:300;top:800;z-index:1;' fillcolor='#FFFFFF' strokecolor='black'><v:shadow on='T' type='single' color='#b3b3b3' offset='5px,5px'/></v:rect> ";
	document.getElementById("group1").innerHTML += vmlrec;
}
function mouseover(cdid,pieid,sjid,sjcolor,txtid)
{
//	alert(sjcolor);
	document.getElementById(cdid).style.left = parseInt(document.getElementById(cdid).style.left)-10;
	document.getElementById(cdid).style.width = parseInt(document.getElementById(cdid).style.width)+20;
	document.getElementById(cdid).style.top = parseInt(document.getElementById(cdid).style.top)-5;
	document.getElementById(cdid).style.height = parseInt(document.getElementById(cdid).style.height)+10;
	document.getElementById(pieid).style.top = 100-20;
	document.getElementById(sjid).strokecolor = sjcolor;
	document.getElementById(txtid).style.display = "";
}
function mouseout(cdid2,pieid2,sjid2,sjcolor2,txtid2)
{
	document.getElementById(cdid2).style.left = parseInt(document.getElementById(cdid2).style.left)+10;
	document.getElementById(cdid2).style.width = parseInt(document.getElementById(cdid2).style.width)-20;
	document.getElementById(cdid2).style.top = parseInt(document.getElementById(cdid2).style.top)+5;
	document.getElementById(cdid2).style.height = parseInt(document.getElementById(cdid2).style.height)-10
	document.getElementById(pieid2).style.top = 100;
	document.getElementById(sjid2).strokecolor = "#FFFFFF";
	document.getElementById(txtid2).style.display = "none";
}