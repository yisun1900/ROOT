<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String dsksjbz=request.getParameter("dsksjbz");

String sksj=request.getParameter("sksj");
String sksj2=request.getParameter("sksj2");

String fgs=request.getParameter("fgs");
String fgsmc=null;
String dwbh=request.getParameter("dwbh");
String dwmc=null;

String zffsbm = null;
String zffsmc = null;
String fklxbm=null;
String fkcs=null;
double fkje=0;

double jz1=0;//一期款
double jz2=0;//二期款
double jz3=0;//尾款
double mm=0;//木门
double jdcp1=0;//橱柜
double jdcp2=0;//家具
double zc=0;//主材
double htdj=0;//合同定金
double lfdj=0;//量房定金
double sjf=0;//设计费
double zffszj=0;//小计

double zjz1=0;
double zjz2=0;
double zjz3=0;
double zmm=0;
double zjdcp1=0;
double zjdcp2=0;
double zzc=0;
double zhtdj=0;
double zlfdj=0;
double zsjf=0;
double zj=0;

Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

try 
{

conn=cf.getConnection();

ls_sql="select dwmc from sq_dwxx where dwbh='"+fgs+"'";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery(ls_sql);
if(rs.next())
{
	fgsmc=rs.getString("dwmc");
}
rs.close();
ps.close();

ls_sql="select dwmc from sq_dwxx where dwbh='"+dwbh+"'";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery(ls_sql);
if(rs.next())
{
	dwmc=rs.getString("dwmc");
}
rs.close();
ps.close();

if (fgs!=null)
{
	if (!(fgs.equals("")))
	{
		wheresql+=" and  fgsbh='"+fgs+"'";
		out.println("<br>分公司："+fgsmc+"</br>");
	}	
}

if (dwbh!=null)
{
	if (!(dwbh.equals("")))
	{
		wheresql+=" and  dwbh='"+dwbh+"'";
		out.println("<br>签约店面："+dwmc+"</br>");
	}
	
}

if (sksj!=null)
{
	if (!(sksj.equals("")))	
	{
		wheresql+=" and  sksj>=TO_DATE('"+sksj+"','YYYY-MM-DD')";
		out.println("<br>收款时间：");
		out.println("从");
		out.println(sksj);
	}
}

if (sksj2!=null)
{
	if (!(sksj2.equals(""))) 
	{
		wheresql+=" and  sksj<=TO_DATE('"+sksj2+"','YYYY-MM-DD')";
		out.println("到");
		out.println(sksj2);
		out.println("</br>");
	}
}

if (dsksjbz!=null)
{
	if (!(dsksjbz.equals("")))
	{
		wheresql+=" and  dsksjbz='"+dsksjbz+"'";
		if(dsksjbz.equals("Y"))
			out.println("<br>是否审核：已审核</br>");
		else{
			out.println("<br>是否审核：未审核</br>");
		}
	}	
}



%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面收款统计</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
<td  width="11%">类别</td>
  <td  width="9%">合同定金</td>
  <td  width="9%">量房定金</td>
  <td  width="8%">一期款</td>
  <td  width="8%">二期款</td>
  <td  width="8%">尾款</td>
  <td  width="8%">设计费</td>
  <td  width="8%">主材</td>
  <td  width="8%">基地产品</td>
  <td  width="8%">松下亿达门</td>
  <td  width="15%">小计</td>
</tr>
<%
	ls_sql="SELECT zffsbm,zffsmc";
	ls_sql+=" FROM cw_zffsbm";
//	ls_sql+=" where zffsbm not in ('15','16')";
	ls_sql+=" order by zffsbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		zffsbm=rs.getString("zffsbm");
		zffsmc=rs.getString("zffsmc");

		jz1=0;
		jz2=0;
		jz3=0;
		mm=0;
		jdcp1=0;
		jdcp2=0;
		zc=0;
		htdj=0;
		lfdj=0;
		sjf=0;
		zffszj=0;

		ls_sql="SELECT fklxbm,fkcs,sum(fkje) fkje";
		ls_sql+=" FROM cw_khfkjl";
		ls_sql+=" where zffs='"+zffsbm+"'";
		ls_sql+=wheresql;
		ls_sql+=" and fklxbm in ('11','21','22','23','24','51','52','53') and scbz='N'";
		ls_sql+=" group by fklxbm,fkcs";
		ls_sql+=" order by fklxbm";
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);

		while(rs1.next())	
		{
			fklxbm=rs1.getString("fklxbm");
			fkcs=rs1.getString("fkcs");
			fkje=rs1.getDouble("fkje");

			if(fklxbm.equals("11"))
			{
				if(fkcs.equals("1"))
				{
					jz1=fkje;
					zjz1+=fkje;
				}
				if(fkcs.equals("2"))
				{
					jz2=fkje;
					zjz2+=fkje;
				}
				if(fkcs.equals("3"))
				{
					jz3=fkje;
					zjz3+=fkje;
				}
			}

			if(fklxbm.equals("21"))
			{
				mm=fkje;
				zmm+=fkje;
			}

			if(fklxbm.equals("22"))
			{
				jdcp1=fkje;
				zjdcp1+=fkje;
			}

			if(fklxbm.equals("24"))
			{
				jdcp2=fkje;
				zjdcp2+=fkje;
			}

			if(fklxbm.equals("23"))
			{
				zc=fkje;
				zzc+=fkje;
			}
			if(fklxbm.equals("51"))
			{
				htdj=fkje;
				zhtdj+=fkje;
			}
			if(fklxbm.equals("52"))
			{
				lfdj=fkje;
				zlfdj+=fkje;
			}
			if(fklxbm.equals("53"))
			{
				sjf=fkje;
				zsjf+=fkje;
			}
			zffszj+=fkje;
		}
		rs1.close();
		ps1.close();
		zj+=zffszj;
%>
<tr   align="center">
	<td ><%=zffsmc%></td>
	<td ><%=htdj%></td>
	<td ><%=lfdj%></td>
	<td ><%=jz1%></td>
	<td ><%=jz2%></td>
	<td ><%=jz3%></td>
	<td ><%=sjf%></td>
	<td ><%=zc%></td>
	<td ><%=(jdcp1+jdcp2)%></td>
	<td ><%=mm%></td>
	<td ><%=zffszj%></td>
</tr>
<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("发生意外: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td >总计</td>
	<td ><%=zhtdj%></td>
	<td ><%=zlfdj%></td>
	<td ><%=zjz1%></td>
	<td ><%=zjz2%></td>
	<td ><%=zjz3%></td>
	<td ><%=zsjf%></td>
	<td ><%=zzc%></td>
	<td ><%=(zjdcp1+zjdcp2)%></td>
	<td ><%=zmm%></td>
	<td ><%=zj%></td>
</tr>
</table>

</body>
</html>