<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
%>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by ssfgs,dwbh");

String bdbh=null;
String bdmc=null;
String bdfj=null;
String fbsj=null;
String fbr=null;
String fbfw=null;
String fbfgs=null;
String fbbm=null;
String lrr=null;
String bz=null;
String lrsj=null;
String wherebdbh=request.getParameter("bdbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bdbh,bdmc,bdfj,fbsj,fbr,fbbm,lrr,bz,lrsj,fbfw,fbfgs ";
	ls_sql+=" from  xz_bdgl";
	ls_sql+=" where  (bdbh='"+wherebdbh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bdbh=cf.fillNull(rs.getString("bdbh"));
		bdmc=cf.fillNull(rs.getString("bdmc"));
		bdfj=cf.fillNull(rs.getString("bdfj"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		fbr=cf.fillNull(rs.getString("fbr"));
		fbbm=cf.fillNull(rs.getString("fbbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		bz=cf.fillNull(rs.getString("bz"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fbfw=cf.fillNull(rs.getString("fbfw"));
		fbfgs=cf.fillNull(rs.getString("fbfgs"));
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

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">发布分公司</td>
              <td width="35%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",fbfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fbfgs);
        out.println("        </select>");
	}
	%></td>
              <td width="15%" align="right">发布部门</td>
              <td width="35%"> 
                <select name="fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fbfgs+"' order by dwbh",fbbm);
		}
		else if (yhjs.equals("F0"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh",fbbm);
		}
		else
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",fbbm);
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">表单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="bdbh" size="20" maxlength="20"  value="<%=bdbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">发布范围</div>
              </td>
              <td width="35%"><%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			cf.radioToken(out, "fbfw","1+本公司&2+集团",fbfw);
		}
		else{
			cf.radioToken(out, "fbfw","1+本公司",fbfw);
		}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">表单名称</td>
              <td colspan="3"> 
                <input type="text" name="bdmc" size="73" maxlength="100"  value="<%=bdmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">发布人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbr" size="20" maxlength="20"  value="<%=fbr%>" >
              </td>
              <td width="15%"> 
                <div align="right">发布时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fbsj" size="20" maxlength="10"  value="<%=fbsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3" ><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherebdbh"  value="<%=wherebdbh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button" name="sc" value="上传附件" onClick="f_do1(editform)">
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
	if(	javaTrim(FormName.fbfgs)=="") {
		alert("请选择[发布分公司]！");
		FormName.fbfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.fbbm)=="") {
		alert("请选择[发布部门]！");
		FormName.fbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bdbh)=="") {
		alert("请输入[表单编号]！");
		FormName.bdbh.focus();
		return false;
	}
<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			%> 
			if(	!radioChecked(FormName.fbfw)) {
				alert("请选择[发布范围]！");
				FormName.fbfw[0].focus();
				return false;
			}
			<%
		}
		else{
			%> 
			if(!FormName.fbfw.checked) {
				alert("请输入[发布范围]！");
				FormName.fbfw.focus();
				return false;
			}
			<%
		}
%>
	if(	javaTrim(FormName.bdmc)=="") {
		alert("请输入[表单名称]！");
		FormName.bdmc.focus();
		return false;
	}

	if(	javaTrim(FormName.fbsj)=="") {
		alert("请输入[发布时间]！");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "发布时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fbr)=="") {
		alert("请输入[发布人]！");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.action="SaveEditXz_bdgl.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bdbh)=="") {
		alert("请输入[表单编号]！");
		FormName.bdbh.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
	
}
//-->
</SCRIPT>
