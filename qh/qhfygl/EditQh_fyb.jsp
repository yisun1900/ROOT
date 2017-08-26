<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sbxh=null;
String dwbh=null;
String sbrq=null;
String xxlybm=null;
String zl=null;
String sfjhn=null;
String tfsj=null;
String htfy=null;
String sjfy=null;
String htsfsp=null;
String bz=null;
String wheresbxh=cf.GB2Uni(request.getParameter("sbxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sbxh,dwbh,sbrq,xxlybm,zl,sfjhn,tfsj,htfy,sjfy,htsfsp,bz ";
	ls_sql+=" from  qh_fyb";
	ls_sql+=" where  (sbxh='"+wheresbxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sbxh=cf.fillNull(rs.getString("sbxh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sbrq=cf.fillNull(rs.getDate("sbrq"));
		xxlybm=cf.fillNull(rs.getString("xxlybm"));
		zl=cf.fillNull(rs.getString("zl"));
		sfjhn=cf.fillNull(rs.getString("sfjhn"));
		tfsj=cf.fillNull(rs.getString("tfsj"));
		htfy=cf.fillNull(rs.getString("htfy"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		htsfsp=cf.fillNull(rs.getString("htsfsp"));
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

<form method="post" action="SaveEditQh_fyb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">上报序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sbxh" size="20" maxlength="7"  value="<%=sbxh%>" >
              </td>
              <td width="15%"> 
                <div align="right">申报部门</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">申报日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sbrq" size="20" maxlength="10"  value="<%=sbrq%>" >
              </td>
              <td width="15%"> 
                <div align="right">费用媒体</div>
              </td>
              <td width="35%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm",xxlybm);
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">种类</div>
              </td>
              <td width="35%"> 
                <select name="zl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fyzldm,fyzlmc from qh_qhfyzlb order by fyzldm",zl);
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">是否计划内</div>
              </td>
              <td width="35%"> 
                <%
	cf.radioToken(out, "sfjhn","Y+是&N+否",sfjhn);
%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">投放时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="tfsj" size="20" maxlength="9"  value="<%=tfsj%>" >
              </td>
              <td width="15%"> 
                <div align="right">合同费用</div>
              </td>
              <td width="35%"> 
                <input type="text" name="htfy" size="20" maxlength="9"  value="<%=htfy%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">实际费用</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjfy" size="20" maxlength="9"  value="<%=sjfy%>" >
              </td>
              <td width="15%"> 
                <div align="right">合同是否审批</div>
              </td>
              <td width="35%"> 
                <%
	cf.radioToken(out, "htsfsp","Y+是&N+否",htsfsp);
%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
                <div align="right"></div>
              </td>
            </tr>
            <input type="hidden" name="wheresbxh"  value="<%=wheresbxh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.sbxh)=="") {
		alert("请输入[上报序号]！");
		FormName.sbxh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申报部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sbrq)=="") {
		alert("请输入[申报日期]！");
		FormName.sbrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbrq, "申报日期"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfjhn)) {
		alert("请选择[是否计划内]！");
		FormName.sfjhn[0].focus();
		return false;
	}
	if(!(isFloat(FormName.tfsj, "投放时间"))) {
		return false;
	}
	if(!(isFloat(FormName.htfy, "合同费用"))) {
		return false;
	}
	if(!(isFloat(FormName.sjfy, "实际费用"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
