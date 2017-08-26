<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String fgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");

String xz=request.getParameter("xz");
String khxmlist[]=request.getParameterValues("khxmlist");
if (khxmlist==null)
{
	out.println("请输入客户姓名!");
	return;
}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料进场登记</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveKhxm.jsp" target="_blank">
<table border="1" width="115%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"> 
      <td  width="4%" align="center">&nbsp;</td>
	  <td  width="3%" align="center">序号</td>
	  <td  width="7%" align="center">合同号</td>
	  <td  width="5%" align="center">姓名</td>
	  <td  width="5%" align="center">设计师</td>
	  <td  width="5%" align="center">工程担当</td>
	  <td  width="5%" align="center">施工队</td>
	  <td  width="27%" align="center">房屋地址</td>
	  <td  width="8%" align="center">目前进度</td>
	  <td  width="8%" align="center">应开工日期</td>
	  <td  width="8%" align="center">签约日期</td>
	  <td  width="10%" align="center">签约店面</td>
</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

int pos=0;
int count=0;
int row=0;
String khxm=null;
String sjkgrq=null;
String hflxbm=null;
String hfrq=null;

String khbh=null;
String hth=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String qyrq=null;
String kgrq=null;
String dwmc=null;
String gcjdmc=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<khxmlist.length ;i++ )
	{
		khxm=cf.GB2Uni(khxmlist[i]);

		if (i%2==1)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}

		count=0;
		ls_sql="SELECT khbh,hth,khxm,DECODE(xb,'M','男','W','女') as xb,fwdz,lxfs,qyrq,kgrq,a.dwmc dm,sjs,zjxm,sgdmc sgd,gcjdmc ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
		ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm not in('4','5')";
		if (xz.equals("xzkhxm"))
		{
			ls_sql+=" and khxm like '%"+khxm+"%'";
		}
		else{
			ls_sql+=" and hth='"+khxm+"'";
		}

		if (yhjs.equals("F0") || yhjs.equals("F1"))
		{
			ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
		else if (yhjs.equals("F2"))
		{
			ls_sql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			khbh=cf.fillHtml(rs.getString("khbh"));
			hth=cf.fillHtml(rs.getString("hth"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			xb=cf.fillHtml(rs.getString("xb"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			lxfs=cf.fillHtml(rs.getString("lxfs"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));
			kgrq=cf.fillHtml(rs.getDate("kgrq"));
			dwmc=cf.fillHtml(rs.getString("dm"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			sgd=cf.fillHtml(rs.getString("sgd"));
			gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));

%>
			
    <tr bgcolor="<%=bgcolor%>"> 
      <td align="center"> 
        <A HREF="InsertCrm_cljcjl.jsp?khbh=<%=khbh%>" target="_blank">登记</A>
	  </td>
      <td align="center"><%=(i+1)%></td>
      <td align="center">
		<%=hth%>
	  </td>
      <td align="center"><%=khxm%></td>
       <td align="center"><%=sjs%></td>
      <td align="center"><%=zjxm%></td>
      <td align="center"><%=sgd%></td>
      <td align="center"><%=fwdz%></td>
      <td align="center"><%=gcjdmc%></td>
      <td align="center"><%=kgrq%></td>
		<td align="center"><%=qyrq%></td>
      <td align="center"><%=dwmc%></td>
	</tr>
<%
			count++;
			row++;
		}
		ps.close();
		rs.close();

		if (count<1)//不存在
		{
%>
			
    <tr bgcolor="#CC0000"> 
      <td align="center">&nbsp;</td>
      <td align="center"><%=(i+1)%></td>
      <td align="center" colspan="2"><%=khxm%></td>
      <td colspan="9" bgcolor="#CC0000">数据不存在</td>
	</tr>
<%
		}
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>

</table>
</form> 


</body>
</html>

