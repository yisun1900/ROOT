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

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="post" action="" name="editform" >
<div align="center">（位置：<%=jgwzbm%>）<B><font color="#FF0000">增减工程量，减项为负数</font></B></div>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#999999" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="6%">序号</td>
		<td width="9%">原工程量</td>
		<td width="11%">增减工程量</td>
		<td width="15%">项目编号</td>
		<td width="41%">项目名称</td>
		<td width="8%">计量单位</td>
		<td width="10%">单价</td>
	</tr>
<%
	int row=0;
	String bgcolor=null;
	double sl=0;
	String slstr="";
	ls_sql="select bj_bjxmmxh.xh,bj_bjxmmxh.dqbm,bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_gclmxh.sl";
	ls_sql+=" from  bj_bjxmmxh,jdm_jldwbm,bj_gclmxh";
	ls_sql+=" where  bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh and bj_gclmxh.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		zqdj=rs.getDouble("zqdj");
		sl=rs.getDouble("sl");

		double zjqsl=0;
		ls_sql="SELECT sl";
		ls_sql+=" from  bj_gclmxq";
		ls_sql+=" where  zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjqsl=rs1.getDouble("sl");
		}
		rs1.close();
		ps1.close();

		double zjsl=sl-zjqsl;
		zjsl=cf.round(zjsl,2);

		slstr=zjsl+"";

		if (slstr.endsWith(".0"))
		{
			slstr=slstr.substring(0,slstr.length()-2);
		}

		String zjqslStr=zjqsl+"";
		if (zjqslStr.endsWith(".0"))
		{
			zjqslStr=zjqslStr.substring(0,zjqslStr.length()-2);
		}

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
			slstr="";
		}
		else if (!slstr.equals(""))
		{
			xmmc="<font color='#FF0000'><B>"+xmmc+"</B></font>";
		}


		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=row%></td>
			<td><%=zjqslStr%>
				<input name="zjqsl" type="hidden" value="<%=zjqsl%>">
			</td>
			<td>
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input type="text" name="sl" size="6" value="<%=slstr%>" onFocus="if (<%=slstr%>==0 && parseInt(this.value)==0) this.value='';" onBlur="if (<%=slstr%>==0 && this.value=='') this.value='0'" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
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
			<td><%=zqdj%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	String styleStr=null;
	String buttonValue=null;
	if (row==0)
	{
		styleStr="FONT-SIZE: 12px;display:block";
		buttonValue="隐藏项目";
	}
	else{
		styleStr="FONT-SIZE: 12px;display:none";
		buttonValue="显示更多已选项";
	}
%>

</table>

<table border="0" cellspacing="1" cellpadding="1" width="100%" bgcolor="#999999" style='<%=styleStr%>'  id="id1">
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="6%">序号</td>
		<td width="9%">原工程量</td>
		<td width="11%">增减工程量</td>
		<td width="15%">项目编号</td>
		<td width="41%">项目名称</td>
		<td width="8%">计量单位</td>
		<td width="10%">单价</td>
	</tr>

<%
	ls_sql="select xh,dqbm,xmbh,xmmc,jldwmc,zqdj";
	ls_sql+=" from  bj_bjxmmxh,jdm_jldwbm";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_bjxmmxh.xmbh not in(select xmbh from bj_gclmxh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"')";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		zqdj=rs.getDouble("zqdj");


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
			<td>0
				<input name="zjqsl" type="hidden" value="0">
			</td>
			<td>
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input type="text" name="sl" size="6" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
			</td>
			<td align="left"><%=xmbh%></td>
			<td align="left"><%=xmmc%></td>
			<td><%=jldwbm%></td>
			<td><%=zqdj%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

%>
</table>

<table border="0" cellspacing="1" cellpadding="1" width="100%" bgcolor="#CCCCCC" style='FONT-SIZE: 12px'>
<tr> 
  <td colspan="7" > 
	<div align="center"> 
		<input type="hidden" name="xuhao"  value="<%=xuhao%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input name="dqbm" type="hidden" value="<%=dqbm%>">
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	  <input type="button"  value="<%=buttonValue%>" name="button1" onClick="if (button1.value=='显示更多已选项') { id1.style.display='block';button1.value='隐藏项目'; } else { id1.style.display='none';button1.value='显示更多已选项'; }">
	  <input type="reset"  value="重输">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<A HREF="XmToFjMain.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>"><B>增加房间内项目</B></A>	  
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

	FormName.action="SaveLrFjGcl2.jsp";
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
