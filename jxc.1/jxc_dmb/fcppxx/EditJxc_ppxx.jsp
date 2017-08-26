<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String pplb=null;
String cldl=null;
String scsmc=null;
String bz=null;
String mrazhs=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String cwdm=null;
String ppfzr=null;


String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,pplb,cldl,scsmc,bz,sfyyh,yhkssj,yhjzsj,yhnr,cwdm,mrazhs,ppfzr ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where  (ppbm="+whereppbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		pplb=cf.fillNull(rs.getString("pplb"));
		cldl=cf.fillNull(rs.getString("cldl"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		bz=cf.fillNull(rs.getString("bz"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		mrazhs=cf.fillNull(rs.getString("mrazhs"));
		ppfzr=cf.fillNull(rs.getString("ppfzr"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_ppxx.jsp" name="insertform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>子品牌编码</span></td>
    <td><input type="text" name="ppbm" size="10" maxlength="8"  value="<%=ppbm%>" readonly>
      （不可修改） </td>
    <td align="right">财务代码</td>
    <td><input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>子品牌名称</td>
    <td colspan="3"><input type="text" name="ppmc" size="73" maxlength="50"  value="<%=ppmc%>" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌类别</td>
  <td width="32%">
  <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"2+辅材",pplb);
%> 
  </select></td>
  <td width="18%" align="right"><span class="STYLE1">*</span>品牌</td>
  <td width="32%"><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc c1,scsmc c2 from jxc_scsxx where scslb in('2','3')  order by scsmc",scsmc);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>材料大类</td>
  <td><select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc",cldl);
%>
  </select></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>




<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="70" rows="2"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--



function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.pplb)=="") {
		alert("请选择[子品牌类别]！");
		FormName.pplb.focus();
		return false;
	}
	if(	javaTrim(FormName.cldl)=="") {
		alert("请选择[材料大类]！");
		FormName.cldl.focus();
		return false;
	}


	if(	javaTrim(FormName.scsmc)=="") {
		alert("请输入[品牌]！");
		FormName.scsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
