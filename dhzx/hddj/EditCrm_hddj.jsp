<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwstr=cf.getItemData("select dwbh,dwmc||'（'||dwdh||'）',ssdw from sq_dwxx where dwlx='4' order by ssdw,dwbh");
%>
<%

String khbh=null;
String khxm=null;
String xb=null;
String lxfs=null;
String cqbm=null;
String fwdz=null;
String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;
String bz=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,xb,lxfs,cqbm,fwdz,cgdz,hdsgd,hdsgbz,hdsjs,bz ";
	ls_sql+=" from  crm_hddj";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
		hdsjs=cf.fillNull(rs.getString("hdsjs"));
		bz=cf.fillNull(rs.getString("bz"));
	}
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

<form method="post" action="SaveEditCrm_hddj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" size="20" maxlength="20"  value="<%=khxm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">性别</div>
              </td>
              <td width="35%"> 
                <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"M+男&W+女",xb);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" size="20" maxlength="100"  value="<%=lxfs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所属城区</div>
              </td>
              <td width="35%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">回单设计师</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hdsjs" size="20" maxlength="20"  value="<%=hdsjs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">拟装修地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="57" maxlength="100"  value="<%=fwdz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">回单装修地址</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" size="57" maxlength="100"  value="<%=cgdz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">回单施工队</div>
              </td>
              <td width="35%"> 
                <select name="hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(hdsgd,hdsgbz,<%=dwstr%>)">
                  <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh",hdsgd);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">回单班组</div>
              </td>
              <td width="35%"> 
                <select name="hdsgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+hdsgd+"' order by dwbh",hdsgbz);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[拟装修地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.cgdz)=="") {
		alert("请输入[回单装修地址]！");
		FormName.cgdz.focus();
		return false;
	}
	if(	javaTrim(FormName.hdsgd)=="") {
		alert("请输入[回单施工队]！");
		FormName.hdsgd.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
