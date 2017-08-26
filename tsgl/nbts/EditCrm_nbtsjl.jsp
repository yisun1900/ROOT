<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwlx,dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<%

String tsjlh=null;
String btsr=null;
String tsnr=null;
String tsr=null;
String tssj=null;
String slr=null;
String slsj=null;
String slbm=null;
String clzt=null;
String clr=null;
String clkssj=null;
String cljssj=null;
String clqk=null;
String btsfgs=null;
String btsbm=null;
String slfgs=null;
String wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,btsr,tsnr,tsr,tssj,slr,slsj,slbm,clzt,clr,clkssj,cljssj,clqk,slfgs,btsbm,btsfgs";
	ls_sql+=" from  crm_nbtsjl";
	ls_sql+=" where  (tsjlh="+wheretsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		btsr=cf.fillNull(rs.getString("btsr"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		tsr=cf.fillNull(rs.getString("tsr"));
		tssj=cf.fillNull(rs.getDate("tssj"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slbm=cf.fillNull(rs.getString("slbm"));
		clzt=cf.fillNull(rs.getString("clzt"));
		clr=cf.fillNull(rs.getString("clr"));
		clkssj=cf.fillNull(rs.getDate("clkssj"));
		cljssj=cf.fillNull(rs.getDate("cljssj"));
		clqk=cf.fillNull(rs.getString("clqk"));
		slfgs=cf.fillNull(rs.getString("slfgs"));
		btsbm=cf.fillNull(rs.getString("btsbm"));
		btsfgs=cf.fillNull(rs.getString("btsfgs"));
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
      <div align="center"> 请修改内部反馈信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_nbtsjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>反馈记录号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="tsjlh" size="20" maxlength="8"  value="<%=tsjlh%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>被反馈人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="btsr" size="20" maxlength="20"  value="<%=btsr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>被反馈分公司</td>
              <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"btsfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(btsfgs,btsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",btsfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"btsfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+btsfgs+"'",btsfgs);
        out.println("        </select>");
	}
%> </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>被反馈部门</td>
              <td width="33%"> 
                <select name="btsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+btsfgs+"' and cxbz='N'  order by dwbh",btsbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>反馈时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="tssj" size="20" maxlength="10"  value="<%=tssj%>" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>反馈人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="tsr" size="20" maxlength="20"  value="<%=tsr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="slsj" size="20" maxlength="10"  value="<%=slsj%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="slr" size="20" maxlength="20"  value="<%=slr%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入分公司</font></div>
              </td>
              <td width="33%"> 
                <select name="slfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slfgs+"'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></div>
              </td>
              <td width="33%"> 
                <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>反馈内容</td>
              <td colspan="3"> 
                <textarea name="tsnr" cols="71" rows="7"><%=tsnr%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheretsjlh"  value="<%=wheretsjlh%>" >
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
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[投诉记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.tsjlh, "投诉记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.btsfgs)=="") {
		alert("请输入[被投诉分公司]！");
		FormName.btsfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.btsbm)=="") {
		alert("请输入[被投诉部门]！");
		FormName.btsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.btsr)=="") {
		alert("请输入[被投诉人]！");
		FormName.btsr.focus();
		return false;
	}
	if(	javaTrim(FormName.tsnr)=="") {
		alert("请输入[投诉内容]！");
		FormName.tsnr.focus();
		return false;
	}
	if(	javaTrim(FormName.tsr)=="") {
		alert("请输入[投诉人]！");
		FormName.tsr.focus();
		return false;
	}
	if(	javaTrim(FormName.tssj)=="") {
		alert("请输入[投诉时间]！");
		FormName.tssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tssj, "投诉时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请输入[录入人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("请输入[录入时间]！");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slbm)=="") {
		alert("请选择[录入部门]！");
		FormName.slbm.focus();
		return false;
	}
	if(	javaTrim(FormName.slfgs)=="") {
		alert("请选择[录入分公司]！");
		FormName.slfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
