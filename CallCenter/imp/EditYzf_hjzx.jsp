<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xh=null;
String khbh=null;
String fywt=null;
String hfjg=null;
String clfs=null;
String hfbm=null;
String hfsj=null;
String zxy=null;
String zxz=null;
String xgbmclqk=null;
String clr=null;
String clsj=null;
String zdy=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,khbh,fywt,hfjg,clfs,hfbm,hfsj,zxy,zxz,xgbmclqk,clr,clsj,zdy,clzt,lrr,lrsj,lrbm ";
	ls_sql+=" from  yzf_hjzx";
	ls_sql+=" where  (xh="+wherexh+") and  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		fywt=cf.fillNull(rs.getString("fywt"));
		hfjg=cf.fillNull(rs.getString("hfjg"));
		clfs=cf.fillNull(rs.getString("clfs"));
		hfbm=cf.fillNull(rs.getString("hfbm"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		zxy=cf.fillNull(rs.getString("zxy"));
		zxz=cf.fillNull(rs.getString("zxz"));
		xgbmclqk=cf.fillNull(rs.getString("xgbmclqk"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));
		zdy=cf.fillNull(rs.getString("zdy"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<title>处理回访结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYzf_hjzx.jsp" name="editform">
<div align="center">处理回访结果</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">自动编号</span></td> 
  <td width="32%"><%=xh%>  </td>
  <td align="right" width="18%"><span class="STYLE2">客户编号</span></td> 
  <td width="32%"> <%=khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">回访结果</span></td>
  <td><%=hfjg%></td>
  <td align="right"><span class="STYLE2">处理方式</span></td>
  <td><%=clfs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">反映问题</span></td> 
  <td colspan="3"><%=fywt%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">回访部门</span></td> 
  <td width="32%"><%=hfbm%></td>
  <td align="right" width="18%"><span class="STYLE2">回访时间</span></td> 
  <td width="32%"><%=hfsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">座席员</span></td> 
  <td width="32%"><%=zxy%></td>
  <td align="right" width="18%"><span class="STYLE2">座席组</span></td> 
  <td width="32%"><%=zxz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">自定义</span></td> 
  <td width="32%"><%=zdy%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入人</span></td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2">录入时间</span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>处理人</td> 
  <td width="32%"> 
    <input type="text" name="clr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>处理时间</td> 
  <td width="32%"> 
    <input type="text" name="clsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>相关部门处理情况</td>
  <td colspan="3"><textarea name="xgbmclqk" cols="73" rows="4"><%=xgbmclqk%></textarea></td>
  </tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
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
	if(	javaTrim(FormName.clr)=="") {
		alert("请输入[处理人]！");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("请输入[处理时间]！");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "处理时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xgbmclqk)=="") {
		alert("请输入[相关部门处理情况]！");
		FormName.xgbmclqk.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
