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
String jldwbm=null;
double zqdj=0;
String xuhao=null;
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String bz="";
String gycl="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT xuhao";
	ls_sql+=" FROM bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=rs.getString(1);
	}
	rs.close();
	ps.close();
%>


<html>
<head>
<title>录入房间工程量</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" >
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="post" action="SaveLrFjGcl2.jsp" name="editform" >
<div align="center">录入房间工程量明细（位置：<%=jgwzbm%>）</div>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#999999" width="120%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="4%" rowspan="2">序号</td>
		<td width="5%" rowspan="2">工程量</td>
		<td width="11%" rowspan="2">项目编号</td>
		<td width="28%" rowspan="2">项目名称</td>
		<td width="6%" rowspan="2">计量单位</td>
		<td width="10%" colspan="2">单价</td>
		<td width="5%" rowspan="2">总额</td>
		<td width="31%" rowspan="2">工艺材料简介</td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center"> 
	<td width="5%">材料</td>
	<td width="5%">人工费</td>
	</tr>
<%
	int row=0;
	String bgcolor=null;
	double sl=0;
	String slstr="";
	double cldj=0;
	double rgdj=0;
	double zer=0;
	ls_sql="select bj_bjxmmx.xh,bj_bjxmmx.dqbm,bj_bjxmmx.gycl,bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.zqdj,bj_gclmx.sl,bj_gclmx.bz,bj_bjxmmx.cldj,bj_bjxmmx.rgdj";
	ls_sql+=" from  bj_bjxmmx,jdm_jldwbm,bj_gclmx";
	ls_sql+=" where  bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gycl=cf.fillNull(rs.getString("gycl"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		zqdj=rs.getDouble("zqdj");
		sl=rs.getDouble("sl");
		bz=cf.fillNull(rs.getString("bz"));
		cldj=rs.getDouble("cldj");
		rgdj=rs.getDouble("rgdj");

		slstr=sl+"";
		zer=sl*zqdj;
		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		if (slstr.equals("0") || slstr.equals("0.0"))
		{
			xmmc="<font color='#0000CC'><B>"+xmmc+"</B></font>";
			slstr="0";
		}
		else if (!slstr.equals(""))
		{
			xmmc="<font color='#FF0000'><B>"+xmmc+"</B></font>";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=row%></td>
			<td>
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input type="hidden" name="zqdj" value="<%=zqdj%>">
				<input type="text" name="sl" size="6" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])" onChange="dos(editform)">
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
			<td><%=cldj%></td>
			<td><%=rgdj%></td>
			<td><%=cf.round(zer,2)%></td>
			<td><%=gycl%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	String styleStr=null;
	String buttonValue=null;
	if (row==0)
	{
		styleStr="FONT-SIZE: 12px;display:none";
		buttonValue="增加新项目";
	}
	else{
		styleStr="FONT-SIZE: 12px;display:none";
		buttonValue="增加新项目";
	}
%>

</table>

<table border="0" cellspacing="1" cellpadding="1" width="120%" bgcolor="#999999" style='<%=styleStr%>'  id="id1">
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="4%" rowspan="2">序号</td>
		<td width="5%" rowspan="2">工程量</td>
		<td width="11%" rowspan="2">项目编号</td>
		<td width="28%" rowspan="2">项目名称</td>
		<td width="6%" rowspan="2">计量单位</td>
		<td width="10%" colspan="2">单价</td>
		<td width="5%" rowspan="2">总额</td>
		<td width="31%" rowspan="2">工艺材料简介</td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center"> 
	<td width="5%">材料</td>
	<td width="5%">人工费</td>
	</tr>

<%
	ls_sql="select xh,gycl,dqbm,xmbh,xmmc,jldwmc,zqdj,bj_bjxmmx.cldj,bj_bjxmmx.rgdj";
	ls_sql+=" from  bj_bjxmmx,jdm_jldwbm";
	ls_sql+=" where  khbh='"+khbh+"' and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_bjxmmx.xmbh not in(select xmbh from bj_gclmx where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"')";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gycl=cf.fillNull(rs.getString("gycl"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		zqdj=rs.getDouble("zqdj");
		cldj=rs.getDouble("cldj");
		rgdj=rs.getDouble("rgdj");

		
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
				<input type="text" name="sl" size="6" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
			</td>
			<td align="left"><%=xmbh%></td>
			<td align="left"><%=xmmc%></td>
			<td><%=jldwbm%></td>
			<td><%=cldj%></td>
			<td><%=rgdj%></td>
			<td><%=cf.round(zer,2)%></td>
			<td><%=gycl%></td>

		</tr>
		<%

	}
	rs.close();
	ps.close();

%>
</table>

<table border="0" cellspacing="1" cellpadding="1" width="120%" bgcolor="#CCCCCC" style='FONT-SIZE: 12px'>
<tr> 
  <td colspan="7" > 
	<div align="center"> 
		<input type="hidden" name="xuhao"  value="<%=xuhao%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input name="dqbm" type="hidden" value="<%=dqbm%>">
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	  <input type="button"  value="<%=buttonValue%>" name="button1" onClick="if (button1.value=='增加新项目') { id1.style.display='block';button1.value='隐藏项目'; } else { id1.style.display='none';button1.value='增加新项目'; }">
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
