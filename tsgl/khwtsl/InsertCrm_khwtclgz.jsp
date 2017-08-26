<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String slbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;
//问题编号
String wtbh=null;
String ssfgs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();

	//所属单位
	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString(1);
	}
	rs.close();

	ls_sql="select NVL(max(substr(wtbh,8,2)),0)";
	ls_sql+=" from  crm_khwtclgz";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	wtbh=khbh+cf.addZero(count+1,2);
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
      <div align="center"> 受理客户问题（问题编号：<%=wtbh%>） </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_khwtclgz.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="34%"><%=khbh%></td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">合同号</font></div>
              </td>
              <td width="33%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="34%"> <%=khxm%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>
              </td>
              <td width="34%"> <%=sjs%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">质检员</font></div>
              </td>
              <td width="33%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>
              </td>
              <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#0000CC">实开工日期</font></td>
              <td width="34%"> <%=sjkgrq%> </td>
              <td width="17%" align="right"><font color="#0000CC">实交工日期</font></td>
              <td width="33%"> <%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">问题分类</div>
              </td>
              <td width="34%"> 
                <select name="wtflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wtflbm,wtflmc from dm_wtflbm order by wtflbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" value="<%=lxfs%>" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">问题说明</td>
              <td colspan="3"> 
                <textarea name="wtsm" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">要求解决时间</div>
              </td>
              <td width="34%"> 
                <input type="text" name="yqjjsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">客服受理时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">客服受理人</div>
              </td>
              <td width="34%"> 
                <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="33%"> 
                <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="wtbh" value="<%=wtbh%>">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wtbh)=="") {
		alert("请输入[问题编号]！");
		FormName.wtbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.wtsm)=="") {
		alert("请输入[问题说明]！");
		FormName.wtsm.focus();
		return false;
	}
	if(!(isDatetime(FormName.yqjjsj, "要求解决时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请输入[客服受理人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("请输入[客服受理时间]！");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "客服受理时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slbm)=="") {
		alert("请选择[录入部门]！");
		FormName.slbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
