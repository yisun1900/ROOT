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
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

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
String jgwzbm=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();


%>


<form method="post" action="" name="editform" >
<div align="center"> <b>增加套餐材料（客户编号：<%=khbh%>）</b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
      <td align="center" colspan="11"> 
		<input name="khbh" type="hidden" value="<%=khbh%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="存盘">
      </td>
    </tr>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">序号</td>
    <td  width="8%" align="center">3D代码</td>
    <td  width="8%" align="center">项目名称</td>
    <td  width="8%" align="center">材料编码</td>
    <td  width="21%" align="center">材料名称</td>
    <td  width="6%" align="center">单位</td>
    <td  width="6%" align="center">标准数量</td>
    <td  width="6%" align="center">增值数量</td>
    <td  width="8%" align="center">产品品牌</td>
    <td  width="8%" align="center">型号</td>
    <td  width="47%" align="center">工艺做法及材料说明</td>
  </tr>
<%

	//输出项目明细

	ls_sql="SELECT distinct bj_gclmx.xmbh,bj_bjxmmx.xmmc";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bdm_xmdlbm.xmdlmc='套餐'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" order by bj_gclmx.xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmbh=cf.fillNull(rs1.getString("xmbh"));
		xmmc=cf.fillNull(rs1.getString("xmmc"));


		String glbxh=null;
		String wlbm=null;
		String glmc=null;
		String pp=null;
		String gg=null;
		String xl=null;
		double xhl=0;
		double zzsl=0;
		String bz=null;
		ls_sql="SELECT glbxh,glmc,pp,xh,gg,xl,jldwmc,xhl,zzsl,dj,wlbm,bz";
		ls_sql+=" FROM bj_khglfxb,jdm_jldwbm ";
		ls_sql+=" where bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
		ls_sql+=" order by bj_khglfxb.wlbm ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			glbxh=cf.fillNull(rs.getString("glbxh"));
			glmc=cf.fillHtml(rs.getString("glmc"));
			pp=cf.fillHtml(rs.getString("pp"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			xl=cf.fillHtml(rs.getString("xl"));
			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			xhl=rs.getDouble("xhl");
			zzsl=rs.getDouble("zzsl");
			dj=rs.getDouble("dj");
			wlbm=cf.fillHtml(rs.getString("wlbm"));
			bz=cf.fillHtml(rs.getString("bz"));

			String zzslStr="";
			if (zzsl!=0)
			{
				zzslStr=zzsl+"";
			}

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center"><%=row%>
				<input name="glbxh" type="hidden" value="<%=glbxh%>" >
				<input name="xmbh" type="hidden" value="<%=xmbh%>" >
				</td>
				<td align="center"><%=xmbh%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center"><%=wlbm%></td>
				<td align="center"><%=glmc%></td>
				<td align="center"><%=jldwmc%></td>
				<td align="center"><%=cf.formatDouble(xhl)%></td>
				<td align="center">
				<input name="zzsl" type="text" value="<%=zzslStr%>" size="9" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 

				</td>
				<td align="center"><%=pp%></td>
				<td align="center"><%=xh%></td>
				<td align="left"><%=bz%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();
	
	

%> 
</table>
</form>


</body>
</html>

<%
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
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SaveZjtccl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>





