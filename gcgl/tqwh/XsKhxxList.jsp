<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>选择合并客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="POST" name="listform">
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCFF"  align="center"> 
      <td colspan="10" height="29"><B>选择－－删除客户</B></td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">&nbsp;</td>
      <td  width="8%">客户编号</td>
      <td  width="10%">合同号</td>
      <td  width="10%">客户姓名</td>
      <td  width="26%">房屋地址</td>
      <td  width="8%">设计师</td>
      <td  width="8%">施工队</td>
      <td  width="8%">工程担当</td>
      <td  width="8%">工程进度</td>
      <td  width="10%">签约日期</td>
    </tr>
<%
String ssfgs=request.getParameter("ssfgs");

String wheresql1=" and crm_khxx.fgsbh='"+ssfgs+"'";
String wheresql2=" and crm_khxx.fgsbh='"+ssfgs+"'";


String hth1=request.getParameter("hth1");
String khbh1=request.getParameter("khbh1");
String khxm1=request.getParameter("khxm1");
String fwdz1=request.getParameter("fwdz1");

String hth2=request.getParameter("hth2");
String khbh2=request.getParameter("khbh2");
String khxm2=request.getParameter("khxm2");
String fwdz2=request.getParameter("fwdz2");

if (hth1!=null)
{
	hth1=cf.GB2Uni(hth1);
	if (!(hth1.equals("")))	wheresql1+=" and  (crm_khxx.hth='"+hth1+"')";
}
if (khbh1!=null)
{
	khbh1=cf.GB2Uni(khbh1);
	if (!(khbh1.equals("")))	wheresql1+=" and  (crm_khxx.khbh='"+khbh1+"')";
}
if (khxm1!=null)
{
	khxm1=cf.GB2Uni(khxm1);
	if (!(khxm1.equals("")))	wheresql1+=" and  (crm_khxx.khxm like '%"+khxm1+"%')";
}
if (fwdz1!=null)
{
	fwdz1=cf.GB2Uni(fwdz1);
	if (!(fwdz1.equals("")))	wheresql1+=" and  (crm_khxx.fwdz like '%"+fwdz1+"%')";
}

if (hth2!=null)
{
	hth2=cf.GB2Uni(hth2);
	if (!(hth2.equals("")))	wheresql2+=" and  (crm_khxx.hth='"+hth2+"')";
}
if (khbh2!=null)
{
	khbh2=cf.GB2Uni(khbh2);
	if (!(khbh2.equals("")))	wheresql2+=" and  (crm_khxx.khbh='"+khbh2+"')";
}
if (khxm2!=null)
{
	khxm2=cf.GB2Uni(khxm2);
	if (!(khxm2.equals("")))	wheresql2+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
}
if (fwdz2!=null)
{
	fwdz2=cf.GB2Uni(fwdz2);
	if (!(fwdz2.equals("")))	wheresql2+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int row1=0;
int row2=0;
try {
	conn=cf.getConnection();

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String zjxm=null;
	String gcjdmc=null;
	String sgdmc=null;
	String qyrq=null;

	ls_sql="select khbh,hth,khxm,fwdz,sjs,zjxm,gcjdmc,sgdmc,qyrq";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_sgd";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+) "+wheresql1;
//	ls_sql+=" and crm_khxx.gcjdbm!='5' ";
	ls_sql+=" and rownum<30";
	ls_sql+=" order by khxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=rs.getString("khxm");
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));

		row1++;

		%> 
    <tr align="center" bgcolor="#FFFFFF"> 
      <td bgcolor="#FFFFFF"> 
        <input type="radio" name="khbh1" value="<%=khbh%>">
      </td>
      <td><%=khbh%></td>
      <td><%=hth%></td>
      <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
      <td><%=fwdz%></td>
      <td><%=sjs%></td>
      <td><%=sgdmc%></td>
      <td><%=zjxm%></td>
      <td><%=gcjdmc%></td>
      <td><%=qyrq%></td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
%>
    <tr bgcolor="#CCFFCC"  align="center"> 
      <td colspan="10" height="29"><B>选择－－保留客户</B></td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">&nbsp;</td>
      <td  width="8%">客户编号</td>
      <td  width="10%">合同号</td>
      <td  width="10%">客户姓名</td>
      <td  width="26%">房屋地址</td>
      <td  width="8%">设计师</td>
      <td  width="8%">施工队</td>
      <td  width="8%">工程担当</td>
      <td  width="8%">工程进度</td>
      <td  width="10%">签约日期</td>
    </tr>
<%
	ls_sql="select khbh,hth,khxm,fwdz,sjs,zjxm,gcjdmc,sgdmc,qyrq";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_sgd";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+) "+wheresql2;
//	ls_sql+=" and crm_khxx.gcjdbm!='5' ";
	ls_sql+=" and rownum<30";
	ls_sql+=" order by khxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=rs.getString("khxm");
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));

		row2++;

		%> 
    <tr align="center" bgcolor="#FFFFFF"> 
      <td>
        <input type="radio" name="khbh2" value="<%=khbh%>">
	  </td>
      <td><%=khbh%></td>
      <td><%=hth%></td>
      <td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
      <td><%=fwdz%></td>
      <td><%=sjs%></td>
      <td><%=sgdmc%></td>
      <td><%=zjxm%></td>
      <td><%=gcjdmc%></td>
      <td><%=qyrq%></td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e)
	{
		if (conn != null) cf.close(conn); 
	}
}

%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td colspan="10" height="40"> 
        <input type="button"  value="继续" onClick="f_do(listform)">
	  </td>
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

	if (<%=row1%>>1)
	{
		if(	!radioChecked(FormName.khbh1)) {
			alert("请选择[删除客户]！");
			FormName.khbh1[0].focus();
			return false;
		}
	}
	else{
		if(!FormName.khbh1.checked) {
			alert("请输入[删除客户]！");
			FormName.khbh1.focus();
			return false;
		}
	}

	if (<%=row2%>>1)
	{
		if(	!radioChecked(FormName.khbh2)) {
			alert("请选择[保留客户]！");
			FormName.khbh2[0].focus();
			return false;
		}
	}
	else{
		if(!FormName.khbh2.checked) {
			alert("请输入[保留客户]！");
			FormName.khbh2.focus();
			return false;
		}
	}


	FormName.action="XsKhxx.jsp";
	FormName.submit();
	return true;

}

//-->
</SCRIPT>
