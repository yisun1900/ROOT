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
</head>

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

int xmpx=0;
String xh=null;
String xmbh=null;
String dqbm=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
String bjjbmc=null;
double zqdj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >

	  <table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" height="200" style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center">
          <td width="6%" >&nbsp;</td>
          <td width="6%" >序号</td>
          <td width="16%" >项目编号</td>
          <td width="44%">项目名称</td>
          <td width="8%" >单位</td>
          <td width="10%" >单价</td>
          <td width="10%" >工程量</td>
        </tr>
<%
	ls_sql="SELECT xh,xmbh,dqbm,xmmc,jldwmc,zqdj,bjjbmc,xmpx";
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
		zqdj=rs.getDouble("zqdj");
		xmpx=rs.getInt("xmpx");

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
          <td ><input name="xhbox" type="checkbox" value="<%=xh%>">
              <input name="xh" type="hidden" value="<%=xh%>">          </td>
          <td ><%=xmpx%></td>
          <td align="left"><a href="LrFjGcl1.jsp?khbh=<%=khbh%>&dqbm=<%=dqbm%>&xmbh=<%=xmbh%>" target="lrbjframe"><%=xmbh%></a></td>
          <td align="left"><%=xmmc%></td>
          <td  ><%=jldwmc%></td>
          <td ><%=zqdj%></td>
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
        <tr bgcolor="#FFFFFF">
          <td colspan="15" >
		  <input name="button" type=button onClick="cf_checkAll(listform)" value='全选' >
            <input name="button" type=button onClick="cf_delete(listform)" value='删除被选项目' >
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

parent.parent.guol.editform.xmlr.disabled=false;

var mark=1;
function cf_checkAll(formName)//转换字符串
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.xhbox.checked =false
		}
		else{
			formName.xhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.xhbox[i].checked =false
			}
			else{
				formName.xhbox[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}
function cf_delete(formName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( formName.xhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.xhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			formName.action="DeleteBj_bjxmmx.jsp";
			formName.submit();
			return true;
		}
	}
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

