<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>ƾ֤������ </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String[] xuhao = request.getParameterValues("xuhao");

String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();    //�õ�����
	
	conn.setAutoCommit(false);

	for (int i=0;i<xuhao.length;i++ )
	{
		String khbh=null;
		String fklxbm=null;

		ls_sql=" select khbh,fklxbm" ;
		ls_sql+=" from cw_khfkjl " ;
		ls_sql+=" where xuhao="+xuhao[i] ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			khbh = rs.getString("khbh");			    
			fklxbm = rs.getString("fklxbm");			    
		}
		else{
			conn.rollback();
			out.println("<BR>���󣡣������ڵ�ƾ֤���["+xuhao[i]+"]");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="update cw_impjdpz set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
		ls_sql+=" where xuhao="+xuhao[i] ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
		ls_sql+=" where xuhao="+xuhao[i] ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (fklxbm.equals("11"))//11����װ��
		{
			double sfke=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//���չ��̿�
			}
			rs.close();
			ps.close();

			double gckzc=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='11' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gckzc=rs.getDouble(1);//ת�����̿�
			}
			rs.close();
			ps.close();

			sfke=sfke-gckzc;

			//���£����̿�ʵ�տ��ʡ����̿�ʵ�տ��
			ls_sql="update crm_khxx set sfke=?,jzkfkcs=jzkfkcs-1";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sfke);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 

</body>
</html>

