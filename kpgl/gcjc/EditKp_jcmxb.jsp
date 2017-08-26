<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpxh=null;
String kpdlbm=null;
String kpxmbm=null;
String kpjg=null;
String kpcfbm=null;
String wherekpxh=cf.GB2Uni(request.getParameter("kpxh"));
String wherekpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select kpxh,kp_jcmxb.kpxmbm,kpdlbm,kp_jcmxb.kpjg,kpcfbm ";
	ls_sql+=" from  kp_jcmxb,kp_gckpxm";
	ls_sql+=" where  (kpxh="+wherekpxh+") and  (kp_jcmxb.kpxmbm='"+wherekpxmbm+"') ";
	ls_sql+=" and kp_jcmxb.kpxmbm=kp_gckpxm.kpxmbm";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		kpxh=cf.fillNull(rs.getString("kpxh"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpxmbm=cf.fillNull(rs.getString("kpxmbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息（<font color="#0000CC">考评序号：<%=kpxh%></font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_jcmxb.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评大类</div>
              </td>
              <td width="35%"> 
                <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getKpxm(insertform)">
<%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%> 
                </select>
              </td>
              <td rowspan="3"> 
                <div align="right"></div>
                <div align="right">考评处罚</div>
              </td>
              <td rowspan="3"> 
			  <%
				PreparedStatement ps1=null;
				ResultSet rs1=null;
				PreparedStatement ps2=null;
				ResultSet rs2=null;
				String kpcfbm1=null;
				String kpcfmc1=null;
				int row=0;
				try {
					conn=cf.getConnection();

					ls_sql="select kpcfbm,kpcfmc";
					ls_sql+=" from  kp_kpcfbm";
					ls_sql+=" order by kpcfbm ";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery(ls_sql);
					while (rs1.next())
					{
						row++;
						kpcfbm1=rs1.getString("kpcfbm");
						kpcfmc1=rs1.getString("kpcfmc");

						int count=0;
						ls_sql = "select count(*) from kp_kpkfbz";
						ls_sql+= " where kpxmbm='"+kpxmbm+"' and kpjg='"+kpjg+"' and kpcfbm='"+kpcfbm1+"'";
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery(ls_sql);
						if (rs2.next())
						{
							count=rs2.getInt(1);
						}
						ps2.close();
						rs2.close();

						if (count>0)//可选
						{
							ls_sql = "select count(*) from kp_jcmxb";
							ls_sql+= " where kpxmbm='"+kpxmbm+"' and kpxh='"+kpxh+"' and kpcfbm='"+kpcfbm1+"'";
							ps2= conn.prepareStatement(ls_sql);
							rs2 =ps2.executeQuery(ls_sql);
							if (rs2.next())
							{
								count=rs2.getInt(1);
							}
							ps2.close();
							rs2.close();

							if (count>0)//已选
							{
								%> 
								<input type="checkbox" name="kpcfbm" value="<%=kpcfbm1%>" checked><%=kpcfmc1%><BR>
								<%
							}
							else{
								%> 
								<input type="checkbox" name="kpcfbm" value="<%=kpcfbm1%>" ><%=kpcfmc1%><BR>
								<%
							}
						}
						else{
							%> 
							<input type="checkbox" name="kpcfbm" value="<%=kpcfbm1%>" disabled='true'><%=kpcfmc1%><BR>
							<%
						}
					
					}
					ps1.close();
					rs1.close();
				}
				catch (Exception e) {
					out.print("存盘失败,发生意外: " + e);
					return;
				}
				finally 
				{
					try{
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
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">考评项目</td>
              <td width="35%"> 
                <select name="kpxmbm" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getKpjg(insertform)">
<%
	cf.selectItem(out,"select distinct kpxmbm,kpxmmc from kp_gckpxm where kpdlbm='"+kpdlbm+"' order by kpxmbm",kpxmbm);
%> 
                </select>
                <input type="hidden" name="wherekpxh"  value="<%=wherekpxh%>" >
                <input type="hidden" name="wherekpxmbm"  value="<%=wherekpxmbm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评结果</div>
              </td>
              <td width="35%"> 
                <select name="kpjg" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getKpcf(insertform)">
<%
	cf.selectItem(out,"select distinct kpjg,DECODE(kpjg,1,'轻微违章',2,'严重违章',3,'特别严重') from kp_gckpxm where kpdlbm='"+kpdlbm+"' and kpxmbm='"+kpxmbm+"'",kpjg);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getKpxm(FormName)
{               
	FormName.kpxmbm.length=0;  
	FormName.kpjg.length=0;  
	for (var i=0;i<<%=row%> ;i++ )
	{
		FormName.kpcfbm[i].disabled=true;  
		FormName.kpcfbm[i].checked=false;  
	}

	if(	javaTrim(FormName.kpdlbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpdlbm="+FormName.kpdlbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpjg(FormName)
{               
	FormName.kpjg.length=0;  
	for (var i=0;i<<%=row%> ;i++ )
	{
		FormName.kpcfbm[i].disabled=true;  
		FormName.kpcfbm[i].checked=false;  
	}

	if(	javaTrim(FormName.kpxmbm)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?kpxmbm="+FormName.kpxmbm.value;
	parent.menu.aform.submit();

}                                                                                                                                                       

function getKpcf(FormName)
{               
	for (var i=0;i<<%=row%> ;i++ )
	{
		FormName.kpcfbm[i].disabled=true;  
		FormName.kpcfbm[i].checked=false;  
	}

	if(	javaTrim(FormName.kpjg)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?row=<%=row%>&kpxmbm="+FormName.kpxmbm.value+"&kpjg="+FormName.kpjg.value;
	parent.menu.aform.submit();

}                                                                                                                                                       
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("请选择[考评项目]！");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("请选择[考评结果]！");
		FormName.kpjg.focus();
		return false;
	}
	if (!radioChecked(FormName.kpcfbm)){
		alert("请选择[考评处罚]！");
//		FormName.kpcfbm[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
