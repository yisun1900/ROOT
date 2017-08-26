<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
</head>

<%
String whereckph=request.getParameter("ckph");
String khbh=request.getParameter("khbh");
String dwbh=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改出库单明细(出库批号:<%=whereckph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;<input type="hidden" name="ckph" value="<%=whereckph%>">
	<input type="hidden" name="khbh" value="<%=khbh%>"></td>
	<td  width="3%">序号</td>
	<td  width="12%">材料名称</td>
	<td  width="12%">材料规格</td>
	<td  width="12%">材料大类</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">类型</td>
	<td  width="8%">出库单价</td>
	<td  width="8%">出库数量</td>
</tr>

<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
double gdj=0;
String cksl=null;
String cldlmc=null;
String jldwmc=null;
String leixing=null;
String lxmc=null;
String lx="";

try {
	conn=cf.getConnection();

/*
	ls_sql=" select lx";
	ls_sql+=" from cl_ckd";
	ls_sql+=" where ckph='"+whereckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();
*/
	lx="1";

	
	ls_sql="SELECT ckph,cl_ckmx.clbm clbm,cl_ckmx.clmc,cl_ckmx.clgg,gdj,cksl,cldlmc,jldwmc,leixing,DECODE(leixing,'1','正常','2','赠送') lxmc ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+whereckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=rs.getDouble("gdj");
		cksl=cf.fillNull(rs.getString("cksl"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		leixing=cf.fillNull(rs.getString("leixing"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td align="center"><A HREF="deleteclckmx.jsp?ckph=<%=whereckph%>&clbm=<%=clbm%>&leixing=<%=leixing%>&gdj=<%=gdj%>" target="_blank">删除</A>
		</td>
		<td> 
			<div align="center"><%=i%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</div>
		</td>
		<td> 
			<div align="center"><%=clmc%></div>
			<input type="hidden" name="clmc" value="<%=clmc%>">
			<input type="hidden" name="leixing" value="<%=leixing%>">
		</td>
		<td> 
			<div align="center"><%=clgg%></div>
		</td>
		<td> 
			<div align="center"><%=cldlmc%></div>
		</td>
		<td> 
			<div align="center"><%=jldwmc%></div>
		</td>
		<td> 
			<div align="center"><%=lxmc%></div>
		</td>
		<td> 
			<input type="text" name="gdj" size="8" maxlength="10" value=<%=gdj%> readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gdj[<%=(row+1)%>])" >
		</td>
		<td> 
			<input type="text" name="cksl" size="8" maxlength="10" value=<%=cksl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cksl[<%=(row+1)%>])" >
		</td>
		</tr>
<%
	row++;
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
      <td colspan="9" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;

	  <input type=button value=' 存 盘 ' onClick="cf_submit(listform)" name="sl">
      <input type="reset" value=' 重 输 ' name="reset" >      </td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function cf_submit(FormName)
{
	var len=<%=i%>-0;
	var m=0,val;
	if (len<=1)
	{
		val=FormName.gdj.value-0;
//		alert(FormName.gdj.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.gdj)=="") {
			alert("材料【"+FormName.clmc.value+"】"+"出库单价不能为空!!!");
			FormName.gdj.focus();
			return false;
		}
		if (!(isFloat(FormName.gdj,"材料【"+FormName.clmc.value+"】"))){
			FormName.gdj.focus();     
			return      
		   }

		val=FormName.cksl.value-0;
//		alert(FormName.cksl.value+">>>>"+m+">>>>>"+len);
		if(	javaTrim(FormName.cksl)=="") {
			alert("材料【"+FormName.clmc.value+"】"+"出库数量不能为空!!!");
			FormName.cksl.focus();
			return false;
		}
		if (!(isFloat(FormName.cksl,"材料【"+FormName.clmc.value+"】"))){
			FormName.cksl.focus();     
			return      
		}

<%
		if (lx.equals("2"))//1：出库；2：退货
		{
			%>
			if (val>0)
			{
				alert("因为是退货，【"+FormName.clmc.value+"】"+"出库数量要录入负数!!!");
				FormName.cksl.select(); 
				return false;
			}
			<%
		}
		else{
			%>
			if (val<=0)
			{
				alert("【"+FormName.clmc.value+"】"+"出库数量不能小于或者等于零!!!");
				FormName.cksl.select(); 
				return false;
			}
			<%
		}
%>
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (m=0;m<len ;m++ )
		{
			val=FormName.gdj[m].value-0;
	//		alert(FormName.gdj[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.gdj[m])=="") {
				alert("材料【"+FormName.clmc[m].value+"】"+"出库单价不能为空!!!");
				FormName.gdj[m].focus();
				return false;
			}
			if (!(isFloat(FormName.gdj[m],"【"+FormName.clmc[m].value+"】"))){
				FormName.gdj[m].focus();     
				return      
			   }

			val=FormName.cksl[m].value-0;
	//		alert(FormName.cksl[m].value+">>>>"+m+">>>>>"+len);
			if(	javaTrim(FormName.cksl[m])=="") {
				alert("材料【"+FormName.clmc[m].value+"】"+"出库数量不能为空!!!");
				FormName.cksl[m].focus();
				return false;
			}
			if (!(isFloat(FormName.cksl[m],"【"+FormName.clmc[m].value+"】"))){
				FormName.cksl[m].focus();     
				return      
			}

<%
		if (lx.equals("2"))//1：出库；2：退货
		{
			%>
			if (val>0)
			{
				alert("因为是退货，【"+FormName.clmc[m].value+"】"+"出库数量要录入负数!!!");
				FormName.cksl[m].select(); 
				return false;
			}
			<%
		}
		else{
			%>
			if (val<=0)
			{
				alert("【"+FormName.clmc[m].value+"】"+"出库数量不能小于或者等于零!!!");
				FormName.cksl[m].select(); 
				return false;
			}	
			<%
		}
%>

		}
	}
	FormName.action="updateclckmx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

