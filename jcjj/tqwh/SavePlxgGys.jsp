<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");
String gysmc=cf.GB2Uni(request.getParameter("gysmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String ppbm=null;
		String ppmc=null;
		String ssfgs=null;
		ls_sql="select ppbm,ppmc,fgsbh ";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			ppbm = rs.getString("ppbm");//��Ʒ��    
			ppmc = rs.getString("ppmc");//Ʒ��		    
			ssfgs = rs.getString("fgsbh");		    
		}
		else{
			conn.rollback();
			out.println("<BR>���������󣬶���������:"+ddbh[i]);
			return;
		}
		rs.close();
		ps.close();


		
		String newppmc=null;
		ls_sql=" select jxc_ppxx.scsmc" ;
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx " ;
		ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
		ls_sql+=" and jxc_ppxx.pplb='1' ";
		ls_sql+=" and jxc_gysxx.cllx='1' ";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"' and jxc_ppxx.ppmc='"+ppbm+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			newppmc = rs.getString("scsmc");			    
		}
		rs.close();
		ps.close();
		if (!ppmc.equals(newppmc))
		{
			conn.rollback();
			out.println("<BR>����������[��Ʒ��:"+ppbm+"]��Ӧ��Ʒ��Ϊ:"+newppmc);
			return;
		}
		
		int count=0;
		ls_sql=" select count(*)" ;
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx " ;
		ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
		ls_sql+=" and jxc_ppxx.pplb='1' ";
		ls_sql+=" and jxc_gysxx.cllx='1' ";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"' and jxc_ppgysdzb.gysmc='"+gysmc+"'" ;
		ls_sql+=" and jxc_ppgysdzb.ppmc='"+ppbm+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			conn.rollback();
			out.println("<BR>������������Ʒ��["+ppbm+"]�빩Ӧ��["+gysmc+"]�޶��չ�ϵ");
			return;
		}

		ls_sql="update jc_zcdd set gys=?";
		ls_sql+=" where  (ddbh='"+ddbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gysmc);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zcddmx set gys=?";
		ls_sql+=" where  (ddbh='"+ddbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gysmc);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zczjx set gys=?";
		ls_sql+=" where  (ddbh='"+ddbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gysmc);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="update jc_jcdd set gys=?";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and lx='4'";//1��ľ�ţ�2������3���Ҿߣ�4������
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gysmc);
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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>