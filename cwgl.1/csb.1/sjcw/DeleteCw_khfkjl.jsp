<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] fkxh=request.getParameterValues("fkxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String skdd=null;
	String dsksjbz=null;
	String scbz=null;
	String glxh=null;
	String khbh=null;
	String yjjzsj=null;

	conn.setAutoCommit(false);
	
	for (int i=0;i<fkxh.length ;i++ )
	{
		ls_sql="select khbh,skdd,dsksjbz,scbz,glxh,yjjzsj";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			skdd=rs.getString("skdd");
			dsksjbz=rs.getString("dsksjbz");
			scbz=rs.getString("scbz");
			glxh=rs.getString("glxh");
			yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		}
		else{
			conn.rollback();
			out.println("���󣡲����ڵ��տ���ţ�"+fkxh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!yjjzsj.equals(""))
		{
//			conn.rollback();
//			out.println("�տ��¼�ѽ�ת���������޸ģ���תʱ�䣺"+yjjzsj);
//			return;
		}

		if (scbz.equals("Y"))
		{
			conn.rollback();
			out.println("�����տ����["+fkxh[i]+"]�ѱ�ɾ��");
			return;
		}

		if (skdd.equals("2"))//1�������տ2���ǲ�����տ�
		{
			if (dsksjbz.equals("N"))//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
			{
				conn.rollback();
				out.println("����δ��ˣ��տ���ţ�"+fkxh[i]);
				return;
			}
		}
		else{
			conn.rollback();
			out.println("�����Ƿ�����˲���ȷ���տ���ţ�"+fkxh[i]);
			return;
		}
		


		ls_sql="update cw_khfkjl set sjr=null,sjsj=null,shsj=null,dsksjbz='N',shyj=null ";
		ls_sql+=" where  (fkxh='"+fkxh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (glxh!=null)
		{
			ls_sql="update cw_khfkjl set sjr=null,sjsj=null,dsksjbz='N',shyj=null ";
			ls_sql+=" where fkxh!='"+fkxh[i]+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//��װ�����+++++++++++++++++++++++++++++++++++++++��ʼ
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//������ʵ�տ�
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//��װ����տ�ʱ��
		java.sql.Date getjzkscsj=null;//�״θ���װ��ʱ��
		String getjzkfkxh=null;//��װ����տ����
		int getjzkfkcs=0;//��װ�տ�����
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//���չ��̿�
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//ȡ�����տ����
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//�����װ����տ�ʱ��
		java.sql.Date getcwjzkscsj=null;//�����״θ���װ��ʱ��
		String getcwjzkfkxh=null;//�����װ����տ����
		int getcwjzkfkcs=0;//�����װ�տ�����

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//���չ��̿�
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//��װ�����--------------------------------------------���
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