<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sgd=null;
String pdsj=null;
String hfsj=null;
String hfr=null;
String hfjl=null;
String jjyy=null;
String hsqk=null;
String ldspjl=null;
String ldspyj=null;

String khxm=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String qye=null;
String pmjj=null;
String sgbz=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,sgd,pdsj,hfsj,hfr,hfjl,jjyy,hsqk,ldspjl,ldspyj ";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfjl=cf.fillNull(rs.getString("hfjl"));
		jjyy=cf.fillNull(rs.getString("jjyy"));
		hsqk=cf.fillNull(rs.getString("hsqk"));
		ldspjl=cf.fillNull(rs.getString("ldspjl"));
		ldspyj=cf.fillNull(rs.getString("ldspyj"));
	}
	rs.close();

	ls_sql="select khxm,fwdz,cqbm,lxfs,qye,pmjj,sgd,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qye=cf.fillNull(rs.getString("qye"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
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
<title>董事长审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 董事长审批</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> <%=khbh%> </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">客户姓名</td>
              <td width="35%"><%=khxm%></td>
              <td width="15%" align="right">联系方式</td>
              <td width="35%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">所属城区</td>
              <td width="35%"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%></td>
              <td width="15%" align="right">房屋地址</td>
              <td width="35%"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">签约额</td>
              <td width="35%"><%=qye%></td>
              <td width="15%" align="right">每平米均价</td>
              <td width="35%"><%=pmjj%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">施工队</td>
              <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh",sgd,true);
%></td>
              <td width="15%" align="right">施工班组</td>
              <td width="35%"><%=sgbz%>
				</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">派单时间</td>
              <td width="35%"><%=pdsj%></td>
              <td width="15%" align="right">派单人</td>
              <td width="35%"><%=hfr%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%"> 
                <div align="right">回复时间</div>
              </td>
              <td width="35%"><%=hfsj%> </td>
              <td width="15%"> 
                <div align="right">回复人</div>
              </td>
              <td width="35%"><%=hfr%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">拒绝原因</td>
              <td colspan="3"><%=jjyy%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="15%" align="right">核实情况</td>
              <td colspan="3"><%=hsqk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">领导审批结论</td>
              <td width="35%"> 
                <select name="ldspjl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+同意改派&N+保持原派",ldspjl);
%> 
                </select>
              </td>
              <td width="15%" align="right" bgcolor="#CCCCFF">回复结论</td>
              <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectToken(out,"0+未回复&4+接受派单&3+拒绝派单&5+保持原派",hfjl,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">领导审批意见</div>
              </td>
              <td colspan="3"> 
                <textarea name="ldspyj" cols="55" rows="3"><%=ldspyj%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td colspan="4" height="2"> 
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
	if(	javaTrim(FormName.ldspjl)=="") {
		alert("请输入[领导审批结论]！");
		FormName.ldspjl.focus();
		return false;
	}
	if(	javaTrim(FormName.ldspyj)=="") {
		alert("请输入[领导审批意见]！");
		FormName.ldspyj.focus();
		return false;
	}

	FormName.action="SaveSpPd_pdjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
