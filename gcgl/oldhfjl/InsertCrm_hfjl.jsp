<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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
String khbh=request.getParameter("khbh");
String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	//回访记录号
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_hfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	
	hfjlh=khbh+cf.addZero(count+1,2);

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


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center"><b>（<%=khxm%>）</b>旧回访数据录入（回访记录号：<%=hfjlh%>）</div>

<table width="100%">
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_hfjl.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">设计师</td>
              <td width="37%">设计方案：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa","");
%><br>
                后期服务：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw","");
%><br>
                交底清楚：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk","");
%> </td>
              <td width="15%" align="right">设计师回访内容</td>
              <td width="35%"> 
                <textarea name="sjshfnr" rows="3" cols="33"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">工程担当</td>
              <td width="37%">服务：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw","");
%><br>
                到位：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw","");
%><br>
                尽责：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz","");
%></td>
              <td width="15%" align="right">工程担当回访内容</td>
              <td width="35%"> 
                <textarea name="zjyhfnr" rows="3" cols="33"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">施工队</td>
              <td width="37%">服务素质：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz","");
%><br>
                施工质量：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl","");
%><br>
                工人素质：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz","");
%> </td>
              <td width="15%" align="right">施工队回访内容</td>
              <td width="35%"> 
                <textarea name="sgdhfnr" rows="3" cols="33"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">回访类型</td>
              <td width="37%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option  value="24" selected>完工回访</option>
                </select>
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
              </td>
              <td width="15%" align="right">&nbsp;</td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%" align="right">回访时间</td>
              <td width="37%"> 
                <input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">回访人</td>
              <td width="35%"> 
                <input type="text" name="hfr" value="<%=yhdlm%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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

	if(	javaTrim(FormName.hfr)=="") {
		alert("请输入[回访人]！");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("请输入[回访时间]！");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "回访时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
