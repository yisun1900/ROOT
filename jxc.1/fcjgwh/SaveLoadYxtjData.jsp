<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] cldlbm =request.getParameterValues("cldlbm");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] nbbm =request.getParameterValues("nbbm");
String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] cbj =request.getParameterValues("cbj");
String[] dfgsjg =request.getParameterValues("dfgsjg");
String[] dgzjg =request.getParameterValues("dgzjg");
String[] sxsj =request.getParameterValues("sxsj");
String dqbm=request.getParameter("dqbm");//��������


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
try {
	conn=cf.getConnection();    //�õ�����


	//���ϵͳ��ʼ������
	String nbbmsfwy=null;
	sql=" select nbbmsfwy " ;
	sql+=" from jxc_xtcsh " ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		nbbmsfwy=cf.fillNull(rs.getString("nbbmsfwy"));
	}
	else
	{
		rs.close();
		ps.close();
		out.println("<BR>��������������û�ж�ϵͳ���г�ʼ�������ȳ�ʼ��ϵͳ��");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	for (int i=0;i<nbbm.length ;i++ )
	{

		String clbm=null;
		sql=" select jxc_cljgb.clbm" ;
		sql+=" from jxc_clbm,jxc_cljgb " ;
		sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.nbbm='"+nbbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cllb='1'" ;//0�����ģ�1������
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clbm = rs.getString(1);			    
		}
		else{
			conn.rollback();
			rs.close();
			ps.close();
			out.println("<BR>����������[�ڲ�����"+nbbm[i]+"]��������");
			return;
		}
		rs.close();
		ps.close();

		int count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_tzcljgjl " ;
		sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' and xgzt='N'" ;//N��δ�ģ�Y�����޸�
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("<BR>����������[�ڲ�����"+nbbm[i]+"]���е��ۼ�¼��Ŀǰ��δ��Ч�������ظ�¼��");
			return;
		}


		sql=" insert into jxc_tzcljgjl (clbm,dqbm,lrsj,lrr,lrbm,cbj,lsj,xsj,dfgsjg,dgzjg   ,sxsj,xgzt)";
		sql+=" values(?,?,TRUNC(SYSDATE),?,?,?,0,0,?,?  ,TO_DATE(?,'YYYY-MM-DD'),'N') " ;//N��δ�ģ�Y�����޸�
		ps1= conn.prepareStatement(sql);
		ps1.setString(1,clbm);
		ps1.setString(2,dqbm);
		ps1.setString(3,yhmc);
		ps1.setString(4,lrbm);
		ps1.setString(5,cbj[i]);
		ps1.setString(6,dfgsjg[i]);
		ps1.setString(7,dgzjg[i]);
		ps1.setString(8,sxsj[i]);
		ps1.executeUpdate();
		ps1.close();


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
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
