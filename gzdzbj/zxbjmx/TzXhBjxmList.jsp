<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>调整项目顺序</title>
</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >
<CENTER>调整项目顺序</CENTER>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" height="200" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td width="12%" >项目排序</td>
	  <td width="16%" >项目编号</td>
	  <td width="34%">项目名称</td>
	  <td width="10%" >级别</td>
	  <td width="8%" >计量单位</td>
	  <td width="10%" >工程量合计</td>
	</tr>
<%
String khbh=request.getParameter("khbh");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xmpx=null;
String xh=null;
String xmbh=null;
String dqbm=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
String bjjbmc=null;
double dj=0;

int fjsl=0;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();
%>
        <%
	ls_sql="SELECT xh,xmbh,dqbm,xmmc,jldwmc,dj,bjjbmc,xmpx";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) and bj_bjxmmx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_bjxmmx.xmpx,bj_bjxmmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		xmbh=rs.getString("xmbh");
		dqbm=rs.getString("dqbm");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		bjjbmc=rs.getString("bjjbmc");
		dj=rs.getDouble("dj");
		xmpx=rs.getString("xmpx");

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		sl=0;
		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		if (sl==0)
		{
			slstr="&nbsp;";
		}
		else{
			slstr=cf.doubleTrimStr(sl,2);
		}

		row++;

		//输出每行数据
		%>
        <tr bgcolor="<%=bgcolor%>" align="center">
          <td >
			<input name="xh" type="hidden" value="<%=xh%>">
			<input type="text" name="xmpx" value="<%=xmpx%>" size="8" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xmpx[<%=row%>])">
		  </td>
          <td align="left"><%=xmbh%></td>
          <td align="left"><%=xmmc%></td>
          <td  ><%=bjjbmc%></td>
          <td  ><%=jldwmc%></td>
          <td> <%=slstr%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
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

if (row!=0)
{
	%>
        <tr bgcolor="#FFFFFF" align="center">
          <td colspan="15" >
			<input type="hidden" name="khbh" value="<%=khbh%>" >
		  <input name="button" type=button onClick="f_do(listform)" value='保存' >
        </tr>
        
        <%
}


%>
      </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(formName)
{
	formName.action="SaveTzXhBjxm.jsp";
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

