<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String[] clbm=request.getParameterValues("clbm");
String[] rkjstr=request.getParameterValues("rkj");
String[] rkslstr=request.getParameterValues("rksl");
String[] scrqstr=request.getParameterValues("scrq");
String[] scph=request.getParameterValues("scph");
String[] hwbh =request.getParameterValues("hwbh");//����λ
String[] hjbh =request.getParameterValues("hjbh");//������

double rkj=0;
double rksl=0;
java.sql.Date scrq=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//�����ⵥ״̬
	String rkdzt=null;
	ls_sql="select rkdzt ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
	}
	else{
		out.print("������ⵥ["+rkph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	{
		out.print("������ⵥ���ύ��������¼�����ݣ�");
		return;
	}

	//��ѯ������Ʒ����
	int rkxh=0;
	ls_sql="select max(rkxh) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{

		if (rkslstr[i]==null || rkslstr[i].trim().equals(""))
		{
			continue;
		}

		//��ⵥ��
		if (cf.GB2Uni(rkjstr[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"����ⵥ�۲���Ϊ�գ�");
			return;
		}

		try{
			rkj=Double.parseDouble(rkjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"��[��ⵥ��]��������:"+e);
			return;
		}

		//�������
		try{
			rksl=Double.parseDouble(rkslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"��[�������]��������:"+e);
			return;
		}

		if (rksl==0)
		{
			continue;
		}

		//��������
		if (cf.GB2Uni(scrqstr[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"���������ڲ���Ϊ�գ�");
			return;
		}

		try{
			scrq=java.sql.Date.valueOf(scrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"��[��������]��ʽ����ȷ��ӦΪ��YYYY-MM-DD��:"+e);
			return;
		}

		//��������
		if (cf.GB2Uni(scph[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"���������Ų���Ϊ�գ�");
			return;
		}
		//������
		if (cf.GB2Uni(hjbh[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"�������ܲ���Ϊ�գ�");
			return;
		}


		//д�������ϸ
		rkxh++;
		double rkje=rkj*rksl;
		ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm ,rksl,rkj,rkje,zcpsl,scrq,scph,hjbh,hwbh,ccpsl,wldssl,thpsl,bfpsl,ccpzkl,zcpfkcsl,ccpfkcsl,bfpfkcsl ) ";
		ls_sql+=" select           ?,?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,ppmc,gysmc,cldlbm,clxlbm,?    ,?  ,?   ,?    ,?   ,?   ,?   ,?   ,0,0,0,0,10,0,0,0 ";
		ls_sql+=" from  jxc_cljgb,jxc_clbm";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
		ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,rkph);
		ps.setInt(2,rkxh);
		ps.setDouble(3,rksl);
		ps.setDouble(4,rkj);
		ps.setDouble(5,rkje);
		ps.setDouble(6,rksl);
		ps.setDate(7,scrq);
		ps.setString(8,cf.GB2Uni(scph[i]));
		ps.setString(9,cf.GB2Uni(hjbh[i]));
		ps.setString(10,cf.GB2Uni(hwbh[i]));
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