<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sjjgrq=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;
//投诉记录号
String byjlh=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
	}
	rs.close();

	ls_sql="select count(*)";
	ls_sql+=" from  kp_byjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	byjlh=wherekhbh+cf.addZero(count+1,2);
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据（表扬记录号：<%=byjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_byjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">客户编号</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
                <input type="hidden" name="byjlh" value="<%=byjlh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">客户姓名</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">房屋地址</font></div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">设计师</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">施工队</font></div>
              </td>
              <td width="35%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">质检员</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="zjy" value="<%=zjxm%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#3333FF">交工日期</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="jgrq" value="<%=sjjgrq%>" size="20" maxlength="10" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#3333FF">合同号</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">受理时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
              <td width="15%"> 
                <div align="right">受理人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="slr" value="<%=yhdlm%>" size="20" maxlength="16" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">表扬对象</div>
              </td>
              <td width="35%"> 
                <select name="bydxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">施工队</option>
                  <option value="2">设计师</option>
                  <option value="3">质检员</option>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">表扬类型</div>
              </td>
              <td width="35%"> 
                <select name="bylxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="01">媒体</option>
                  <option value="02">信件</option>
                  <option value="03">造假</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">表扬内容</div>
              </td>
              <td colspan="3"> 
                <textarea name="bynr" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.byjlh)=="") {
		alert("请输入[表扬记录号]！");
		FormName.byjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isDatetime(FormName.jgrq, "交工日期"))) {
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("请输入[受理时间]！");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "受理时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请输入[受理人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.bydxlxbm)=="") {
		alert("请选择[表扬对象]！");
		FormName.bydxlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bylxbm)=="") {
		alert("请选择[表扬类型]！");
		FormName.bylxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bynr)=="") {
		alert("请输入[表扬内容]！");
		FormName.bynr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
