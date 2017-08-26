<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bgypbm=null;
String dwbh=null;
String slr=null;
String jhlqsl=null;
String jhlqrq=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

double bzje=0;
double alllqje=0;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select bgypbm,dwbh,slr,jhlqsl,jhlqrq,bz ";
	ls_sql+=" from  oa_lqsq";
	ls_sql+=" where  (xh="+wherexh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bgypbm=cf.fillNull(rs.getString("bgypbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		slr=cf.fillNull(rs.getString("slr"));
		jhlqsl=cf.fillNull(rs.getString("jhlqsl"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();


	ls_sql="select je";
	ls_sql+=" from  oa_bgypbz";
	ls_sql+=" where dwbh='"+dwbh+"' and xm='"+slr+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bzje=rs.getDouble(1);
	}
	rs.close();

	if (jhlqrq==null || jhlqrq.equals(""))
	{
		out.println("错误!无[计划领取日期],不能修改,只能删除后重新录入");
		return;
	}

	String MonStart=jhlqrq.substring(0,8)+"01";
	String MonEnd=cf.lastDay(jhlqrq.substring(0,4),jhlqrq.substring(5,7));

	ls_sql="select sum(dj*jhlqsl)";
	ls_sql+=" from  oa_lqsq,oa_bgypbm";
	ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and jhlqrq>=TO_DATE('"+MonStart+"','YYYY-MM-DD')";
	ls_sql+=" and jhlqrq<=TO_DATE('"+MonEnd+"','YYYY-MM-DD')";
	ls_sql+=" and slr='"+slr+"' and dwbh='"+dwbh+"' ";
	ls_sql+=" and oa_bgypbm.fgsbh=(select ssfgs from sq_dwxx where dwbh='"+dwbh+"')";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		alllqje=rs.getDouble(1);
	}
	rs.close();


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

<form method="post" action="SaveEditOa_lqsq.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">单位</div>
              </td>
              <td width="29%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">申领人</div>
              </td>
              <td width="30%"> 
                <select name="slr" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_change(insertform)">
                  <%
	cf.selectItem(out,"select xm as bm,xm as mc from oa_bgypbz where dwbh='"+dwbh+"' order by dwbh,xm",slr);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">办公用品</div>
              </td>
              <td width="29%"> 
                <select name="bgypbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select bgypbm,bgypmc||'（'||dj||'元）' from oa_bgypbm,oa_lqfw,oa_flbm where oa_lqfw.flbm=oa_flbm.flbm and oa_bgypbm.flbm=oa_flbm.flbm and oa_lqfw.xm='"+slr+"' and oa_lqfw.dwbh='"+dwbh+"' and oa_bgypbm.fgsbh=(select ssfgs from sq_dwxx where dwbh='"+dwbh+"') order by bgypbm",bgypbm);
%> 
                </select>
              </td>
              <td colspan="2" align="center"> 可领取金额(<font color="#0000CC"><%=(bzje-alllqje)%></font>)=标准(<font color="#0000CC"><%=bzje%></font>)-已申请(<font color="#0000CC"><%=alllqje%></font>)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">计划领取数量</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jhlqsl" size="20" maxlength="8"  value="<%=jhlqsl%>" >
              </td>
              <td width="20%"> 
                <div align="right">计划领取日期</div>
              </td>
              <td width="30%">
                <input type="text" name="jhlqrq" size="20" maxlength="10"  value="<%=jhlqrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="57" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td width="21%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="29%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                </div>
              </td>
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
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
function f_change(FormName)
{               
	FormName.bgypbm.length=0;  

	if(	javaTrim(FormName.slr)=="") {
		return false;
	}

	parent.menu.aform.action="yrk_lrxxcx.jsp?dwbh=<%=dwbh%>&slr="+escape(escape(FormName.slr.value));
	parent.menu.aform.submit();
}                                                                                                                                                       

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请选择[申领人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.bgypbm)=="") {
		alert("请选择[办公用品]！");
		FormName.bgypbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jhlqsl)=="") {
		alert("请输入[计划领取数量]！");
		FormName.jhlqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.jhlqsl, "计划领取数量"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqrq)=="") {
		alert("请输入[计划领取日期]！");
		FormName.jhlqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "计划领取日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
