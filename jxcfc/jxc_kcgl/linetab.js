//======================================д��VML����========================================
var vmlgroup = " <v:group ID='group1' style='position:relative;WIDTH:2000000px;HEIGHT:2000000px;left:0;top:30' coordsize = '2000000,2000000'><v:RoundRect ID='rect1' style='position:relative;width:800;height:400px' strokecolor='black' fillcolor='#FFFFFF' arcsize='0'><v:fill rotate='t' angle='-45' focus='100%' type='gradient'/><v:shadow on='T' type='single' color='#FFFFFF' offset='5px,5px'/></v:RoundRect><v:line ID='line1' style='position:relative;z-index:3;' from='30,350' to='770,350'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line><v:line ID='line2' style='position:relative;z-index:3;' from='50,370' to='50,30'  strokeweight='1pt'><v:stroke EndArrow='Classic'/></v:line></v:group> ";
//var vmlgroup = "���ڶ�ȡ����,���Ժ�...";
document.getElementById("ybllinetab").innerHTML = vmlgroup;
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
*sjbl:���ݱ��ʣ�
*************************************************************************************/
var fkkd,fkgd,div1gd,hx1,hx2,hy1,hy2,zx1,zx2,zy1,zy2,xbc,ybc,maxxssj,minxssj,sjjh,x,ys,xssjd,sumxssj,avgxssj,sjbl;
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
avgxssj=sumxssj/k;
avgxssj = parseInt(avgxssj*100)/100;
//alert(sumxssj+"--"+avgxssj+"--"+k);
if (maxxssj>9999)//�ж�������������ֵ���ȣ����������Χ���Զ��ӿ�
{
	this.w=1200000,this.h=2000000,this.xsfs=2;
	document.getElementById("group1").coordsize = w+","+h;
}
fkkd=50*xssj.length+200;//�������ݳ��ȼ���rect1���
fkgd=400;//�̶�ͼ�εĸ߶�Ϊ400����ʵ����ʾ���ݵĸ߶�Ϊ300
ybc=(fkgd-100)/maxxssj;//300�������ֵ���������λ�̶ȼ�X�Ჽ������������Ϊ�˹淶���ݣ���Ϊ���ݵĲ�ȷ��������ʮ��ģ����и�λ����������ʾ������ͼ�ο���������
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
hx1=30;hy1=fkgd-50;hx2=fkkd-130;hy2=fkgd-50;//���ݷ���ĳ��ȣ��߶ȼ���X������λ��
zx1=50;zy1=fkgd-30;zx2=50;zy2=30;//���ݷ���ĳ��ȣ��߶ȼ���Y������λ��
document.getElementById("rect1").style.width=fkkd;//��ʼ��������
document.getElementById("rect1").style.height=fkgd;//��ʼ������߶�
//document.getElementById("div1").style.top=div1gd;//��ʼ���·��������߶�
document.getElementById("line1").from=hx1+","+hy1;//���ͷ������ꣻ
document.getElementById("line1").to=hx2+","+hy2;//���ͷ�յ����ꣻ
document.getElementById("line2").from=zx1+","+zy1;//�ݼ�ͷ������ꣻ
document.getElementById("line2").to=zx2+","+zy2;//�ݼ�ͷ�յ����ꣻ
}
//==============================================���ߺ���===========================================
function writeline(sss)
{
	var strElement = "<v:PolyLine filled='false' strokecolor='red' Points='"+sss+" style='position:relative' strokeweight='3pt'><v:extrusion on='t' backdepth='3pt' color='white' diffusity='1'/></v:PolyLine>";
	var newPoint = document.createElement(strElement);
	group1.insertBefore(newPoint);
}
//===============================��ʾͼ���Ϸ������ݺͺ�����̶�==========================================
function writesj(xx,yy,sj,sjnames,sjy,bl)
{
//ͼ���Ϸ�������
	yy=yy-20;
	xx=xx+5;
//	var strElement1 = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+yy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center'><b>"+sj+"</b></DIV>";
var strElement1 = "<v:RoundRect style='position:relative;width:50;height:20px;LEFT:"+xx+"px;TOP:"+yy+"px;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF' title='�� �ƣ�"+sjnames+"&#10;�� �ݣ�"+sj+"&#10;�� �ʣ�"+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sj+"</v:TextBox></v:RoundRect> ";
//TextBox �ȽϹؼ��������� inset(left,top,right,bottom)����˼�Ǹ�ͼ�αߵ��������Ҷ��ٷ�Χ�ڶ�λ���֣�
	document.getElementById("group1").innerHTML += strElement1;
//������̶�
	sjy=sjy-40;
	xx=xx-5;
//	var strname = "<DIV class='Chart1' style='LEFT:"+xx+"px;z-index:5;WIDTH:30pt;POSITION:absolute;TOP:"+sjy+"px;HEIGHT:5.6pt;TEXT-ALIGN:center;font-size:12'>"+sjnames+"</DIV>";
var strname = "<v:RoundRect style='position:relative;width:45;height:20px;LEFT:"+xx+"px;TOP:"+sjy+"px;' strokecolor='#FFFFFF' strokeweight='1px' arcsize='0' fillcolor='#FFFFFF'  title='�� �ƣ�"+sjnames+"&#10;�� �ݣ�"+sj+"&#10;�� �ʣ�"+bl+"%'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'>"+sjnames+" </v:TextBox></v:RoundRect> ";
document.getElementById("group1").innerHTML += strname;
}
//================================���Ͻ���ʾ���ݵ����ֵ����Сֵ���ܺͣ�ƽ��ֵ======================================
function writemaxmin(zb,maxs,mins,sums,avgs)
{
	var strmax = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:10px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>����&nbsp;&nbsp;�ͣ�"+sums+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:30px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>��ƽ��ֵ��"+avgs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmax = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:50px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>�����ֵ��"+maxs+" </b></v:TextBox></v:RoundRect> ";
	document.getElementById("group1").innerHTML += strmax;
	var strmin = "<v:RoundRect style='position:relative;width:90;height:20px;LEFT:"+zb+"px;TOP:70px;' strokecolor='white' strokeweight='1px' arcsize='0' fillcolor='white'><v:TextBox inset='1pt,1pt,1pt,1pt' style='font-size:10pt;'><b>����Сֵ��"+mins+" </b></v:TextBox></v:RoundRect> ";
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