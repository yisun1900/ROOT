<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
java.sql.Date pdsj=null;
ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɵ�ʱ��]����ת����������:"+e);
	return;
}

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
String deflbm=cf.GB2Uni(request.getParameter("deflbm"));
String jlbz=cf.GB2Uni(request.getParameter("jlbz"));
String shzzb=cf.GB2Uni(request.getParameter("shzzb"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	double qye=0;
	String pdclzt=null;
	ls_sql="SELECT qye,pdclzt";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		pdclzt=rs.getString("pdclzt");
	}
	rs.close();
	ps.close();

	if (!pdclzt.equals("1") && !pdclzt.equals("7"))
	{
		out.println("���󣡸ÿͻ����ɵ�");
		return;
	}


	long xuhao=0;
	ls_sql="SELECT max(xuhao)";
	ls_sql+=" FROM pd_pdjl ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xuhao=rs.getLong(1);
	}
	rs.close();
	ps.close();
	xuhao++;


	double jrpde=0;
	if (shzzb.equals("Y"))//Y��ռָ�ꣻN����ռָ��
	{
		jrpde=qye;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into pd_pdjl (khbh,sgd,sgbz,zjxm,pdsj,pdr,pdsm,shzzb,kpjlh,deflbm,jrpde,jlbz,qye,hfjl,kppdbz,xuhao) ";
	ls_sql+=" values (?,?,?,?,SYSDATE,?,?,?,?,?,?,?,?,'0','2',?) ";//0��δ�ܵ���3���ܵ�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,sgd);
	ps.setString(3,sgbz);
	ps.setString(4,zjxm);
	ps.setString(5,pdr);
	ps.setString(6,pdsm);
	ps.setString(7,shzzb);//Y��ռָ�ꣻN����ռָ��
	ps.setString(8,kpjlh);
	ps.setString(9,deflbm);
	ps.setDouble(10,jrpde);
	ps.setString(11,jlbz);
	ps.setDouble(12,qye);
	ps.setLong(13,xuhao);
	ps.executeUpdate();
	ps.close();

	String dlx="";


//0+�˹��ɵ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&7+�������&8+�����ɵ�&9+ͬС���ɵ�

	//ʩ���ӿ���+++++++++++++++++++++

	if (deflbm.equals("1"))//1����
	{
		//�ѽӴ���
		ls_sql="update kp_pdkpmx set yjddje=yjddje+("+jrpde+"/10000.0),syddje=syddje-("+jrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("2"))//2���е�
	{
		ls_sql="update kp_pdkpmx set yjzdje=yjzdje+("+jrpde+"/10000.0),syzdje=syzdje-("+jrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("3"))//3��С��
	{
		ls_sql="update kp_pdkpmx set yjxdje=yjxdje+("+jrpde+"/10000.0),syxdje=syxdje-("+jrpde+"/10000.0)";
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

	//ʩ���ӿ���-----------------------------
	

	ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,sgbz=?,pdsm=?,pdclzt='6',jlbz=?,zjxm=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,pdsj);
	ps.setString(2,pdr);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setString(5,pdsm);
	ps.setString(6,jlbz);
	ps.setString(7,zjxm);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("���󣡴���ʧ��");
		return;
	}
	ps.close();



	conn.commit();

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where zjxm='"+zjxm+"' and jyjdrq=(select jyjdrq from crm_khxx where khbh='"+wherekhbh+"')";
	ls_sql+=" and gcjdbm='1'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	String cfkhbh=null;
	String cfkhxm=null;
	String cffwdz=null;
	if (count>1)
	{
		out.println("<BR>�ɵ��ɹ���");
		out.println("<P>*****���棡�ʼ�["+zjxm+"]������["+count+"]�����ز��Ͻ���");
		ls_sql="SELECT khbh,khxm,fwdz";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where zjxm='"+zjxm+"' and jyjdrq=(select jyjdrq from crm_khxx where khbh='"+wherekhbh+"')";
		ls_sql+=" and gcjdbm='1'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cfkhbh=rs.getString("khbh");
			cfkhxm=rs.getString("khxm");
			cffwdz=rs.getString("fwdz");

			out.println("<BR>�ͻ���ţ�"+cfkhbh+"���ͻ�������"+cfkhxm+"�����ݵ�ַ��"+cffwdz+"");
		}
		ps.close();
		rs.close();
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�ɵ��ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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