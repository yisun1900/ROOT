<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh =request.getParameterValues("zjxxh");

String yddbh=null;
String clzt=null;
String fgsbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		ls_sql="select yddbh,clzt,fgsbh";
		ls_sql+=" from  jc_mmzjx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			yddbh=rs.getString("yddbh");
			clzt=rs.getString("clzt");
			fgsbh=rs.getString("fgsbh");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("01"))
		{
			conn.rollback();
			out.println("<BR>����������δ��ɣ����������="+zjxxh[i]);
			return;
		}

		int maxzjxxh=0;
		ls_sql="select NVL(max(zjxxh),0)";
		ls_sql+=" from  jc_mmzjx";
		ls_sql+=" where yddbh='"+yddbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			maxzjxxh=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (maxzjxxh!=Integer.parseInt(zjxxh[i]))
		{
			conn.rollback();
			out.println("<BR>����ֻ��ɾ�����µ������Ԥ�������="+yddbh+";���������="+zjxxh[i]);
			return;
		}


		ls_sql="update jc_mmzjx set clzt='00',mmzjxje=0,wjzjxje=0,blzjxje=0,zjxze=0,zqmmzjxje=0,zqwjzjxje=0,zqblzjxje=0,zqzjxze=0";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//��ȡ����С������������������������������ʼ
		int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jcddblxs=rs.getInt(1);
			jcddmxblxs=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (jcddblxs==-100)
		{
			conn.rollback();
			out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
			return;
		}

		if (jcddmxblxs==-100)
		{
			conn.rollback();
			out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
			return;
		}
		//��ȡ����С������������������������������������

	//�����������
		double mmzjxje=0;
		double wjzjxje=0;
		double blzjxje=0;
		double zjxze=0;

		double zqmmzjxje=0;
		double zqwjzjxje=0;
		double zqblzjxje=0;
		double zqzjxze=0;


		//�޸Ķ���
		ls_sql="select sum(mmzjxje),sum(wjzjxje),sum(blzjxje),sum(zjxze)  ,sum(zqmmzjxje),sum(zqwjzjxje),sum(zqblzjxje),sum(zqzjxze)";
		ls_sql+=" from  jc_mmzjx";
		ls_sql+=" where yddbh='"+yddbh+"' and clzt!='00'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mmzjxje=rs.getDouble(1);
			wjzjxje=rs.getDouble(2);
			blzjxje=rs.getDouble(3);
			zjxze=rs.getDouble(4);

			zqmmzjxje=rs.getDouble(5);
			zqwjzjxje=rs.getDouble(6);
			zqblzjxje=rs.getDouble(7);
			zqzjxze=rs.getDouble(8);
		}
		rs.close();
		ps.close();


		ls_sql="update jc_mmydd set zjhmmje=ROUND(mmhtje+?,"+jcddblxs+"),zjhwjje=ROUND(wjhtje+?,"+jcddblxs+"),zjhblje=ROUND(blhtje+?,"+jcddblxs+"),zjhze=ROUND(htje+?,"+jcddblxs+")";
		ls_sql+=" ,zqzjhmmje=zqmmhtje+?,zqzjhwjje=zqwjhtje+?,zqzjhblje=zqblhtje+?,zqzjhze=wdzje+?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,mmzjxje);
		ps.setDouble(2,wjzjxje);
		ps.setDouble(3,blzjxje);
		ps.setDouble(4,zjxze);

		ps.setDouble(5,zqmmzjxje);
		ps.setDouble(6,zqwjzjxje);
		ps.setDouble(7,zqblzjxje);
		ps.setDouble(8,zqzjxze);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="delete from jc_jcdd";
		ls_sql+=" where gjz='"+zjxxh[i]+"' and lx='1' and czlx='2'";
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
	out.print("����ʧ��,��������: " + e);
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