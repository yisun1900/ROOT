<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kczbbl=null;
String jjyy=null;
java.sql.Date hfsj=null;
String hfr=null;
kczbbl=cf.GB2Uni(request.getParameter("kczbbl"));
jjyy=cf.GB2Uni(request.getParameter("jjyy"));
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
hfr=cf.GB2Uni(request.getParameter("hfr"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String deflbm=null;
	String shzzb=null;
	String hfjl=null;
	double qye=0;
	ls_sql=" select deflbm,shzzb,hfjl,qye";
	ls_sql+=" from pd_pdjl ";
	ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		deflbm=cf.fillNull(rs.getString("deflbm"));
		shzzb=cf.fillNull(rs.getString("shzzb"));
		hfjl=cf.fillNull(rs.getString("hfjl"));
		qye=rs.getDouble("qye");
	}
	else{
		out.println("���󣡲����ڵ��ɵ���¼");
		return;
	}
	rs.close();
	ps.close();

	if (!hfjl.equals("0"))//0��δ�ܵ���3���ܵ�
	{
		out.println("�����Ѿܵ�");
		return;
	}

	String fgsbh=null;
	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	//ע�⣺���ܴ��ɵ���¼��pd_pdjl����ȡ��������¼�š��������ѵ��µĿ�������
	String kpjlh=null;
	ls_sql="select kpjlh";
	ls_sql+=" from  kp_pdkpjl ";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and zxbz='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kpjlh=rs.getString("kpjlh");
	}
	rs.close();
	ps.close();

	double kcpde=0;//�۳��ɵ���

	if (shzzb.equals("Y"))//Y��ռָ�ꣻN����ռָ��
	{
		if (kczbbl.equals("0"))//0������ָ�ꣻ1���۳������ɵ��2���۳�2���ɵ��3���۳�3���ɵ���
		{
			kcpde=-1*qye;
		}
		else if (kczbbl.equals("1"))
		{
			kcpde=0;
		}
		else if (kczbbl.equals("2"))
		{
			kcpde=qye;
		}
		else if (kczbbl.equals("3"))
		{
			kcpde=qye*2;
		}
	}
	else{
		if (kczbbl.equals("0"))//0������ָ�ꣻ1���۳������ɵ��2���۳�2���ɵ��3���۳�3���ɵ���
		{
			kcpde=0;
		}
		else if (kczbbl.equals("1"))
		{
			kcpde=qye;
		}
		else if (kczbbl.equals("2"))
		{
			kcpde=qye*2;
		}
		else if (kczbbl.equals("3"))
		{
			kcpde=qye*3;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update pd_pdjl set hfjl='3',kczbbl=?,kcpde=?,jjyy=?,dwbh=?,hfr=?,hfsj=?,sfhs='N'";//0���ɵ���3���ܵ���
	ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kczbbl);
	ps.setDouble(2,kcpde);
	ps.setString(3,jjyy);
	ps.setString(4,dwbh);
	ps.setString(5,hfr);
	ps.setDate(6,hfsj);
	ps.executeUpdate();
	ps.close();

	if (deflbm.equals("1"))//1����
	{
		//�ѽӴ���
		ls_sql="update kp_pdkpmx set yjddje=yjddje+("+kcpde+"/10000.0),syddje=syddje-("+kcpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("2"))//2���е�
	{
		ls_sql="update kp_pdkpmx set yjzdje=yjzdje+("+kcpde+"/10000.0),syzdje=syzdje-("+kcpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("3"))//3��С��
	{
		ls_sql="update kp_pdkpmx set yjxdje=yjxdje+("+kcpde+"/10000.0),syxdje=syxdje-("+kcpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

			
	ls_sql="update kp_pdkpmx set yjdze=yjddje+yjzdje+yjxdje,sydze=syddje+syzdje+syxdje";
	ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,sgbz=null,pdsm=null,pdclzt='7'";//1�������ɵ���2���˹��ɵ���5�������ɵ���6����Ȩ�ɵ���7���ܵ���8����ʩ���ӣ�4�������޸��ɵ�
	ls_sql+=" where khbh='"+khbh+"' and pdclzt='5' ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("���󣡴���ʧ��");
		return;
	}
	ps.close();


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
	out.print("<BR>����ʧ��,��������: " + e);
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