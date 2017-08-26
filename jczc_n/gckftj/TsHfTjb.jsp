<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;
	String fgsmc=null;
	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

//	String px=request.getParameter("px");

	String fgs=request.getParameter("fgs");
	Connection conn0  = null;
	PreparedStatement ps0=null;
	ResultSet rs0=null;
try {
	conn0=cf.getConnection();
	String ls_sql1=null;

	ls_sql1="select dwbh,dwmc from sq_dwxx where dwbh='"+fgs+"'";
	ps0=conn0.prepareStatement(ls_sql1);  
	rs0=ps0.executeQuery();
	if (rs0.next())
	{
		fgsmc=rs0.getString(2);
	} 
	rs0.close();
	ps0.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs0 != null) rs0.close(); 
		if (ps0 != null) ps0.close(); 
		if (conn0 != null) cf.close(conn0); 
	}
	catch (Exception e){
		if (conn0 != null) cf.close(conn0); 
	}
}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ط���ϸ��
  <BR>(�ط�ʱ�䣺<%=sjfw%>--<%=sjfw2%>) 	
	 <%
	  if (fgsmc!=null)
		{%>
			(<%=fgsmc%>)
		<%}
	%>
</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table width="100%" border="0" style='FONT-SIZE: 14px' class="STYLE_TAB">
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px' class="STYLE_TAB">
        <tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR"> 
          <td  width="8%" class="STYLE2">���</td>
          <td  width="8%" class="STYLE2">��ͬ��</td>
          <td  width="8%" class="STYLE2">�ͻ�����</td>
          <td  width="8%" class="STYLE2">���ʦ</td>
          <td  width="11%" class="STYLE2">ǩԼʱ��</td>
          <td  width="11%" class="STYLE2">�ط�ʱ��</td>
          <td  width="38%" class="STYLE2">�ط����</td>
          <td  width="8%" class="STYLE2">�ط���</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();

	String hfjlh=null;
	String hth=null;
	String sjs=null;
	String khxm=null;
	String qyrq=null;
	String hfsj=null;
	String hfnr=null;
	String hfr=null;
	ls_sql="select crm_tshfjl.hfjlh,hth,khxm,sjs,qyrq,hfsj,khhfqk as hfnr,hfr";
	ls_sql+=" from crm_tshfjl,crm_khxx";
	ls_sql+=" where crm_tshfjl.khbh=crm_khxx.khbh and hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" order by crm_tshfjl.hfsj desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hfjlh=rs.getString("hfjlh");
		hth=rs.getString("hth");
		sjs=rs.getString("sjs");
		khxm=rs.getString("khxm");
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		hfsj=cf.fillHtml(rs.getDate("hfsj"));
		hfnr=rs.getString("hfnr");
		hfr=rs.getString("hfr");

		if(hfnr==null){
		hfnr="�޻ط�����";
		}
%>
		  <tr align="center">
          <td class="STYLE4"><%=hfjlh%></td>
          <td class="STYLE4"><%=hth%></td>
          <td class="STYLE4"><%=sjs%></td>
          <td class="STYLE4"><%=khxm%></td>
          <td class="STYLE4"><%=qyrq%></td>
          <td class="STYLE4"><%=hfsj%></td>
          <td class="STYLE4"><%=hfnr%></td>
          <td class="STYLE4"><%=hfr%></td>
        </tr>
<%

	}
	ps.close();
	rs.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
      </table>
    </td>
  </tr>
</table>
</body>
</html>
