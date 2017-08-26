<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double dj=0;
String gycl=null;
String bjlx=null;
String bjjb=null;
String xuhao=null;
String sfbxx=null;
String zdyxmyxq=null;
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT xuhao";
	ls_sql+=" FROM bj_fjxxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		xuhao=rs1.getString(1);
	}
	rs1.close();
	ps1.close();
%>


<html>
<head>
<title>录入房间工程量</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="post" action="SaveLrFjGcl3.jsp" name="editform" >
<div align="center">录入房间工程量明细（位置：<%=jgwzbm%>）</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="5%">序号</td>
		<td width="10%">工程量</td>
		<td width="12%">项目编号</td>
		<td width="37%">项目名称</td>
		<td width="9%">计量单位</td>
		<td width="9%">单价</td>
		<td width="8%">是否必选项</td>
		<td width="10%">项目有效期</td>
	</tr>
<%
	int row=0;
	String bgcolor=null;
	ls_sql="select xh,dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwmc,dj,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlx,bjjbmc bjjb,DECODE(bj_bjxmmxh.sfbxx,'1','必报项','2','必列项','3','可选项','9','作废项') sfbxx,zdyxmyxq";
	ls_sql+=" from  bj_bjxmmxh,jdm_jldwbm,bdm_bjjbbm";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and bj_bjxmmxh.bjjb=bdm_bjjbbm.bjjbbm(+) and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+)";
    ls_sql+=" order by bj_bjxmmxh.xmpx,bj_bjxmmxh.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		zdyxmyxq=cf.fillHtml(rs.getDate("zdyxmyxq"));

		double sl=0;
		String slstr="";
		ls_sql="SELECT sl";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sl=rs1.getDouble(1);
			slstr=sl+"";
		}
		rs1.close();
		ps1.close();


		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=row%></td>
			<td>
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input type="text" name="sl" size="8" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
			</td>
		<%
		if (slstr.equals("0") || slstr.equals("0.0"))
		{
			xmbh="<font color='#0000CC'><B>"+xmbh+"</B></font>";
			xmmc="<font color='#0000CC'><B>"+xmmc+"</B></font>";
		}
		else if (!slstr.equals(""))
		{
			xmbh="<font color='#FF0000'><B>"+xmbh+"</B></font>";
			xmmc="<font color='#FF0000'><B>"+xmmc+"</B></font>";
		}

		%>
			<td align="left"><%=xmbh%></td>
			<td align="left"><%=xmmc%></td>
			<td><%=jldwbm%></td>
			<td><%=dj%></td>
			<td><%=sfbxx%></td>
			<td><%=zdyxmyxq%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>
<tr> 
  <td colspan="8" > 
	<div align="center"> 
		<input type="hidden" name="xuhao"  value="<%=xuhao%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
		<input type="hidden" name="dqbm" value="<%=dqbm%>">
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	  <input type="reset"  value="重输">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
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

	FormName.submit();
	return true;
}
function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</SCRIPT>
