<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");
String bc=cf.fillNull(request.getParameter("bc"));

if (khbh.equals(""))
{
	return;
}

if (!bc.equals(""))
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bgcolor="";

try {
	conn=cf.getConnection();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<form method="POST" name="listform" action="" target="_blank">

<table border="0" cellspacing="1" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"  >
	  <td colspan="11" height="30">
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		  <input type="button" value=' 修  改 ' onClick="f_do(listform)" name="sl">
		</td>
	</tr>
<tr bgcolor="#CCCCFF" height="20" align="center"  >
  <td width="9%">结构位置</td>
  <td width="9%">品牌</td>
  <td width="13%">名称</td>
  <td width="14%">型号</td>
  <td width="13%">规格</td>
  <td width="8%">数量</td>
  <td width="6%">原价</td>
  <td width="7%">单价</td>
  <td width="7%">远程费</td>
  <td width="7%">其它费项目</td>
  <td width="7%">其它费</td>
</tr>

<%
	int row1=-1;//同房间内行号


	//套餐升级分类编码:不为空
	String jgwzbm=null;
	String lrxh=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String zcbm=null;
	String zcmc=null;
	String ppmc=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double sl=0;
	double ycf=0;
	String qtfy=null;
	double qtfyje=0;

	ls_sql="SELECT zcpzwzbm,xh,zcdlbm,zcxlbm,zcbm,zcmc,ppmc,xinghao,gg,zcysbm,jldwbm,zqdj,dpzk,zqdj,dpzk,dj,sl,ycf,qtfy,qtfyje";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zcpzwzbm,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		lrxh=rs.getString("xh");
		zcdlbm=rs.getString("zcdlbm");
		zcxlbm=rs.getString("zcxlbm");

		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));


		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		ycf=rs.getDouble("ycf");
		qtfy=cf.fillNull(rs.getString("qtfy"));
		qtfyje=rs.getDouble("qtfyje");

		row1++;


		if (row1%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//输出每行数据
		%>
		<tr bgcolor="<%=bgcolor%>" align="center"  >
		  <td>
			<input type="hidden" name="lrxh" value="<%=lrxh%>">
		    <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:70PX"  >
				<option value=""></option>
				<%
				cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by xuhao",jgwzbm);
			%>
			  </select>			
		  </td>
		  <td><%=ppmc%></td>
		  <td><%=zcmc%></td>
		  <td align="left"><image src="del.jpg" style="cursor:hand" width="20" onclick="f_del(listform,<%=lrxh%>)"></image>&nbsp;<%=xinghao%></td>
		  <td><%=gg%></td>
		  <td>
			<input type="text" name="sl" size="6" value="<%=sl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ><%=jldwbm%></td>
		  </td>
		  <td><%=zqdj%></td>
		  <td align="left">
			<input type="text" name="dj" size="6" value="<%=dj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
		  </td>
		  <td>
			<input type="text" name="ycf" size="6" value="<%=ycf%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
		  </td>
		  <td>
			  <select name="qtfy" style="FONT-SIZE:12PX;WIDTH:58PX"  >
				<option value=""></option>
				<%
					cf.selectToken(out,"1+安装费&2+加工费&3+其它收费&W+无",qtfy);
				%>
			  </select>	
		  </td>
		  <td>
			<input type="text" name="qtfyje" size="6" value="<%=qtfyje%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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
      </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--


function f_do(formName)
{
	formName.action="SaveEditBj_khzcmxAll.jsp";
	formName.submit();
	return true;
} 

function f_del(formName,xh)
{
	if ( confirm("确实要删除吗?") )	
	{
		formName.action="DeleteBj_khzcmx.jsp?khbh=<%=khbh%>&xh="+xh;
		formName.submit();
		return true;
	}
} 

//-->
</script>

