<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double cbj=0;
double sgcbj=0;
double sgdbj=0;
double zqdj=0;
double zk=0;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;

try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=cf.fillNull(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;'>
 <div align="center"><strong>自定义项目审核 </strong></div>
 <form method="post" action="" name="insertform" target="_blank">
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td width="20%" >设 计 师：<%=sjs%></td>
	<td width="56%" >客户地址：<%=fwdz%></td>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="3%" ><strong>序号</strong></td>
    <td  width="8%" ><strong>项目编号</strong></td>
    <td  width="15%" ><strong>项目名称</strong></td>
    <td  width="5%" ><strong>单位</strong></td>
    <td  width="5%" ><strong>工程量</strong></td>
	<td  width="6%" ><strong>成本价</strong></td>
	<td  width="6%" ><strong>施工成本价</strong></td>
	<td  width="6%" ><strong>工程基础报价</strong></td>
	<td  width="6%" ><strong>折前单价</strong></td>
	<td  width="5%" ><strong>折扣</strong></td>
	<td  width="6%" ><strong>折后单价</strong></td>
    <td  width="47%" ><strong>工艺材料简介</strong></td>
  </tr>

	
	
<%
	int i=0;

	//输出项目明细
	String bjlx=null;
	String xmflmc=null;
	double zqje=0;
	double zhje=0;

	ls_sql="SELECT bj_bjxmmx.bjlx,bj_bjxmmx.cbenj,bj_bjxmmx.sgcbj,bj_bjxmmx.sgdbj,bj_bjxmmx.xh,xmflmc,bj_bjxmmx.xmbh,xmmc,jldwmc,bj_bjxmmx.zqdj,bj_bjxmmx.zk,bj_bjxmmx.dj,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bdm_xmdlbm,bdm_xmflbm  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm ";
	ls_sql+=" and bj_bjxmmx.xmflbm=bdm_xmflbm.xmflbm(+) ";
	ls_sql+=" order by bj_bjxmmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjlx=cf.fillNull(rs.getString("bjlx"));
		cbj=rs.getDouble("cbenj");
		sgcbj=rs.getDouble("sgcbj");
		sgdbj=rs.getDouble("sgdbj");

		xh=cf.fillHtml(rs.getString("xh"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		xmflmc=cf.fillHtml(rs.getString("xmflmc"));

		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		zqdj=rs.getDouble("zqdj");
		zk=rs.getDouble("zk");
		dj=rs.getDouble("dj");

		gycl=cf.fillHtml(rs.getString("gycl"));
		flmcgg=cf.fillHtml(rs.getString("flmcgg"));
		bjbz=cf.fillHtml(rs.getString("bz"));

		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_gclmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sl=rs.getDouble(1);
		}
		rs1.close();
		ps1.close();

		row++;

		String bgcolor="";
		if (row%2==0)
		{
		   bgcolor="#FFFFFF";
		}
		else{
		   bgcolor="#E8E8FF";
		}

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			//输出每行数据
			%> 
			  <tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td ><%=cbj%></td>
				<td ><%=sgcbj%></td>
				<td ><%=sgdbj%></td>
				<td><%=zqdj%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td align="left"><%=gycl%></td>
			  </tr>
			<%
		}
		else{
			//输出每行数据
			%> 
			  <tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%>
					<input type="hidden" name="xmbh" value="<%=xmbh%>" > 
				</td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td ><%=cf.formatDouble(sl)%></td>
				<td>
					<input type="text" name="cbj" size="5" value="<%=cbj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
				</td>
				<td>
					<input type="text" name="sgcbj" size="5" value="<%=sgcbj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
				</td>
				<td>
					<input type="text" name="sgdbj" size="5" value="<%=sgdbj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
				</td>
				<td><%=zqdj%></td>
				<td><%=zk%></td>
				<td><%=dj%></td>
				<td align="left"><%=gycl%></td>
			  </tr>
			<%
		}
	}
	rs.close();
	ps.close();

	%> 


  <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="14"> 
    <input type="hidden" name="khbh" value="<%=khbh%>" > 

	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="button" onClick="window.open('\\dzbj\\zxbjmx\\ViewAllBj.jsp?khbh=<%=khbh%>')"  value="查看报价"> 

    </tr>
  
  </table>	
</form>
 


</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	

	FormName.action="SaveShzdyxm.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
