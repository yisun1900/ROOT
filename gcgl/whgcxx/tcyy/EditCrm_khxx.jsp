<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;

String dianz=null;
String weny=null;
String xqzg=null;
String xqzz=null;
String xqzy=null;
String wlyxzg=null;
String yxzy=null;
String wzch=null;
String wysj=null;
String wzcxy=null;
String dhzy=null;
String wztgy=null;
String siji=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,hth,sjs,dianz,weny,xqzg,xqzz,xqzy,wlyxzg,yxzy,wzch,wysj,wzcxy,dhzy,wztgy,siji ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));

		dianz=cf.fillNull(rs.getString("dianz"));
		weny=cf.fillNull(rs.getString("weny"));
		xqzg=cf.fillNull(rs.getString("xqzg"));
		xqzz=cf.fillNull(rs.getString("xqzz"));
		xqzy=cf.fillNull(rs.getString("xqzy"));
		wlyxzg=cf.fillNull(rs.getString("wlyxzg"));
		yxzy=cf.fillNull(rs.getString("yxzy"));
		wzch=cf.fillNull(rs.getString("wzch"));
		wysj=cf.fillNull(rs.getString("wysj"));
		wzcxy=cf.fillNull(rs.getString("wzcxy"));
		dhzy=cf.fillNull(rs.getString("dhzy"));
		wztgy=cf.fillNull(rs.getString("wztgy"));
		siji=cf.fillNull(rs.getString("siji"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_khxx.jsp" name="editform">
<div align="center">修改提成人员</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">合同号</font></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">房屋地址</font> </td>
    <td><%=fwdz%></td>
    <td align="right"><font color="#0000FF">设计师</font></td>
    <td><%=sjs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">店长</td> 
  <td width="32%"> 
    <input type="text" name="dianz" size="20" maxlength="20"  value="<%=dianz%>" >  </td>
  <td align="right" width="18%">文员</td> 
  <td width="32%"> 
    <input type="text" name="weny" size="20" maxlength="20"  value="<%=weny%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区主管</td> 
  <td width="32%"> 
    <input type="text" name="xqzg" size="20" maxlength="20"  value="<%=xqzg%>" >  </td>
  <td align="right" width="18%">小区组长</td> 
  <td width="32%"> 
    <input type="text" name="xqzz" size="20" maxlength="20"  value="<%=xqzz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区专员</td> 
  <td width="32%"> 
    <input type="text" name="xqzy" size="20" maxlength="20"  value="<%=xqzy%>" >  </td>
  <td align="right" width="18%">网络营销主管</td> 
  <td width="32%"> 
    <input type="text" name="wlyxzg" size="20" maxlength="20"  value="<%=wlyxzg%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">营销专员</td> 
  <td width="32%"> 
    <input type="text" name="yxzy" size="20" maxlength="20"  value="<%=yxzy%>" >  </td>
  <td align="right" width="18%">网站策划</td> 
  <td width="32%"> 
    <input type="text" name="wzch" size="20" maxlength="20"  value="<%=wzch%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">网页设计</td> 
  <td width="32%"> 
    <input type="text" name="wysj" size="20" maxlength="20"  value="<%=wysj%>" >  </td>
  <td align="right" width="18%">网站程序员</td> 
  <td width="32%"> 
    <input type="text" name="wzcxy" size="20" maxlength="20"  value="<%=wzcxy%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">电话专员</td> 
  <td width="32%"> 
    <input type="text" name="dhzy" size="20" maxlength="20"  value="<%=dhzy%>" >  </td>
  <td align="right" width="18%">网站推广员</td> 
  <td width="32%"> 
    <input type="text" name="wztgy" size="20" maxlength="20"  value="<%=wztgy%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">司机</td> 
  <td width="32%"> 
    <input type="text" name="siji" size="20" maxlength="20"  value="<%=siji%>" >  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
