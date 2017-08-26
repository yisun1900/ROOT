<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String jhbh=null;
jhbh=request.getParameter("pxjhbh");
String pxjhmc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pxjhmc ";
	ls_sql+=" from  rs_pxjh";
	ls_sql+=" where  (pxjhbh='"+jhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxjhmc=cf.fillNull(rs.getString("pxjhmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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
<%
	String wheresql="";
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");

	ls_sql="SELECT pxmxbh,DECODE(pxlx,'0','��ѵ','1','��ѵ') pxlx,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxcd,pxrs,pxfy,pxjs,pxkssj,pxjssj,lrr,lrsj,pxkc,kcnr,bz  ";
	ls_sql+=" FROM rs_pxjhmx,rs_pxkclxbm,rs_pxskxsbm  ";
    ls_sql+=" where pxjhbh='"+pxjhbh+"' and rs_pxskxsbm.skxs=rs_pxjhmx.skxs and rs_pxkclxbm.kclx=rs_pxjhmx.kclx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"><%=pxjhmc%>��<%=pxjhbh%></font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��ѵ��ϸ���</td>
	<td  width="4%">��ѵ����</td>
	<td  width="4%">�ڿ���ʽ</td>
	<td  width="5%">�γ�����</td>
	<td  width="12%">��ѵ����</td>
	<td  width="4%">��ѵ����</td>
	<td  width="4%">��ѵ����</td>
	<td  width="5%">��ѵ��ʦ</td>
	<td  width="5%">��ѵ��ʼʱ��</td>
	<td  width="5%">��ѵ����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="11%">��ѵ�γ�</td>
	<td  width="11%">�γ�����</td>
	<td  width="16%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>