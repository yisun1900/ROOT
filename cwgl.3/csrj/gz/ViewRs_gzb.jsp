<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khzq=null;
String ssfgs=null;
String fxrq=null;
String ksrq=null;
String zzrq=null;
String qqts=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khzq,ssfgs,fxrq,ksrq,zzrq,qqts,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  rs_gzb";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzq=cf.fillNull(rs.getString("khzq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		fxrq=cf.fillNull(rs.getDate("fxrq"));
		ksrq=cf.fillNull(rs.getDate("ksrq"));
		zzrq=cf.fillNull(rs.getDate("zzrq"));
		qqts=cf.fillNull(rs.getString("qqts"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>查看工资提成</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">查看工资提成</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核周期</td> 
  <td width="32%"> 
    <input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>发薪日期</td> 
  <td width="32%"> 
    <input type="text" name="fxrq" size="20" maxlength="10"  value="<%=fxrq%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>全勤天数</td> 
  <td width="32%"><input type="text" name="qqts" size="20" maxlength="9"  value="<%=qqts%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>工资开始日期</td>
  <td><input type="text" name="ksrq" size="20" maxlength="10"  value="<%=ksrq%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span>工资终止日期</td>
  <td><input type="text" name="zzrq" size="20" maxlength="10"  value="<%=zzrq%>" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <p>
	    <input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
	    <input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
	    <input type="button" onClick="window.open('DyGz.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')""  value="查看工资">
	    <input type="button" onClick="window.open('DcGz.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')""  value="导出工资">
	    <input type="button" onClick="window.open('DyBmGzTj.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')""  value="查看部门工资统计">
	    <input  type="button" onClick="window.open('DcBmGzTj.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')""  value="导出部门工资统计">
	  </p>
	  <p>
	    <input type="button" onClick="window.open('DyTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="查看提成">
	    <input type="button" onClick="window.open('DcTc.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')"  value="导出提成">
	      <input type="button" onClick="window.open('DyBmTcTj.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')""  value="查看部门提成统计">
	      <input type="button" onClick="window.open('DcBmTcTj.jsp?khzq=<%=wherekhzq%>&ssfgs=<%=wheressfgs%>')""  value="导出部门提成统计">
	  </p>
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

