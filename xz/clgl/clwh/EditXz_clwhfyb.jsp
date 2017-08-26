<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>


<%

String djxh=null;
String qcph=null;
String xm=null;
String fy=null;
String djrq=null;
String jsr=null;
String pzr=null;
String bz=null;
String ssfgs=null;
String fyfsbm=null;
String wheredjxh=cf.GB2Uni(request.getParameter("djxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select djxh,qcph,xm,fy,djrq,jsr,pzr,bz,ssfgs,fyfsbm ";
	ls_sql+=" from  xz_clwhfyb";
	ls_sql+=" where  (djxh='"+wheredjxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		djxh=cf.fillNull(rs.getString("djxh"));
		qcph=cf.fillNull(rs.getString("qcph"));
		xm=cf.fillNull(rs.getString("xm"));
		fy=cf.fillNull(rs.getString("fy"));
		djrq=cf.fillNull(rs.getDate("djrq"));
		jsr=cf.fillNull(rs.getString("jsr"));
		pzr=cf.fillNull(rs.getString("pzr"));
		bz=cf.fillNull(rs.getString("bz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		fyfsbm=cf.fillNull(rs.getString("fyfsbm"));
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
      <div align="center"> 修改车辆附加费</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_clwhfyb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font>所属分公司</td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
                </select>
              </td>
              <td align="right" width="17%">费用发生部门</td>
              <td width="33%"> 
                <select name="fyfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh",fyfsbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>汽车牌号</td>
              <td width="32%"> 
                <select name="qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by ssfgs,qcph",qcph);
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by ssfgs,qcph",qcph);
	}
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#CC0000">*</font>项目</td>
              <td width="33%"> 
                <select name="xm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select clfjfmc c1,clfjfmc c2 from dm_clfjfbm order by clfjfbm",xm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>费用发生日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="djrq" size="20" maxlength="10"  value="<%=djrq%>" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>费用</div>
              </td>
              <td width="33%"> 
                <input type="text" name="fy" size="20" maxlength="9"  value="<%=fy%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>经手人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" size="20" maxlength="8"  value="<%=jsr%>" >
              </td>
              <td width="17%" align="right">批准人</td>
              <td width="33%"> 
                <input type="text" name="pzr" size="20" maxlength="8"  value="<%=pzr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheredjxh"  value="<%=wheredjxh%>" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.qcph)=="") {
		alert("请选择[汽车牌号]！");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("请选择[项目]！");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.djrq)=="") {
		alert("请输入[费用发生日期]！");
		FormName.djrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.djrq, "费用发生日期"))) {
		return false;
	}
	if(	javaTrim(FormName.fy)=="") {
		alert("请输入[费用]！");
		FormName.fy.focus();
		return false;
	}
	if(!(isFloat(FormName.fy, "费用"))) {
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[经手人]！");
		FormName.jsr.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
