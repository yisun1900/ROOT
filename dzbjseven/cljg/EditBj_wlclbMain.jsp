<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cldlbm=null;
String glmc=null;
String pp=null;
String xhgg=null;
double dj=0;
double wljsbz=0;
String jldwbm=null;
String jsjldwbm=null;
String jswlbm=null;
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wlbm=cf.GB2Uni(request.getParameter("wlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT dqmc,cldlbm,wlbm,glmc,pp,xhgg,jldwbm,jsjldwbm,dj,wljsbz,lrr,lrsj,jswlbm ";
	ls_sql+="  FROM bj_jzcljgb,dm_dqbm";
	ls_sql+=" where (wlbm='"+wlbm+"' and bj_jzcljgb.dqbm=dm_dqbm.dqbm  )  ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
	    cldlbm=cf.fillNull(rs.getString("cldlbm"));
		wlbm=cf.fillNull(rs.getString("wlbm"));
		glmc=cf.fillNull(rs.getString("glmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		jsjldwbm=cf.fillNull(rs.getString("jsjldwbm"));
		pp=cf.fillNull(rs.getString("pp"));
		xhgg=cf.fillNull(rs.getString("xhgg"));
		dj=rs.getDouble("dj");
		wljsbz=rs.getDouble("wljsbz");
		jswlbm=cf.fillNull(rs.getString("jswlbm"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改物流材料价格表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="190" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">地区</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
              <td width="18%" align="right">材料类别</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm order by cldlmc",cldlbm);
					%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">物流材料编码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="wlbm" size="20" maxlength="16"  value="<%=wlbm%>" >
              </td>
              <td width="18%"> 
                <div align="right">物流计量单位</div>
              </td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">单价</td>
              <td width="31%"> 
                <input type="text" name="dj" size="20" maxlength="50"  value="<%=dj%>" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">材料名称</td>
              <td colspan="3"> 
                <input type="text" name="glmc" size="71" maxlength="100"  value="<%=glmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">型号规格</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="xhgg" size="71" maxlength="100"  value="<%=xhgg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">品牌</td>
              <td colspan="3"> 
                <input type="text" name="pp" size="71" maxlength="100"  value="<%=pp%>" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherewlbm"  value="<%=wlbm%>" >
                </div>
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





function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wlbm)=="") {
		alert("请输入[物流物料编码]！");
		FormName.wlbm.focus();
		return false;
	}
	
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料类别]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glmc)=="") {
		alert("请选择[材料名称]！");
		FormName.glmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[物流计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	
	if(	javaTrim(FormName.dj)=="") {
		alert("请选择[材料单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "材料单价"))) {
		return false;
	}
	
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区名称]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="SaveEditBj_wlcljgb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
