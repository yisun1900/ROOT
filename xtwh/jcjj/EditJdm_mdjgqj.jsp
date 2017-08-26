<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mdjgqjbm=null;
String mdjgqj=null;
String qskd=null;
String zzkd=null;
String qsgd=null;
String zzgd=null;
String mlx=null;
String wheremdjgqjbm=cf.GB2Uni(request.getParameter("mdjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mdjgqjbm,mdjgqj,qskd,zzkd,qsgd,zzgd,mlx ";
	ls_sql+=" from  jdm_mdjgqj";
	ls_sql+=" where  (mdjgqjbm='"+wheremdjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mdjgqjbm=cf.fillNull(rs.getString("mdjgqjbm"));
		mdjgqj=cf.fillNull(rs.getString("mdjgqj"));
		qskd=cf.fillNull(rs.getString("qskd"));
		zzkd=cf.fillNull(rs.getString("zzkd"));
		qsgd=cf.fillNull(rs.getString("qsgd"));
		zzgd=cf.fillNull(rs.getString("zzgd"));
		mlx=cf.fillNull(rs.getString("mlx"));
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
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJdm_mdjgqj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">门洞价格区间编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mdjgqjbm" size="20" maxlength="2"  value="<%=mdjgqjbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">门洞价格区间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mdjgqj" size="20" maxlength="50"  value="<%=mdjgqj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">起始宽度（>）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qskd" size="20" maxlength="8"  value="<%=qskd%>" > mm
              </td>
              <td width="15%"> 
                <div align="right">终止宽度（<=）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzkd" size="20" maxlength="8"  value="<%=zzkd%>" > mm
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">起始高度（>）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qsgd" size="20" maxlength="8"  value="<%=qsgd%>" > mm
              </td>
              <td width="15%"> 
                <div align="right">终止高度（<=）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzgd" size="20" maxlength="8"  value="<%=zzgd%>" > mm
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">门类型</td>
              <td width="35%"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx",mlx);
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <input type="hidden" name="wheremdjgqjbm"  value="<%=wheremdjgqjbm%>" >
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
	if(	javaTrim(FormName.mdjgqjbm)=="") {
		alert("请输入[门洞价格区间编码]！");
		FormName.mdjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mdjgqj)=="") {
		alert("请输入[门洞价格区间]！");
		FormName.mdjgqj.focus();
		return false;
	}
	if(	javaTrim(FormName.qskd)=="") {
		alert("请输入[起始宽度]！");
		FormName.qskd.focus();
		return false;
	}
	if(!(isNumber(FormName.qskd, "起始宽度"))) {
		return false;
	}
	if(	javaTrim(FormName.zzkd)=="") {
		alert("请输入[终止宽度]！");
		FormName.zzkd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzkd, "终止宽度"))) {
		return false;
	}
	if(	javaTrim(FormName.qsgd)=="") {
		alert("请输入[起始高度]！");
		FormName.qsgd.focus();
		return false;
	}
	if(!(isNumber(FormName.qsgd, "起始高度"))) {
		return false;
	}
	if(	javaTrim(FormName.zzgd)=="") {
		alert("请输入[终止高度]！");
		FormName.zzgd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzgd, "终止高度"))) {
		return false;
	}
	if(	javaTrim(FormName.mlx)=="") {
		alert("请选择[门类型]！");
		FormName.mlx.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
