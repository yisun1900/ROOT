<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String jcjlh=request.getParameter("jcjlh");

String khbh=null;
String khxm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String rcjclxbm=null;//20100825增加检查类型
String xmbm=null;
String xmmc=null;
String rcjcdlmc=null;
String kpjg=null;
String ydcdmc=null;
String kpjgdy=null;
String kpcfmc=null;
String cfbz=null;
String kf=null;
String sgdfk=null;
String kcjdebl=null;

String bgcolor="#FFFFFF"  ;
int row=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT kp_gdrcjcjl.khbh,khxm";
	ls_sql+=" FROM kp_gdrcjcjl,crm_khxx ";
	ls_sql+=" where kp_gdrcjcjl.khbh=crm_khxx.khbh and kp_gdrcjcjl.jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
	}
	rs.close();
	ps.close();

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">日常检查项目（客户：<%=khxm%>）</font></B>
</CENTER>
<form method="POST" name="listform" action="SavePlInserKp_rcjcmx.jsp">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF">
	<td colspan="6" align="center"> 
	<input type="hidden" name="jcjlh"  value="<%=jcjlh%>" >
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="button" value='存盘' onClick="f_do(listform)">	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">检查类型</td>
	<td  width="14%">项目大类</td>
	<td  width="13%">项目编码</td>
	<td  width="24%">项目名称</td>
	<td  width="11%">检查结果</td>
	<td  width="28%">备注</td>
	</tr>
<%
	ls_sql="SELECT distinct dm_rcjcxm.xmbm,dm_rcjcxm.xmmc,dm_rcjcxm.rcjcdlbm,dm_rcjcdlbm.rcjcdlmc,DECODE(rcjclxbm,'1','木工前期','2','木工中期','3','木工后期','4','乳胶漆阶段','5','油漆阶段')rcjclxbm";
	ls_sql+=" FROM dm_rcjcxm,dm_rcjcdlbm  ";
    ls_sql+=" where dm_rcjcxm.rcjcdlbm=dm_rcjcdlbm.rcjcdlbm(+) ";
    ls_sql+=" order by dm_rcjcxm.rcjcdlbm,dm_rcjcxm.xmbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	
	while (rs2.next())
	{  
	    
		xmbm=cf.fillNull(rs2.getString("xmbm"));
		xmmc=cf.fillNull(rs2.getString("xmmc"));
		rcjcdlmc=cf.fillNull(rs2.getString("rcjcdlmc"));
         rcjclxbm=cf.fillNull(rs2.getString("rcjclxbm"));
       
			String jcjg="";
			String bz="";

			ls_sql="select jcjg,bz";
			ls_sql+=" from  kp_gdrcjcmx";
			ls_sql+=" where  jcjlh='"+jcjlh+"' and xmbm='"+xmbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				jcjg=cf.fillNull(rs1.getString("jcjg"));
				bz=cf.fillNull(rs1.getString("bz"));
				
			}
			rs1.close();
			ps1.close();


			if (row%2==1)
			{
				bgcolor="#FFFFFF";
			}
			else{
				bgcolor="#E8E8FF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
			     <td ><%=rcjclxbm%></td>
				<td ><%=rcjcdlmc%></td>
				<td ><%=xmbm%></td>
				<td align="left"><%=xmmc%></td>
				<td >
					<select name="jcjg" style="FONT-SIZE:12PX;WIDTH:52PX">
					  <option value=""></option>
					  <%
						cf.selectToken(out,"1+是&2+否",jcjg);
					  %>
					</select>

					<input type="hidden" name="xmbm"  value="<%=xmbm%>" >
				</td>
				<td  >
					<input type="text" name="bz" size="48" maxlength="200" value="<%=bz%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">				</td>
			</tr>
			<%

			row++;

	}
	rs2.close();
	ps2.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<tr bgcolor="#FFFFFF">
	<td colspan="6" align="center"> 
	<input type="button" value='存盘' onClick="f_do(listform)">	</td>
</tr>
</table>
</form> 
</html>

<script  LANGUAGE="javascript">
<!--

function f_do(formName)
{
/*	if (<%=row%>==1)
	{
		if (listform.jcjg.value=="")
		{
			alert("请选择[检查结果]！");
			listform.jcjg.focus();
			return false;
		}
	} 
	else{ 
		for (i=0;i <<%=row%>;i++ )
		{
			if (listform.jcjg[i].value=="")
			{
				alert("请选择[检查结果]！");
				listform.jcjg[i].focus();
				return false;
			}
		} 
	} 
 */
	formName.submit();
	return true;
}
//-->
</script>
