/***************************************************************************************
*��л��歶�Ϊ�������ṩ��ɫ����
****************************************************************************************/
/***************************************************************************************
*����3D����ģ��
****************************************************************************************/
var vml3dtext = "<v:shapetype id='3dtxt' coordsize='21600,21600' o:spt='136' adj='10800' > <v:path textpathok='t' v:connecttype='custom' /><v:textpath on='t' fitshape='t'/> <v:lock v:ext='edit' text='t' shapetype='t'/></v:shapetype>";
document.getElementById("ybllinetab").innerHTML = vml3dtext;
//======================================д��VML����========================================
var vmlgroup = " <v:group ID='group1' style='position:relative;WIDTH:2000000px;HEIGHT:2000000px;left:0;top:30' coordsize = '2000000,2000000'><v:RoundRect ID='rect1' style='position:relative;width:800;height:400px' strokecolor='black' fillcolor='#FFFFFF' arcsize='0'><v:fill rotate='t' angle='-45' focus='100%' type='gradient'/><v:shadow on='T' type='single' color='#b3b3b3' offset='5px,5px'/></v:RoundRect><v:line ID='line1' style='position:relative;z-index:3;' from='30,350' to='770,350'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line><v:line ID='line2' style='position:relative;z-index:3;' from='50,370' to='50,30'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line></v:group> ";
//var vmlgroup = "���ڶ�ȡ����,���Ժ�...";
document.getElementById("ybllinetab").innerHTML += vmlgroup;
//========================================д��ͼ���Ϸ�������================================
var Toolbar = " <DIV id='linehead'><input type='button' value=' �� ӡ ' name='button1'  onmouseup=\"hide()\" onclick=\"document.execCommand('print')\">&nbsp;&nbsp;<input type='button' value='���ӿ��' name='button2' onClick=\"editgroup(1)\">&nbsp;&nbsp;<input type='button' value='���ٿ��' name='button3' onClick=\"editgroup(2)\">&nbsp;&nbsp;<input type='button' value='���Ӹ߶�' name='button4' onClick=\"editgroup(3)\">&nbsp;&nbsp;<input type='button' value='���ٸ߶�' name='button5' onClick=\"editgroup(4)\">&nbsp;&nbsp;<input type='button' value=' �� �� ' name='button6' onClick=\"editgroup(5)\">&nbsp;&nbsp;<input type='button' value=' �� С ' name='button7' onClick=\"editgroup(6)\">&nbsp;&nbsp;<input type='button' value=' �� ԭ ' name='button8' onClick=\"editgroup(7)\">&nbsp;&nbsp;<input type='button' value=' �� ת ' name='button9' onClick=\"circumgyrate()\"></DIV>";
document.getElementById("ybllinehead").innerHTML = Toolbar;
//=====================================��ʼ������========================================
var w=2000000,h=2000000,xsfs=1;//xsfs:��ʾ��ʽ��1��������ʾ��2����������ʾ��
var xzjd=0;//��ʼ��ͼ����ת�ĽǶ�
//var xssj=[30,80,120,60,50,70,30,90,60,200,40,90];//�����������Ҫ��ʾ������
//var sjname=["һ��","����","����","����","����","����","����","����","����","ʮ��","ʮһ��","ʮ����"];//��������
var xssj = new Array();
var sjname = new Array();
var rectcolor =  ["#00ff00","#00BFFF","#FF00FF","#912CEE","#489620","#490761","#C82E31","#F1AF00","#00A06B","#8F006D","#1B4F93","#F9F400","#FF0000"];//������ɫ��
var rectcolor2 = ["#d1ffd1","#00F5FF","#FFDDFF","#9F79EE","#C8E2B1","#79378B","#F6B297","#FCE0A6","#C9E4D6","#AF4A92","#94AAD6","#FFFBD1","#FFCCCC"];//������ɫ�������������һһ��Ӧ��
function init(arraysj,arraymc,arraysl)//����,��������,����
{
	if (arraysl==0)
	{
		alert("����Ϊ��,������������Ƿ���ȷ!");
		return false;
	}
	xssj=arraysj.split(",");//��javaben���ݹ����Ĳ����ָ������
	sjname=arraymc.split(",");
/************************************************************************************
*����˵����fkkd��rect1�߶ȣ�fkgd��rect1��ȣ�div1gd��div1�߶ȣ�hx1,hx2,hy1,hy2�����ͷ4�����ꣻ
*zx1,zx2,zy1,zy2���ݼ�ͷ4�����ꣻxbc:X��Ĳ�����ybc:Y��Ĳ�����
*maxxssj:������������ֵ��minxssj:�����������Сֵ��sumxssj:�����ܺͣ�avgxssj:����ƽ��ֵ��
*sjjh:��ʾ�����ݼ���;x:��ͼ�ĺ����ꣻy:��ͼ�������ꣻxssjd:��xssj[]ת����double��xsjd:��ת�ĽǶȣ�
*sjbl:���ݱ��ʣ�rectheight:��ͼ�ĸ߶ȣ�maxint:�������������ʽ;maxstr:��������ַ�����ʽ;
*************************************************************************************/
var fkkd,fkgd,div1gd,hx1,hx2,hy1,hy2,zx1,zx2,zy1,zy2,xbc,ybc,maxxssj,minxssj,sjjh,x,ys,xssjd,sumxssj,avgxssj,sjbl,rectheight,maxint,txtl,txtt;
maxxssj=0;
sumxssj=0;
sjbl=0;
for (k=0;k<xssj.length ;k++ )//	����������������,��Сֵ
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
//===============================�����������������ʽ maxfirstint ���� 1200 ���� 2000 ===================
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


avgxssj=sumxssj/k;//ƽ��ֵ
avgxssj = parseInt(avgxssj*100)/100;
//alert(sumxssj+"--"+avgxssj+"--"+k);
if (maxxssj>9999)//�ж�������������ֵ���ȣ����������Χ���Զ��ӿ�
{
//	this.w=1200000,this.h=2000000,this.xsfs=2;
//	document.getElementById("group1").coordsize = w+","+h;
}
fkkd=80*xssj.length+300;//�������ݳ��ȼ���rect1���
fkgd=500;//�̶�ͼ�εĸ߶�Ϊ400����ʵ����ʾ���ݵĸ߶�Ϊ300
ybc=(fkgd-100)/maxfirstint;//300�������ֵ���������λ�̶ȼ�X�Ჽ������������Ϊ�˹淶���ݣ���Ϊ���ݵĲ�ȷ��������ʮ��ģ����и�λ����������ʾ������ͼ�ο���������
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
	writerect(x,y,rectheight,rectcolor[colorleng],rectcolor2[colorleng],xssj[i],sjname[i],sjbl);//����ͼy:top; x:left;rectheight:��ͼ�߶�

}
var mxasjwidth=fkkd-150;
writemaxmin(mxasjwidth,maxxssj,minxssj,sumxssj,avgxssj);
//writeline(sjjh);//����ͼ
div1gd=fkgd+80;
hx1=80;hy1=fkgd-50;hx2=fkkd-180;hy2=fkgd-50;//���ݷ���ĳ��ȣ��߶ȼ���X������λ��
zx1=100;zy1=fkgd-30;zx2=100;zy2=30;//���ݷ���ĳ��ȣ��߶ȼ���Y������λ��
document.getElementById("rect1").style.width=fkkd;//��ʼ��������
document.getElementById("rect1").style.height=fkgd;//��ʼ������߶�
//document.getElementById("div1").style.top=div1gd;//��ʼ���·��������߶�
document.getElementById("line1").from=hx1+","+hy1;//���ͷ������ꣻ
document.getElementById("line1").to=hx2+","+hy2;//���ͷ�յ����ꣻ
document.getElementById("line2").from=zx1+","+zy1;//�ݼ�ͷ������ꣻ
document.getElementById("line2").to=zx2+","+zy2;//�ݼ�ͷ�յ����ꣻ
//=============================================��ʼ����������==========================================
//�����������  ������x�᲻�� ,y����Ϊ40,����ÿѭ��һ�ν�y-40
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
for (k=0;k<=10 ;k++ )//����������
{
	wgleft=lx0-10;
	wgtop=ly0;
	wgkd=maxfirstint/10*k;
//	alert("ly1="+ly1+"ly2="+ly2+"ly3="+ly3);
	var strltwg = "<v:PolyLine ID='wgline"+k+"' filled='false' strokecolor='#69f' Points='"+lx1+","+ly1+" "+lx2+","+ly2+" "+lx3+","+ly3+"' style='position:relative;Z-index:6;cursor:hand;' title='����ı�������ɫ' onClick=\"wgcolor(\'wgline"+k+"\')\"/>";
	var writeltwg = document.createElement(strltwg);
	group1.insertBefore(writeltwg);
	var strltwgas = "<v:PolyLine filled='false' strokecolor='black' Points='"+lx0+","+ly0+" "+lx1+","+ly1+"' style='position:relative;Z-index:6;cursor:hand;' onClick=\"wgcolor(\'wgline"+k+"\')\"/>";
	var writeltwgas = document.createElement(strltwgas);
	group1.insertBefore(writeltwgas);
	//����̶�
	var strwgkd = "<v:RoundRect style='position:relative;width:80;height:40px;LEFT:"+wgleft+"px;TOP:"+wgtop+"px;cursor:hand;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF'  title='����ı�������ɫ' onClick=\"wgcolor(\'wgline"+k+"\')\" ><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+wgkd+" </v:TextBox></v:RoundRect> ";
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
//��������
var strltwgs = "<v:PolyLine filled='false' strokecolor='#69f' Points='"+hlx1+","+hly1+" "+hlx2+","+hly2+"' style='position:relative;Z-index:6'/>";
var writeltwgs = document.createElement(strltwgs);
group1.insertBefore(writeltwgs);

}
//==============================================���ߺ���===========================================
function writeline(sss)
{
	var strElement = "<v:PolyLine filled='false' strokecolor='red' Points='"+sss+" style='position:relative'/>";
	var newPoint = document.createElement(strElement);
	group1.insertBefore(newPoint);
}
//=============================================����ͼ����============================================
function writerect(rectx,recty,recth,rectc,rectc2,rectsj,rectsjmc,rectsjbl)
{
	rectx+=10;
	var rectwidth=25;//������
	if (xsfs==2)
	{
		rectwidth=15;
	}
	var strElements = "<v:rect onmouseover=\"mouseover(\'txt"+i+"\')\"  onmouseout=\"mouseout(\'txt"+i+"\')\" style='position:relative;width:"+rectwidth+";height:"+recth+";left:"+rectx+";top:"+recty+";Z-index:7;cursor:hand;' strokecolor='black' fillcolor='"+rectc+"' arcsize='0.03' title='�� �ƣ�"+rectsjmc+"&#10;�� �ݣ�"+rectsj+"&#10;�� �ʣ�"+rectsjbl+"%'><v:fill color2='"+rectc2+"' rotate='t' type='gradient'/><v:extrusion v:ext='view' backdepth='20pt' color='"+rectc+"' on='t'/></v:rect> ";
	document.getElementById("group1").innerHTML += strElements;
}
//===============================��ʾͼ���Ϸ������ݺͺ�����̶�==========================================
function writesj(xx,yy,sj,sjnames,sjy,bl)
{
//ͼ���Ϸ�������
	yy=yy-50;
	xx=xx+5;
	txtl=xx;
	txtt=yy+30
//	var strElement1 = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+yy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center'><b>"+sj+"</b></DIV>";
	var strElement1 = "<v:RoundRect style='position:relative;width:80;height:20px;LEFT:"+xx+"px;TOP:"+yy+"px;Z-index:5' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF' title='�� �ƣ�"+sjnames+"&#10;�� �ݣ�"+sj+"&#10;�� �ʣ�"+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sj+"</v:TextBox></v:RoundRect> ";
//TextBox �ȽϹؼ��������� inset(left,top,right,bottom)����˼�Ǹ�ͼ�αߵ��������Ҷ��ٷ�Χ�ڶ�λ���֣�
	document.getElementById("group1").innerHTML += strElement1;
//=================================д��3D����==========================================
	var text3d ="<v:shape id='txt"+i+"' type='#3dtxt' style='position:absolute;LEFT:"+txtl+"px;TOP:"+txtt+"px;z-index:200;width:50; height:18;cursor:hand;display:none;' fillcolor='#CCCCCC' > <v:fill opacity='60293f' color2='fill lighten(120)' rotate='t' angle='-135' method='linear sigma' focus='100%' type='gradient'/><v:textpath style='font-family:'����';v-text-kern:t' trim='t' fitpath='t' string='"+bl+"%'/> <v:extrusion v:ext='view' backdepth='8pt' on='t' lightposition='0,0' lightposition2='0,0'/></v:shape>";
	document.getElementById("group1").innerHTML += text3d;
//=======================================������̶�======================================
	sjy=sjy-40;
	xx=xx-5;
//	var strname = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+sjy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center;font-size:12'>"+sjnames+"</DIV>";
	var strname = "<v:RoundRect style='position:relative;width:80;height:20px;LEFT:"+xx+"px;TOP:"+sjy+"px;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF'  title='�� �ƣ�"+sjnames+"&#10;�� �ݣ�"+sj+"&#10;�� �ʣ�"+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sjnames+" </v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strname;
}
//================================���Ͻ���ʾ���ݵ����ֵ����Сֵ���ܺͣ�ƽ��ֵ======================================
function writemaxmin(zb,maxs,mins,sums,avgs)
{
	var strmax = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:10px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>��&nbsp;&nbsp;��:"+sums+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:30px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>ƽ��ֵ:"+avgs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:50px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>���ֵ:"+maxs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmin = "<v:RoundRect style='position:relative;width:130;height:20px;LEFT:"+zb+"px;TOP:70px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>��Сֵ:"+mins+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmin;
}
//======================�ı�ͼ��1���ӿ�2������3���Ӹߣ�4�����ߣ�5���Ŵ�6����С��7����ԭ==================
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
//============================================��תͼ��======================================
function circumgyrate()
{
	xzjd+=90;
	document.getElementById("group1").Rotation = xzjd;
}
//===========================================�ͻ���ӡʱ�����޸Ĳ˵�========================================
function hide()
{
	document.getElementById("linehead").style.display="none";
}
//==============================�û�������� ��ɫ�ı�,�����û��������� ˫���ָ�===============================
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
//===================================��ʾ������3D����===================================
function mouseover(txtid)
{
//	alert(txtid);
	document.getElementById(txtid).style.display = "";
}
function mouseout(txtid2)
{
	document.getElementById(txtid2).style.display = "none";
}