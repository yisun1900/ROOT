<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String xjjlh=request.getParameter("xjjlh");

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

String kpxmbm=null;
String kpxmmc=null;
String kpdlmc=null;
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

	ls_sql="SELECT kp_xjgdjl.khbh,khxm";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx ";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjjlh='"+xjjlh+"'";
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
  <B><font size="3">违规项目（客户：<%=khxm%>）</font></B>
</CENTER>
<form method="POST" name="listform" action="SavePlInsertKp_xjgdmx.jsp">
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF">
	<td colspan="14" align="center"> 
	<input type="hidden" name="xjjlh"  value="<%=xjjlh%>" >
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="button" value='存盘' onclick="f_do(listform)">
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">违章次数</td>
	<td  width="4%">违规分级</td>
	<td  width="17%">备注</td>
	<td  width="3%">已违规</td>
	<td  width="6%">项目大类</td>
	<td  width="5%">项目编码</td>
	<td  width="16%">项目名称</td>
	<td  width="17%">违规分级</td>
	<td  width="4%">处罚分类</td>
	<td  width="16%">处罚标准</td>
	<td  width="3%">扣分</td>
	<td  width="3%">罚款</td>
	<td  width="3%">扣接单额比</td>
</tr>
<%
	ls_sql="SELECT distinct kp_gckpxm.kpxmbm,kp_gckpxm.kpxmmc,kp_gckpxm.kpdlbm,kp_kpdlbm.kpdlmc";
	ls_sql+=" FROM kp_gckpxm,kp_kpdlbm  ";
    ls_sql+=" where kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm(+) ";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_gckpxm.kpxmbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		kpxmbm=cf.fillNull(rs2.getString("kpxmbm"));
		kpxmmc=cf.fillNull(rs2.getString("kpxmmc"));
		kpdlmc=cf.fillNull(rs2.getString("kpdlmc"));


		int ywgcs=0;
		ls_sql="SELECT sum(wzcs)";
		ls_sql+=" FROM kp_xjgdmx,kp_xjgdjl ";
		ls_sql+=" where kp_xjgdmx.xjjlh=kp_xjgdjl.xjjlh and kp_xjgdmx.xjjlh!='"+xjjlh+"' and kp_xjgdjl.khbh='"+khbh+"' and kp_xjgdmx.kpxmbm='"+kpxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ywgcs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM kp_gckpxm ";
		ls_sql+=" where kp_gckpxm.kpxmbm='"+kpxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		ls_sql="SELECT kp_gckpxm.kpjg,kp_sgdyzcdbm.ydcdmc,kpjgdy,kpcfmc,cfbz,kp_gckpxm.kf,sgdfk,kcjdebl";
		ls_sql+=" FROM kp_gckpxm,kp_sgdyzcdbm,kp_kpcfbm  ";
		ls_sql+=" where kp_gckpxm.kpjg=kp_sgdyzcdbm.yzcdbm";
		ls_sql+=" and kp_gckpxm.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
		ls_sql+=" and kp_gckpxm.kpxmbm='"+kpxmbm+"'";
		ls_sql+=" order by kp_gckpxm.kpjg";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kpjg=cf.fillNull(rs.getString("kpjg"));
			ydcdmc=cf.fillNull(rs.getString("ydcdmc"));
			kpjgdy=cf.fillNull(rs.getString("kpjgdy"));
			kpcfmc=cf.fillNull(rs.getString("kpcfmc"));
			cfbz=cf.fillNull(rs.getString("cfbz"));
			kf=cf.fillNull(rs.getString("kf"));
			sgdfk=cf.fillNull(rs.getString("sgdfk"));
			kcjdebl=cf.fillNull(rs.getString("kcjdebl"));


			String wzcs="";
			String getkpjg="";
			String bz="";

			ls_sql="select wzcs,kpjg,bz";
			ls_sql+=" from  kp_xjgdmx";
			ls_sql+=" where  xjjlh='"+xjjlh+"' and kpxmbm='"+kpxmbm+"' and kpjg='"+kpjg+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				wzcs=cf.fillNull(rs1.getString("wzcs"));
				getkpjg=cf.fillNull(rs1.getString("kpjg"));
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
				<td rowspan="<%=count%>">
					<input type="hidden" name="kpxmbm"  value="<%=kpxmbm%>" >
					<select name="wzcs" style="FONT-SIZE:12PX;WIDTH:52PX" onchange="f_change(<%=row%>)">
					  <option value=""></option>
					  <%
						cf.selectToken(out,"1+1项&2+2项&3+3项&4+4项&5+5项&6+6项&7+7项&8+8项&9+9项&10+10项",wzcs);
					  %>
					</select>
				</td>
				<td rowspan="<%=count%>">
					<select name="kpjg" style="FONT-SIZE:12PX;WIDTH:60PX" >
					  <option value=""></option>
					  <%
						cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm,kp_gckpxm where kp_sgdyzcdbm.yzcdbm=kp_gckpxm.kpjg and kp_gckpxm.kpxmbm='"+kpxmbm+"' order by yzcdbm",getkpjg);
					  %> 
					</select>
				</td>
				<td rowspan="<%=count%>">
					<input type="text" name="bz" size="38" maxlength="200" value="<%=bz%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
				</td>
				<td rowspan="<%=count%>"><%=ywgcs%>次</td>
				<td rowspan="<%=count%>"><%=kpdlmc%></td>
				<td rowspan="<%=count%>"><%=kpxmbm%></td>
				<td rowspan="<%=count%>" align="left"><%=kpxmmc%></td>
				<td align="left"><%=ydcdmc%>：<%=kpjgdy%></td>
				<td><%=kpcfmc%></td>
				<td><%=cfbz%></td>
				<td><%=kf%></td>
				<td><%=sgdfk%></td>
				<td><%=kcjdebl%>%</td>
			</tr>
			<%

			row++;
		}

		while (rs.next())
		{
			kpjg=cf.fillNull(rs.getString("kpjg"));
			ydcdmc=cf.fillNull(rs.getString("ydcdmc"));
			kpjgdy=cf.fillNull(rs.getString("kpjgdy"));
			kpcfmc=cf.fillNull(rs.getString("kpcfmc"));
			cfbz=cf.fillNull(rs.getString("cfbz"));
			kf=cf.fillNull(rs.getString("kf"));
			sgdfk=cf.fillNull(rs.getString("sgdfk"));
			kcjdebl=cf.fillNull(rs.getString("kcjdebl"));


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td align="left"><%=ydcdmc%>：<%=kpjgdy%></td>
				<td><%=kpcfmc%></td>
				<td><%=cfbz%></td>
				<td><%=kf%></td>
				<td><%=sgdfk%></td>
				<td><%=kcjdebl%>%</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
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
	<td colspan="14" align="center"> 
	<input type="button" value='存盘' onclick="f_do(listform)">
	</td>
</tr>
</table>
</form> 
</html>

<script  LANGUAGE="javascript">
<!--
function f_change(row)
{
	if (listform.wzcs[row].value=="")
	{
		listform.kpjg[row].value="";
	}
} 
function f_do(formName)
{
	if (<%=row%>==1)
	{
		if (listform.wzcs.value!="")
		{
			if(listform.kpjg.value=="") {
				alert("请选择[违规分级]！");
				FormName.kpjg.focus();
				return false;
			}
		}
	} 
	else{ 
		for (i=0;i <<%=row%>;i++ )
		{
			if (listform.wzcs[i].value!="")
			{
				if(listform.kpjg[i].value=="") {
					alert("请选择[违规分级]！");
					FormName.kpjg[i].focus();
					return false;
				}
			}
		} 
	} 

	formName.submit();
	return true;
} 
//-->
</script>
