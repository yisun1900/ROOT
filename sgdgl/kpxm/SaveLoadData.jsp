<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String[] kpdlbm =request.getParameterValues("kpdlbm");
String[] kpxmbm =request.getParameterValues("kpxmbm");
String[] kpxmmc =request.getParameterValues("kpxmmc");
String[] kpjg =request.getParameterValues("kpjg");

String[] kpjgdy =request.getParameterValues("kpjgdy");
String[] kfstr =request.getParameterValues("kf");
String[] sgdfkstr =request.getParameterValues("sgdfk");
String[] kcjdeblstr =request.getParameterValues("kcjdebl");

String[] kpcfbm =request.getParameterValues("kpcfbm");
String[] cfbz =request.getParameterValues("cfbz");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	for (int i=0;i<kpxmbm.length ;i++ )
	{
		double kf=0;
		if (!kfstr[i].equals(""))
		{
			kf=Double.parseDouble(kfstr[i]);
		}
		double sgdfk=0;
		if (!sgdfkstr[i].equals(""))
		{
			sgdfk=Double.parseDouble(sgdfkstr[i]);
		}
		double kcjdebl=0;
		if (!kcjdeblstr[i].equals(""))
		{
			kcjdebl=Double.parseDouble(kcjdeblstr[i]);
		}

		
		int count=0;
		sql=" select count(*)" ;
		sql+=" from kp_gckpxm " ;
		sql+=" where kpxmbm ='"+cf.GB2Uni(kpxmbm[i]) +"' and kpjg='"+kpjg[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			conn.rollback();
			out.println("������Ŀ����["+cf.GB2Uni(kpxmbm[i])+"]�ж��");
			return;
		}
		else if (count==1)//����ɾ��
		{
			sql=" delete from kp_gckpxm " ;
			sql+=" where kpxmbm ='"+cf.GB2Uni(kpxmbm[i]) +"' and kpjg='"+kpjg[i]+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

		sql ="insert into kp_gckpxm (kpxmbm,kpxmmc,kpdlbm,kpjg,kpjgdy,kpcfbm,cfbz,kf,sgdfk,kcjdebl)";
		sql+=" values('"+kpxmbm[i]+"','"+cf.GB2Uni(kpxmmc[i])+"','"+cf.GB2Uni(kpdlbm[i])+"','"+cf.GB2Uni(kpjg[i])+"','"+cf.GB2Uni(kpjgdy[i])+"','"+cf.GB2Uni(kpcfbm[i])+"','"+cf.GB2Uni(cfbz[i])+"','"+kf+"','"+sgdfk+"','"+kcjdebl+"')";
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
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
