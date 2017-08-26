<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT xmmc,dqmc,xmdlmc,xmxlmc";
	ls_sql+=" FROM bj_jzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and bj_jzbjb.dqbm=dm_dqbm.dqbm and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
	}
	else{
		out.println("错误！项目不存在");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>家装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="SaveInsertBj_jzglfxb.jsp" name="editform" target="_blank">
  <div align="center">录入家装工料分析表
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr> 
        <td width="19%">地区：<%=dqmc%></td>
        <td width="47%">项目大类：<%=xmdlbm%></td>
        <td width="34%">项目小类：<%=xmxlbm%></td>
      </tr>
      <tr> 
        <td width="19%">项目编号：<%=xmbh%></td>
        <td width="47%">项目名称：<%=xmmc%></td>
        <td width="34%">报价级别： <%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%> </td>
      </tr>
    </table>
  </div>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="4%">序号</td>
      <td width="7%">工料分类</td>
      <td width="12%">结算材料编码</td>
      <td width="18%">工料名称</td>
      <td width="7%">计量单位</td>
      <td width="8%">消耗量</td>
      <td width="8%">单价</td>
      <td width="18%">品牌</td>
      <td width="18%">型号规格</td>
    </tr>
    <%
	String bgcolor=null;

	for (int row=0;row<30 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td><%=(row+1)%></td>
      <td> 
        <select name="glflbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(wlbm[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="wlbm" size="12" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glmc[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="glmc" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[<%=row%>])">
      </td>
      <td> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:52PX" onKeyUp="keyGo(xhl[<%=row%>])">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc","");
					%> 
        </select>
      </td>
      <td> 
        <input type="text" name="xhl" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dj[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="dj" size="6" maxlength="15" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(pp[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="pp" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xhgg[<%=row%>])">
      </td>
      <td> 
        <input type="text" name="xhgg" size="20" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(glflbm[<%=(row+1)%>])">
      </td>
    </tr>
    <%

	}
%> 
    <tr> 
      <td colspan="8" height="47" > 
        <div align="center"> 
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          <input type="reset"  value="重输">
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
