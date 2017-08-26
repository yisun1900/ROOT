<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String dqmc=null;
String dqlbbm=null;
String xh=null;
String gg=null;
String jldw=null;
String cptz=null;
String cd=null;
String lsj=null;
String yhj=null;
String dwbh=null;
String zp=null;
String bz=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,dqmc,dqlbbm,xh,gg,jldw,cptz,cd,lsj,yhj,dwbh,zp,bz ";
	ls_sql+=" from  jc_cgdqbj";
	ls_sql+=" where  (dqbm='"+wheredqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dqmc=cf.fillNull(rs.getString("dqmc"));
		dqlbbm=cf.fillNull(rs.getString("dqlbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cptz=cf.fillNull(rs.getString("cptz"));
		cd=cf.fillNull(rs.getString("cd"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_cgdqbj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">电器编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dqbm" size="20" maxlength="5"  value="<%=dqbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">生产厂家</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc",dwbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">电器名称</td>
              <td width="35%"> 
                <input type="text" name="dqmc" size="20" maxlength="50"  value="<%=dqmc%>" >
              </td>
              <td width="15%" align="right">电器类别</td>
              <td width="35%"> 
                <select name="dqlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqlbbm,dqlbmc from jdm_dqlbbm order by dqlbbm",dqlbbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">型号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xh" size="20" maxlength="20"  value="<%=xh%>" >
              </td>
              <td width="15%"> 
                <div align="right">规格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" size="20" maxlength="20"  value="<%=gg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" >
              </td>
              <td width="15%"> 
                <div align="right">产地</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cd" size="20" maxlength="20"  value="<%=cd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">产品特征</td>
              <td colspan="3"> 
                <textarea name="cptz" cols="71" rows="3"><%=cptz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">零售价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >
              </td>
              <td width="15%"> 
                <div align="right">优惠价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhj" size="20" maxlength="9"  value="<%=yhj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">照片</td>
              <td colspan="3"> 
                <input type="text" name="zp" size="72" maxlength="50"  value="<%=zp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[电器编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqmc)=="") {
		alert("请输入[电器名称]！");
		FormName.dqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dqlbbm)=="") {
		alert("请选择[电器类别]！");
		FormName.dqlbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("请输入[零售价]！");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("请输入[优惠价]！");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "优惠价"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[生产厂家]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
