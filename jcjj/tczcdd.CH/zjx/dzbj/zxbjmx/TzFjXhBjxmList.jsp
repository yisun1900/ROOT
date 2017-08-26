<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>调整项目顺序</title>
</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >

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
String xmbhmc=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

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


try {
	conn=cf.getConnection();

%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#FFFFFF" align="center">
	  <td colspan="15" >
	  <input name="button" type=button onClick="f_do(listform)" value='保存' >
	</tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="8%">房间内序号</td>
    <td  width="8%">数量</td>
    <td  width="7%">项目序号</td>
    <td  width="12%">项目编号</td>
    <td  width="37%">项目名称</td>
    <td  width="8%">单价</td>
    <td  width="8%">单位</td>
    <td  width="12%">金额（元）</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx  ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjsl=rs.getDouble("sl");
			xjqye=rs.getDouble("je");
		}
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		
		//输出标题
		%> 
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"> 
      <div align="right"><b><i><font size="3">结构位置：<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        小计：<%=cf.formatDouble(xjqye,"#########.##")%>元</font></i></b></div>
    </td>
  </tr>
  <%
		//输出房间项目明细
		int fjnxh=0;
		int xmpx=0;
		ls_sql="SELECT bj_bjxmmx.xh,bj_bjxmmx.xmpx,bj_bjxmmx.xmbh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbhmc,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xmpx,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xmpx=rs.getInt("xmpx");
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmbhmc=cf.fillHtml(rs.getString("xmbhmc"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");

			row++;
			fjnxh++;
			//输出每行数据
			%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td>
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input name="jgwzbm" type="hidden" value="<%=jgwzmc%>">

				<input type="text" name="fjnxh" value="<%=fjnxh%>" size="5" maxlength="5" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(fjnxh[<%=row%>])">
			</td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=xmpx%></td>
			<td align="left"><%=xmbhmc%></td>
			<td align="left"><%=xmmc%></td>
			<td><%=dj%></td>
			<td><%=jldwmc%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		  <%
		}
		rs.close();
		ps.close();
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="8"><i><b><font size="3">直接费合计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></b></i></td>
  </tr>
	<tr bgcolor="#FFFFFF" align="center">
	  <td colspan="15" >
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input name="button" type=button onClick="f_do(listform)" value='保存' >
	</tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
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




<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(formName)
{
	formName.action="SaveTzFjXhBjxm.jsp";
	formName.submit();
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
</script>



