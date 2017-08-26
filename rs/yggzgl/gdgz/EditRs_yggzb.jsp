<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String bianhao=null;
String yhmc=null;
String dwmc=null;
String glgz=null;
String gwgz=null;
String jbgz=null;
String jtbt=null;
String cb=null;
String dhbt=null;
String yjsxe=null;
String jj=null;
String qtbt=null;
String qtkk=null;
String tc=null;
String ksk=null;
String bz=null;
String sqgz=null;
String shgz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,bianhao,yhmc,dwmc,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,ksk,rs_yggzb.bz,sqgz,shgz ";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and  (xh='"+wherexh+"') and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		glgz=cf.fillNull(rs.getString("glgz"));
		gwgz=cf.fillNull(rs.getString("gwgz"));
		jbgz=cf.fillNull(rs.getString("jbgz"));
		jtbt=cf.fillNull(rs.getString("jtbt"));
		cb=cf.fillNull(rs.getString("cb"));
		dhbt=cf.fillNull(rs.getString("dhbt"));
		yjsxe=cf.fillNull(rs.getString("yjsxe"));
		jj=cf.fillNull(rs.getString("jj"));
		qtbt=cf.fillNull(rs.getString("qtbt"));
		qtkk=cf.fillNull(rs.getString("qtkk"));
		tc=cf.fillNull(rs.getString("tc"));
		ksk=cf.fillNull(rs.getString("ksk"));
		bz=cf.fillNull(rs.getString("bz"));
		sqgz=cf.fillNull(rs.getString("sqgz"));
		shgz=cf.fillNull(rs.getString("shgz"));
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
      <div align="center"> 请修改工资信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditRs_yggzb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000FF">员工序号</font></td>
              <td width="35%"><%=ygbh%></td>
              <td width="15%" align="right"><font color="#0000FF">工号</font></td>
              <td width="35%"><%=bianhao%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">员工姓名</font></div>
              </td>
              <td width="35%"><%=yhmc%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">所属部门</font></div>
              </td>
              <td width="35%"><%=dwmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">工龄工资</div>
              </td>
              <td width="35%"> 
                <input type="text" name="glgz" size="20" maxlength="9"  value="<%=glgz%>"  onKeyUp="keyGo(gwgz)">
              </td>
              <td width="15%"> 
                <div align="right">岗位工资</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gwgz" size="20" maxlength="9"  value="<%=gwgz%>"  onKeyUp="keyGo(jbgz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">底薪</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jbgz" size="20" maxlength="9"  value="<%=jbgz%>"  onKeyUp="keyGo(jtbt)">
              </td>
              <td width="15%"> 
                <div align="right">交通补贴</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jtbt" size="20" maxlength="9"  value="<%=jtbt%>"  onKeyUp="keyGo(cb)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">每日餐补</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cb" size="20" maxlength="9"  value="<%=cb%>" onKeyUp="keyGo(dhbt)">
              </td>
              <td width="15%"> 
                <div align="right">电话补</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dhbt" size="20" maxlength="9"  value="<%=dhbt%>" onKeyUp="keyGo(yjsxe)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">扣保费</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yjsxe" size="20" maxlength="9"  value="<%=yjsxe%>" onKeyUp="keyGo(jj)">
              </td>
              <td width="15%"> 
                <div align="right">奖金</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jj" size="20" maxlength="9"  value="<%=jj%>" onKeyUp="keyGo(qtbt)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">其它补贴</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qtbt" size="20" maxlength="9"  value="<%=qtbt%>" onKeyUp="keyGo(qtkk)">
              </td>
              <td width="15%"> 
                <div align="right">其它扣款</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qtkk" size="20" maxlength="9"  value="<%=qtkk%>" onKeyUp="keyGo(tc)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">提成</div>
              </td>
              <td width="35%"> 
                <input type="text" name="tc" size="20" maxlength="9"  value="<%=tc%>" onKeyUp="keyGo(ksk)">
              </td>
              <td width="15%"> 
                <div align="right">扣税款</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ksk" size="20" maxlength="9"  value="<%=ksk%>" onKeyUp="keyGo(sqgz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">税前工资</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sqgz" size="20" maxlength="9"  value="<%=sqgz%>" onKeyUp="keyGo(shgz)">
              </td>
              <td width="15%"> 
                <div align="right">税后工资</div>
              </td>
              <td width="35%">
                <input type="text" name="shgz" size="20" maxlength="9"  value="<%=shgz%>" onKeyUp="keyGo(bz)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
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
	if(!(isFloat(FormName.glgz, "工龄工资"))) {
		return false;
	}
	if(!(isFloat(FormName.gwgz, "岗位工资"))) {
		return false;
	}
	if(!(isFloat(FormName.jbgz, "底薪"))) {
		return false;
	}
	if(!(isFloat(FormName.jtbt, "交通补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.cb, "每日餐补"))) {
		return false;
	}
	if(!(isFloat(FormName.dhbt, "电话补"))) {
		return false;
	}
	if(!(isFloat(FormName.yjsxe, "扣保费"))) {
		return false;
	}
	if(!(isFloat(FormName.jj, "奖金"))) {
		return false;
	}
	if(!(isFloat(FormName.qtbt, "其它补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.qtkk, "其它扣款"))) {
		return false;
	}
	if(!(isFloat(FormName.tc, "提成"))) {
		return false;
	}
	if(!(isFloat(FormName.ksk, "扣税款"))) {
		return false;
	}
	if(!(isFloat(FormName.sqgz, "税前工资"))) {
		return false;
	}
	if(!(isFloat(FormName.shgz, "税后工资"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
