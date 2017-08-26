<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String qyrq=null;
String wheresql="";
String xsfs=null;
String sjname="";
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
qyrq=request.getParameter("time1");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD')";
}
String qyrq2=request.getParameter("time2");
if (qyrq2!=null)
{
	qyrq2=qyrq2.trim();
	if (!(qyrq2.equals("")))	wheresql+="  and crm_khxx.qyrq<=TO_DATE('"+qyrq2+"','YYYY-MM-DD')";
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
	ls_sql=" select nian,yue,sum(htje) htje from";
	ls_sql+="(";
	ls_sql+=" SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(jc_mmydd.zjhze) htje from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";
	ls_sql+=" union all ";
	ls_sql+=" SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(jc_cgdd.zjhze) htje from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";
	ls_sql+=" union all";

	ls_sql+=" SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(jc_jjdd.zjhze) htje from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+="  group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";

	ls_sql+="union all ";
	ls_sql+="SELECT to_char(qyrq,'yyyy') nian,to_char(qyrq,'mm') yue,sum(hkze+NVL(zjhze,0)) htje from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by to_char(qyrq,'yyyy'),to_char(qyrq,'mm')  ";
	ls_sql+=") ";
	ls_sql+=" group by nian,yue";
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
	<html>
	<head>
	<title>家 居 统 计</title>
	</head>
	<body>
	<CENTER style='FONT-SIZE: 14px;border-collapse:collapse'>
  <B>家 居 产 值 统 计</B><BR>
  (统计时间：<%=qyrq%>--<%=qyrq2%>)<BR>
</CENTER>

<%
	sjname="一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月#"+sss+"#"+strnian;//整个传送过来的数据串:sjname[0]:月份，sjname[sjname.length-1]:年
	double hj=0;
	String[] datastr=null;//存取总的数据串
	String[] NinaStr=null;//年为单位的数组
	String[] yueStr=null;//月为单位的数组数据
	String []tem2=null;//公共临时变量
	String []tem1=null;
	String []tem=null;
	datastr=sjname.split("#");//划分成一个整体的数据组
	yueStr=datastr[0].split(",");//月划分成一个数据组
	NinaStr=datastr[datastr.length-1].split(",");

%>
<table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999" style='FONT-SIZE: 12px;border-collapse:collapse'>
 <tr bgcolor="#CCCCCC" height="22"><td width="8%" align="center">&nbsp;</td>
<%
	for(int k=0;k<yueStr.length;k++)
	{
%>
<td  width="5%" align="center"><%=yueStr[k]%></td>
<%	
	}
%>
<td  width="5%" align="center">合计</td>
<%	
	for(int k=0;k<NinaStr.length;k++)//输出整体的数据
	{	
		hj=0;
		tem=null;
		out.print("<tr><td width=\"5%\" align=\"center\">"+NinaStr[k]+"</td>");
		tem=datastr[k+1].split(",");
		for(int l=0;l<tem.length;l++)
		{
			out.print("<td width=\"5%\" align=\"center\">"+tem[l]+"</td>");//分项输出
			hj+=Double.parseDouble(tem[l]);//合计

		}
		out.print("<td width=\"5%\" align=\"center\" height=\"22\">"+hj+"</td>");
		out.print("</tr>");
	}
	
	for(int k=0;k<NinaStr.length-1;k++)//处理输出增减金额
	{	
		hj=0;//清零
		tem2=null;
		tem1=null;
		tem2=datastr[k+1].split(",");//处理数据到数组
		tem1=datastr[k+2].split(",");
		out.print("<tr>");
		out.print("<td width=\"5%\" align=\"center\" >增减金额"+NinaStr[k+1]+"-"+NinaStr[k]+"</td>");
		for(int l=0;l<tem2.length;l++)
		{

			out.print("<td width=\"5%\" align=\"center\">"+(Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]))+"</td>");//分项输出增减金额
			hj+=(int)(Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]));//合计

		}
		out.print("<td width=\"5%\" align=\"center\">"+hj+"</td>");
		out.print("</tr>");
	}
	for(int k=0;k<NinaStr.length-1;k++)//处理输出增减比例
	{	
		hj=0;//清零
		tem2=null;
		tem1=null;
		tem2=datastr[k+1].split(",");
		tem1=datastr[k+2].split(",");
		out.print("<tr>");
		out.print("<td width=\"5%\" align=\"center\" >增减比例"+NinaStr[k+1]+"/"+NinaStr[k]+"</td>");
		for(int l=0;l<tem2.length;l++)
		{
			if(Double.parseDouble(tem2[l])==0)//处理分母为零的情况
			{
				out.print("<td width=\"5%\" align=\"center\">0%</td>");
			}
			else
			{
				out.print("<td width=\"5%\" align=\"center\">"+cf.formatDouble((Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]))*100/Double.parseDouble(tem2[l]))+"%</td>");//分项输出比例
				hj+=((Double.parseDouble(tem1[l])-Double.parseDouble(tem2[l]))/Double.parseDouble(tem2[l]));//合计
			}
			
			

		}
		out.print("<td width=\"5%\" align=\"center\">"+cf.formatDouble(hj)+"</td>");
		out.print("</tr>");
	}
	tem2=null;//清空公共临时变量
	tem1=null;
	tem=null;
	datastr=null;
	NinaStr=null;
	yueStr=null;

	
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
</tr>
</table>
<br>

<div align="left" style='FONT-SIZE: 12px;border-collapse:collapse'>注：统计时间为客户的签约时间</div>
</body>
</html>


