<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zgcljlh=request.getParameterValues("zgcljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	for (int i=0;i<zgcljlh.length ;i++ )
	{
		String zgjlh=null;
		String xjjlh=null;
		ls_sql="select zgjlh,xjjlh";
		ls_sql+=" from kp_zgclgdmx";
		ls_sql+=" where zgcljlh='"+zgcljlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zgjlh=cf.fillNull(rs.getString("zgjlh"));
			xjjlh=cf.fillNull(rs.getString("xjjlh"));
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.println("�������Ĵ����¼�Ų����ڣ�"+zgcljlh[i]);
			return;
		}
		rs.close();
		ps.close();

		String getwtclbz=null;
		ls_sql="select wtclbz";
		ls_sql+=" from kp_xjgdjl";
		ls_sql+=" where xjjlh='"+xjjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getwtclbz=cf.fillNull(rs.getString("wtclbz"));
		}
		rs.close();
		ps.close();

		if (!getwtclbz.equals("Y") && !getwtclbz.equals("C"))//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
		{
			conn.rollback();
			out.println("�������Ĵ���״̬����ȷ");
			return;
		}

		String getclzt=null;
		ls_sql="select clzt";
		ls_sql+=" from kp_zggdmx";
		ls_sql+=" where zgjlh='"+zgjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getclzt=cf.fillNull(rs.getString("clzt"));
		}
		rs.close();
		ps.close();

		if (!getclzt.equals("5") && !getclzt.equals("6"))//1:δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
		{
			conn.rollback();
			out.println("����������Ŀ״̬����ȷ");
			return;
		}


		ls_sql="delete from kp_zgclgdmx ";
		ls_sql+=" where zgcljlh='"+zgcljlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String maxzgcljlh=null;
		ls_sql="select max(zgcljlh)";
		ls_sql+=" from kp_zgclgdmx";
		ls_sql+=" where zgjlh='"+zgjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			maxzgcljlh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();


		ls_sql="update kp_zggdmx set clzt='4',zgcljlh=?,ysr=null,yssj=null,yssm=null ";//1:δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
		ls_sql+=" where zgjlh='"+zgjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,maxzgcljlh);
		ps.executeUpdate();
		ps.close();



		String setwtclbz=null;
		int zgclsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from kp_zggdmx";
		ls_sql+=" where xjjlh='"+xjjlh+"' ";
		ls_sql+=" and clzt!='1'";//1:δ����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zgclsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (zgclsl==0)
		{
			setwtclbz="N";//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
		}
		else{
			zgclsl=0;
			ls_sql="select count(*)";
			ls_sql+=" from kp_zggdmx";
			ls_sql+=" where xjjlh='"+xjjlh+"' ";
			ls_sql+=" and clzt!='5'";//1:δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zgclsl=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (zgclsl==0)
			{
				setwtclbz="Y";//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
			}
			else{
				setwtclbz="C";//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
			}
		}

		ls_sql="update kp_xjgdjl set wtclbz='"+setwtclbz+"'";
		ls_sql+=" where xjjlh='"+xjjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

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