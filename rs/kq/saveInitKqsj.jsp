<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String[] id =request.getParameterValues("id");
String[] yhmc =request.getParameterValues("yhmc");
String[] kqhm =request.getParameterValues("kqhm");
String[] gzr =request.getParameterValues("gzr");
String[] sbsj =request.getParameterValues("sbsj");
String[] xbsj =request.getParameterValues("xbsj");


  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	for (int i=0;i<kqhm.length ;i++ )
	{
	
		//��ѯƷ������
		int ygbh=0;
		String bianhao=null;
		String ssfgs=null;
		String dwbh=null;

		sql=" select ygbh,bianhao,ssfgs,dwbh" ;
		sql+=" from sq_yhxx" ;
		sql+=" where  (kqhm="+kqhm[i]+")  ";
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){         
			ygbh = rs.getInt("ygbh");			    
			bianhao = rs.getString("bianhao");			    
			ssfgs = rs.getString("ssfgs");			    
			dwbh = rs.getString("dwbh");			    
		}
		else{
//			conn.rollback();
//			out.println("�������������["+id[i]+"]�����ڵĿ��ں��룡"+kqhm[i]);
//			return;
		}
		rs.close();
		ps.close();


		sql="insert into rs_ygkqb ( kqhm,gzr,ygbh,bianhao,yhmc,ssfgs,dwbh,sbsj,xbsj) ";
		sql+=" values ( '"+kqhm[i]+"',TO_DATE('"+gzr[i]+"','YYYY-MM-DD'),'"+ygbh+"','"+bianhao+"','"+cf.GB2Uni(yhmc[i])+"','"+ssfgs+"','"+dwbh+"',TO_DATE('"+sbsj[i]+"','YYYY-MM-DD HH24:MI:SS'),TO_DATE('"+xbsj[i]+"','YYYY-MM-DD HH24:MI:SS')) ";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();


	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
//	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
