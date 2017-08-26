<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="Writeline" scope="session" class="ybl.common.Writeline"/>
<script language=javascript>
<!--
/********************************************************************************************************************************
**说明：table1（传递过来的字符串，左边距，上边距，宽度，高度，图表标题，X轴单位，Y轴单位）
**str格式：横坐标轴的数据#显示的数据1#显示的数据2#显示的数据3………………显示的数据N#项目名称(2006-08-23)
*********************************************************************************************************************************/
	function table1(str,table_left,table_top,all_width,all_height,table_title,X_unit,Y_unit)
	{
			
			var stat_array=new Array();
			var xmmc=new Array();
			stat_array=str.split("#");
			xmmc=stat_array[stat_array.length-1].split(",");//取得输的项目名称：项目1，项目2。。。。。。。
			
//定义各条线的显示颜色	=======================================================================//alert("dfdfd");
			var bg_color=new Array();
			bg_color[1]="#ff1919";
			bg_color[2]="#ffff19";
			bg_color[3]="#1919ff";
			bg_color[4]="#19ff19";
			bg_color[5]="#fc0";
			bg_color[6]="#3cc";
			bg_color[7]="#ff19ff";
			bg_color[8]="#993300";
			bg_color[9]="#f60";
			bg_color[10]="#ff8c19";
			bg_color[11]="#993300" ;
			
			if (X_unit != "")
				X_unit = X_unit;

			if (Y_unit != "") 
				Y_unit = Y_unit;
			num1=stat_array.length-1;//取得第一维数组的长度:ubound(stat_array,1)stat_array 为二维数组
			//alert(num1);
			line_temp=stat_array[0].split(",");//split(stat_array(0,1),",")把数组进行分割月份,
			//alert(line_temp[1]);

			num2 = line_temp.length;//月份数组长度ubound(line_temp,1)+1;12
			//alert(num2);
//构造数组矩阵（num1*num2）此方法的关键所在==============================================================================================================		
			var line_code=new Array(num1);
			for(var i=0;i<num2;i++)
			{
				line_code[i]=new Array();
			}
			
//存放月份stat_array[0][1]中的数据line_code[0][j]=====================================================================================			
			for(var j=1;j<=num2;j++)
			{
				line_code[0][j] = line_temp[j-1];
			}
			//alert(line_code[0][12]);
//开始处理相关的数字数据==============================================================================================================
			for(var i=1;i<num1;i++)//开始处理相关的数字数据，从stat_array[1][1]----》stat_array[11][1]
			{
				line_temp = stat_array[i].split(",");
				for(var j=1;j<=num2;j++)
				{
							line_code[i][j]= line_temp[j-1];
						//eval("line_code"+(i+1))[j]=line_temp[j-1];
						//(line_code+(i+1))[i]=line_temp[j-1];
				}
			}
//求最大值=======================================================================================================================			
			
			//alert(line_code[1][1]);
			value_Max=0;
			//alert(value_Max);
			for(var i=1;i<=num1;i++)
			{
				for(var j=1;j<=num2;j++)
				{
					if(value_Max<parseInt(line_code[i][j]))
						value_Max=line_code[i][j];
						//document.write(line_code[i][j]+"&&");
				}
			}
			value_Max = parseInt(value_Max);
			//alert(value_Max);
			//value_Max=200000;
			//document.write(value_Max);
			//value_Max_str =cstr(value_Max)//CStr 函数用于替代 Str 函数来进行从其他数据类型到 String 子类型的国际公认的格式转换
			value_Max_str=value_Max;
//根据最大值对纵坐标求动态刻度=======================================================================================================
			if(value_Max>9)
			{
				//temp=mid(value_Max_str,2,1)
				temp = value_Max_str.toString().substr(1,1);
				 if(temp>4)
				 {
					temp2=(parseInt(value_Max/(Math.pow(10,(value_Max_str.toString().length-1))))+1)*Math.pow(10,(value_Max_str.toString().length-1));
					}
					else{
					temp2=(parseInt(value_Max/(Math.pow(10,(value_Max_str.toString().length-1))))+0.5)*Math.pow(10,(value_Max_str.toString().length-1));
				}
			}
			else
			{
				if(value_Max>4)
				{
					temp2 = 10; 
				}
				else
				{
				  temp2 = 5;
				}
			}
			item_hight = temp2/5
			item_width = 20000/(num2-1)
			
//包括标题，大的四边形框架，底色等=================================================================================
			document.write( "<v:rect id='background' style='position:absolute;left:"+table_left+"px;top:"+table_top+"px;WIDTH:"+all_width+"px;HEIGHT:"+all_height+"px;' fillcolor='#EFEFEF' strokecolor='gray'>");
			document.write( " <v:shadow on='t' type='single' color='silver' offset='4pt,4pt'/>");
			document.write( "</v:rect>");

			document.write( "<v:group ID='table' style='position:absolute;left:"+table_left+"px;top:"+table_top+"px;WIDTH:"+all_width+"px;HEIGHT:"+all_height+"px;' coordsize = '27500,12800'>");
			//document.write(value_Max);

			document.write( " <v:Rect style='position:relative;left:1500;top:200;width:23000;height:800'filled='false' stroked='f'>");
			document.write( " <v:TextBox inset='0pt,0pt,0pt,0pt'>");
			document.write( " <table width='100%' border='0' align='center' cellspacing='0'>");
			document.write( " <tr>");
			document.write( " <td align='center' valign='middle'><div style='font-size:15pt; font-family:黑体;'><B>"+table_title+"</B></div></td>");
			document.write( " </tr>");
			document.write( " </table>");
			document.write( " </v:TextBox>");
			document.write( " </v:Rect> ");

			document.write( " <v:rect id='back' style='position:relative;left:1700;top:1200;width:20500; height:10500;' fillcolor='#9cf' strokecolor='#DFDFDF'>");
			document.write( " <v:fill rotate='t' angle='-45' focus='100%' type='gradient'/>");
			document.write( " </v:rect>");

			document.write( " <v:rect id='back2' style='position:relative;left:23000;top:1200;width:4000; height:"+(10500)+";' fillcolor='#9cf' stroked='t' strokecolor='#0099ff'>");
			document.write( " <v:fill rotate='t' angle='-175' focus='100%' type='gradient'/>");
			document.write( " <v:shadow on='t' type='single' color='silver' offset='3pt,3pt'/>");
			document.write( " </v:rect>");
//================输出项目名称=========================================================================================

			for(var i=1;i<num1;i++)
			{			
					if(i==1) 
							displaystr="";
					else
							displaystr="none";

					document.write( " <div style='cursor:hand;' onmouseover='moveon(rec"+(i)+",line_"+(i)+")' onmouseout='moveout(rec"+(i)+",line_"+(i)+","+(i)+")' onclick='clickit("+(i)+")'>");
					document.write( " <v:Rect id='rec"+(i)+"' style='position:relative;left:23100;top:"+((i-1)*10200/10+1450)+";width:3800;height:800;display:"+displaystr+";' fillcolor='#efefef' strokecolor='"+bg_color[i]+"'>");
					document.write( " <v:fill opacity='.6' color2='fill darken(118)' opacity2='.6' rotate='t' method='linear sigma' focus='100%' type='gradient'/>");
					document.write( " </v:Rect>");
					document.write( " <v:Rect style='position:relative;left:23200;top:"+((i-1)*10200/10+1500)+";width:600;height:700' fillcolor='"+bg_color[i]+"' stroked='f'/>");
					document.write( " <v:Rect style='position:relative;left:24000;top:"+(((i-1)*10200/10+1500))+";width:3400;height:700' filled='f' stroked='f'>");
					document.write( " <v:TextBox inset='0pt,4pt,0pt,0pt' style='font-size:9pt;'><div align='left'>"+xmmc[i-1]+"</div></v:TextBox>");
					document.write( " </v:Rect> ");
					document.write( " </div> ");
			}

//画X，Y轴线==================================================================================================================
			document.write( " <v:line ID='X' from='1700,11700' to='22700,11700' style='z-index:2' strokecolor='#000000' strokeWeight=1pt><v:stroke EndArrow='Classic'/></v:line>");
			document.write( " <v:line ID='Y' from='1700,900' to='1700,11700' style='z-index:2' strokecolor='#000000' strokeWeight=1pt><v:stroke StartArrow='Classic'/></v:line>");

			document.write( " <v:Rect style='position:relative;left:100;top:700;width:1500;height:500' filled='false' stroked='false'>");
			document.write( " <v:TextBox inset='0pt,0pt,0pt,0pt' style='font-size:9pt;'><div align='right'>"+Y_unit+"</div></v:TextBox>");
			document.write( " </v:Rect> " );
			document.write( " <v:Rect style='position:relative;left:22200;top:11900;width:2000;height:500' filled='false' stroked='false'>");
			document.write( " <v:TextBox inset='0pt,0pt,0pt,0pt' style='font-size:9pt;'><div align='left'>"+X_unit+"</div></v:TextBox>");
			document.write( " </v:Rect> " );
//画底色背景及立体效果===================================================================================================================
			for(var i=0;i<=4;i++)
			{
					document.write( " <v:line from='1300,"+(i*2000+1700)+"' to='1700,"+(i*2000+1700)+"' style='z-index:2' strokecolor='#000000'></v:line>");
					document.write( " <v:line from='1700,"+(i*2000+1700)+"' to='2200,"+(i*2000+1200)+"' style='z-index:2' strokecolor='#0099FF'></v:line>");
					document.write( " <v:line from='2200,"+(i*2000+1200)+"' to='22200,"+(i*2000+1200)+"' style='z-index:2' strokecolor='#0099FF'></v:line>");
					document.write( " <v:line from='2200,"+(i*2000+2200)+"' to='22200,"+(i*2000+2200)+"' style='z-index:2' strokecolor='#0099FF'>");
					document.write( " <v:stroke dashstyle='Dot'/>");
					document.write( " </v:line>");

					document.write( " <v:Rect style='position:relative;left:100;top:"+(i*2000+1250)+";width:1500;height:500' filled='false' stroked='false'>");
					document.write( " <v:TextBox inset='0pt,0pt,0pt,0pt' style='font-size:9pt;'><div align='right'>"+(item_hight*(5-i))+"</div></v:TextBox>");
					document.write( " </v:Rect> " );
			}

			document.write( " <v:line from='2200,11200' to='22200,11200' style='z-index:2' strokecolor='#0099FF'></v:line>");
			document.write( " <v:line from='2200,1200' to='2200,11200' style='z-index:2' strokecolor='#0099FF'></v:line>");
			document.write( " <v:line from='1700,11700' to='2200,11200' style='z-index:2' strokecolor='#0099FF'></v:line>");
//完成背景的坚虚线======================================================================================================================
			for(var j=0;j<=num2-1;j++)
			{
					document.write( " <v:line from='"+(j*item_width+1700)+",11700' to='"+(j*item_width+1700)+",12000' style='z-index:2' strokecolor='#000000'></v:line>");
					document.write( " <v:line from='"+(j*item_width+1700)+",11700' to='"+(j*item_width+2200)+",11200' style='z-index:2' strokecolor='#0099FF'><v:stroke dashstyle='ShortDot'/></v:line>");
					document.write( " <v:line from='"+(j*item_width+2200)+",1200' to='"+(j*item_width+2200)+",11200' style='z-index:2' strokecolor='#0099FF'><v:stroke dashstyle='ShortDot'/></v:line>");
					document.write( " <v:Rect style='position:relative;left:"+(j*item_width+1700-item_width/2)+";top:12100;width:"+item_width+";height:500' filled='false' stroked='false'>");
					document.write( " <v:TextBox inset='0pt,0pt,0pt,0pt' style='font-size:9pt;'><div align='center'>"+line_code[0][j+1]+"</div></v:TextBox>");
					document.write( " </v:Rect> " );
			}
//开始画曲线==========================================================================================================================
			for(var i=1;i<=num1;i++)
			{
						if(i==1) 
							displaystr="";
						else
							displaystr="none";

						document.write( " <div id='line_"+(i)+"' style='display:"+displaystr+";'>");
						for(var j=0;j<=num2-2;j++)
						{
							this_hight1 = (parseInt(line_code[i][j+1]/(5*item_hight)*10000));
							this_hight2 = (parseInt(line_code[i][j+2]/(5*item_hight)*10000));
							//线条样式
							document.write( " <v:line from='"+(j*item_width+1850)+","+((10000-this_hight1+1550))+"' to='"+((j+1)*item_width+1850)+","+(10000-this_hight2+1550)+"'style='z-index:"+(i*10)+";' strokeweight='0.1pt' strokecolor='"+bg_color[i]+"'>");
							document.write( " <extrusion v:ext='view' backdepth='2pt' on='t' lightposition='-50000,-50000' lightposition2='50000'/>");
							document.write( " </v:line>");
						}
						document.write( " </div>");
			}

			document.write( "</v:group>" );
			//清空
			for(var i=0;i<num2;i++)
			{
				line_code[i]=null;
			}
			line_code=null;
			stat_array=null;
			xmmc=null;
			bg_color=null;
	}

	var showit = new Array(10);

	function moveon(iteam,lineit){
	temp=eval(iteam)
	templine=eval(lineit)
	if(showit[1]){
	rec1.style.display = "";
	line_1.style.display = "";
	}else{
	rec1.style.display = "none";
	line_1.style.display = "none";
	} 
	temp.style.display = "";
	templine.style.display = "";
	}
	function moveout(iteam,lineit,i){
	temp=eval(iteam)
	templine=eval(lineit)
	if (showit[i]){
	temp.style.display = "";
	templine.style.display = "";
	}else{
	temp.style.display = "none";
	templine.style.display = "none";
	}
	}
	function clickit(i){
	if (showit[i]){
	showit[i]=false
	}else{
	showit[i]=true
	} 
	}
//-->
</script>
<%
String qyrq=null;
String wheresql="";
String xsfs=null;
String sjname="";
xsfs=request.getParameter("xsfs");
qyrq=request.getParameter("time1");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and cw_khfkjl.sksj>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
}
qyrq=request.getParameter("time2");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and cw_khfkjl.sksj<=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql="";

try {

	String nian="";
	String yue="";
	String oldyue="";
	String oldnian="";
	String sss="";
	String strnian="";
	int flag=1;
	int bz=1;//控制得到的数据与统计的横坐标的数据的个数相统一而设置的哨兵变量
	double jzqye=0;//家装金额
	conn=cf.getConnection();
//统计的为家装客户==========================================================================================================
	ls_sql=" SELECT to_char(sksj,'yyyy') nian,to_char(sksj,'mm') yue,sum(cw_khfkjl.fkje) fkje from crm_khxx,cw_khfkjl where crm_khxx.khbh=cw_khfkjl.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and cw_khfkjl.fklxbm='23' ";//21:木门；22:橱柜；23:主材；24：家具
	ls_sql+=" and cw_khfkjl.scbz='N' ";//N：未删除；Y：已删除
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(sksj,'yyyy'),to_char(sksj,'mm')";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		boolean ni=false;//控制'#'分割的录入
		nian=rs.getString("nian");
		yue=rs.getString("yue");
		jzqye=rs.getDouble(3);//家装金额
		
		//约定以年为界线,进行数据分割 '#',以月为分界线进行数据分割','.  对第一条记录进行处理.
		if(((!oldnian.equals(nian))&&(flag>1)))
		{
			oldnian=nian;
			bz=1;//把月份数据填满(中间及前面部分的）
			//out.println(oldyue);
			if(Integer.parseInt(oldyue)<12)
			{
				//out.print("ddfdfdfddfd");
				for(int i=(Integer.parseInt(oldyue)+1);i<=12;i++)//把月份数据填满(后面部分的）
				{
						sss=sss+",0";//add '0'
				}
			}
				
			sss=sss+"#"+jzqye;
			strnian=strnian+","+nian+"年";//记录单个的年份
			oldyue=yue;
			ni=true;
		}
		else
		{
			oldnian=nian;
			oldyue=yue;
			
		}
		
		if(flag==1)//哨兵,控制第一个数据的存入
		{
			if(bz==(Integer.parseInt(yue)))//因为每一个数据都要与时间一一对应,没有的数据,补零填充
			{
				
			}
			else
			{
				for(int x=bz;x<(Integer.parseInt(yue));x++)
				{
					sss=sss+"0,";
					bz++;
				}

			}
			sss=sss+jzqye;//存入家装金额
			strnian=strnian+nian+"年";//记录单个的年份,第一个数据
		}
		else
		{
			
			if(bz==(Integer.parseInt(yue)))
			{
				
			}
			else
			{
				
				for(int x=bz;x<(Integer.parseInt(yue));x++)//因为每一个数据都要与时间一一对应,没有的数据,补零填充
				{
					sss=sss+",0";
					bz++;
				}

			}
			if(!ni){
				sss=sss+","+jzqye;//存入家装金额
			}
		}

		bz++;
		flag++;

	
	}
	rs.close();
	ps.close();
	if(sss.equals(""))
	{
		out.print("<BR><BR><center><b><font color=red>系统提示：数据库中暂没有数据!</b></FONT></center>");
		return;
	}
	//对最后一条记录做判断，数据是否与坐标相对应
	if(Integer.parseInt(yue)<12)
	{
			//out.print("ddfdfdfddfd");
			for(int i=(Integer.parseInt(yue)+1);i<=12;i++)//把月份数据填满(后面部分的）
			{
				sss=sss+",0";
			}
	}
//==================================================================================================================================
	%>
	<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
	<head>
	<title></title>
	<STYLE>
	v\:* { Behavior: url(#default#VML) }
	o\:* { behavior: url(#default#VML) }
	</STYLE>
	</head>
<%
	//out.print(ls_sql);
	int ll=2;
	 sjname="一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月#"+sss+"#"+strnian;
	// out.print(sss);
	out.print("    &nbsp;&nbsp;&nbsp;&nbsp;");
	out.print("<script language=\"javascript\" >table1(\""+sjname+"\",20,20,700,350,\"主 材 实 收 款 统 计 图\",\"时间\",\"元\")</script>");

}
//===================================================================================================
catch (Exception e) {
	out.print("Exception: " + e);
	//out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>


