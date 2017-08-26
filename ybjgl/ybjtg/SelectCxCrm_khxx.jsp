<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String sqbh=request.getParameter("sqbh");
	String dwstr=cf.getItemData("select dwbh,dwmc||'（'||dwdh||'）',ssdw from sq_dwxx where dwlx='4' order by ssdw,dwbh");
%>
<%

String fgflbm=null;
String zxjwbm=null;
String hxbm=null;
String hxmjbm=null;
String ysbm=null;
String cqbm=null;
String dwbh=null;
String ssfgs=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select fgflbm,zxjwbm,hxbm ,hxmjbm ,ysbm,dwbh";
	ls_sql+=" from  ybj_cgsq";
	ls_sql+=" where sqbh="+sqbh;
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	rs.close();

	ls_sql="select ssdw";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("ssdw");
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh='"+ssfgs+"' order by dwbh","");
%> 
                </select>
                <input type="hidden" name="sqbh" value="<%=sqbh%>" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">户型</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">风格分类</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">装修价位</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">面积</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">油色</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">样板间有效期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_ybjyxq" size="20" maxlength="10"  value="<%=cf.today()%>" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_ybjyxq2" size="20" maxlength="10">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
	if(!(isDatetime(FormName.crm_khxx_ybjyxq, "样板间有效期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_ybjyxq2, "样板间有效期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
