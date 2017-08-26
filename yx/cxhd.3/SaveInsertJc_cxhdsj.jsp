<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

String[] kssjstr=request.getParameterValues("kssj");
String[] cxjssjstr=request.getParameterValues("cxjssj");
String[] qdjssjstr=request.getParameterValues("qdjssj");
java.sql.Date kssj=null;
java.sql.Date cxjssj=null;
java.sql.Date qdjssj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cxhdmc=null;
	String fgsbh=null;
	ls_sql=" SELECT cxhdmc,fgsbh ";
	ls_sql+=" FROM jc_cxhd ";
    ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	else{
		out.print("���󣡴����������");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from jc_cxhdsj ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<kssjstr.length ;i++ )
	{
		
		if (kssjstr[i]==null || kssjstr[i].trim().equals(""))
		{
			continue;
		}

		kssj=java.sql.Date.valueOf(kssjstr[i]);
		cxjssj=java.sql.Date.valueOf(cxjssjstr[i]);
		qdjssj=java.sql.Date.valueOf(qdjssjstr[i]);

		if (kssj.compareTo(cxjssj)>0)
		{
			conn.rollback();
			out.print("���󣡽���ʱ�䡺"+cxjssjstr[i]+"��Ҫ���ڿ�ʼʱ�䡺"+kssjstr[i]+"��");
			return;
		}

		if (kssj.compareTo(qdjssj)>0)
		{
			conn.rollback();
			out.print("���󣡽���ʱ�䡺"+qdjssjstr[i]+"��Ҫ���ڿ�ʼʱ�䡺"+kssjstr[i]+"��");
			return;
		}

		ls_sql="insert into jc_cxhdsj (cxhdbm,cxhdmc,fgsbh,kssj,cxjssj,qdjssj) ";
		ls_sql+=" values(?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cxhdbm);
		ps.setString(2,cxhdmc);
		ps.setString(3,fgsbh);
		ps.setDate(4,kssj);
		ps.setDate(5,cxjssj);
		ps.setDate(6,qdjssj);
		ps.executeUpdate();
		ps.close();
		
	}

	conn.commit();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);

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