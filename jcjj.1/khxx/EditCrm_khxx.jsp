<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
%>
<%
String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String khlxbm=null;
String csrq=null;
String zybm=null;
String bz=null;
String xmzy=null;
String ssfgs=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,xb,fwdz,cqbm,lxfs,khlxbm,csrq,zybm,bz,xmzy,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		zybm=cf.fillNull(rs.getString("zybm"));
		bz=cf.fillNull(rs.getString("bz"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));

	
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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#000099">客户编号</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
              </td>
              <td width="18%"> 
                <div align="right">性别</div>
              </td>
              <td width="33%"><%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">所属城区</div>
              </td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">出生日期</td>
              <td width="31%"> 
                <input type="text" name="csrq" value="<%=csrq%>" size="20" maxlength="10">
              </td>
              <td width="20%" align="right">职业</td>
              <td width="30%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">项目专员</td>
              <td> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by ssfgs,yhmc",xmzy);
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' and ssfgs='"+ssfgs+"' order by yhmc",xmzy);
	}
				%> 
                </select>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3" ><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input type="button"  value="保存" onClick="f_do(editform,'bc')">
                  <input type="reset"  value="重输">
                  <input type="button"  value="转为家装咨询客户" onClick="f_do(editform,'zh')" name="button">
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

function f_do(FormName,lx)//参数FormName:Form的名称
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

	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[客户类型]！");
		FormName.khlxbm.focus();
		return false;
	}

	
	if (lx=='bc')
	{
		FormName.action="SaveEditCrm_khxx.jsp";
	}
	else{
		FormName.action="EditJcxJzCrm_khxx.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
