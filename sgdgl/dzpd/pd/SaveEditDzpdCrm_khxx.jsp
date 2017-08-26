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
String[] hxsgd=request.getParameterValues("hxsgd");
String[] hxsgdyxj=request.getParameterValues("hxsgdyxj");
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

	String hfjl="";
	ls_sql="SELECT hfjl";
	ls_sql+=" FROM pd_pdjl ";
	ls_sql+=" where khbh='"+wherekhbh+"' and sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hfjl=rs.getString("hfjl");
	}
	rs.close();
	ps.close();
	if (hfjl.equals("3"))
	{
		out.println("���󣡸�ʩ�����Ѿܵ�");
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

	conn.setAutoCommit(false);

	//ʩ�����ɵ����ȼ���¼+++++++++++++++++++++++
	//������ʩ����
	String sgdyxj=null;
	String sfbxsgd=null;
	double bqjdze=0;
	double bqdde=0;
	double bqzde=0;
	double bqxde=0;
	double yjdze=0;

	double yjddje=0;
	double yjzdje=0;
	double yjxdje=0;
	double sydze=0;
	double syddje=0;
	double syzdje=0;
	double syxdje=0;
	double qdl=0;

	for (int i=0;i<hxsgd.length ;i++ )
	{
		if (hxsgd[i].equals(sgd))
		{
			sfbxsgd="Y";
			sgdyxj=hxsgdyxj[i];
		}
		else{
			sfbxsgd="N";
		}

		bqjdze=0;
		bqdde=0;
		bqzde=0;
		bqxde=0;
		yjdze=0;

		yjddje=0;
		yjzdje=0;
		yjxdje=0;
		sydze=0;
		syddje=0;
		syzdje=0;
		syxdje=0;
		qdl=0;

		ls_sql="SELECT bqjdze,bqdde,bqzde,bqxde,yjdze,yjddje,yjzdje,yjxdje,sydze,syddje,syzdje,syxdje,ROUND(sydze*100.0/bqjdze,1) qdl";
		ls_sql+=" FROM kp_pdkpmx ";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+hxsgd[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bqjdze=rs.getDouble("bqjdze");
			bqdde=rs.getDouble("bqdde");
			bqzde=rs.getDouble("bqzde");
			bqxde=rs.getDouble("bqxde");
			yjdze=rs.getDouble("yjdze");

			yjddje=rs.getDouble("yjddje");
			yjzdje=rs.getDouble("yjzdje");
			yjxdje=rs.getDouble("yjxdje");
			sydze=rs.getDouble("sydze");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");
			qdl=rs.getDouble("qdl");
		}
		rs.close();
		ps.close();

		ls_sql="insert into pd_pdyxjjl (khbh,pdsgd,sgd,qdl,bqjdze,bqdde,bqzde,bqxde,yjdze,yjddje  ,yjzdje,yjxdje,sydze,syddje,syzdje,syxdje,sfbxsgd,hxsgdyxj) ";
		ls_sql+=" values (?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,sgd);
		ps.setString(3,hxsgd[i]);
		ps.setDouble(4,qdl);
		ps.setDouble(5,bqjdze);
		ps.setDouble(6,bqdde);
		ps.setDouble(7,bqzde);
		ps.setDouble(8,bqxde);
		ps.setDouble(9,yjdze);
		ps.setDouble(10,yjddje);

		ps.setDouble(11,yjzdje);
		ps.setDouble(12,yjxdje);
		ps.setDouble(13,sydze);
		ps.setDouble(14,syddje);
		ps.setDouble(15,syzdje);
		ps.setDouble(16,syxdje);
		ps.setString(17,sfbxsgd);
		ps.setString(18,hxsgdyxj[i]);
		ps.executeUpdate();
		ps.close();
	}

	//��������ʩ����
	String lssgd=null;
	ls_sql="SELECT kp_pdkpmx.sgd,bqjdze,bqdde,bqzde,bqxde,yjdze,yjddje,yjzdje,yjxdje,sydze,syddje,syzdje,syxdje,ROUND(sydze*100.0/bqjdze,1) qdl";
	ls_sql+=" from kp_pdkpmx,sq_sgd";
	ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' ";
	ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdyxjjl where khbh='"+wherekhbh+"' and pdsgd='"+sgd+"')";
	//��Ҫ������
	ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
	ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lssgd=rs.getString("sgd");
		bqjdze=rs.getDouble("bqjdze");
		bqdde=rs.getDouble("bqdde");
		bqzde=rs.getDouble("bqzde");
		bqxde=rs.getDouble("bqxde");
		yjdze=rs.getDouble("yjdze");

		yjddje=rs.getDouble("yjddje");
		yjzdje=rs.getDouble("yjzdje");
		yjxdje=rs.getDouble("yjxdje");
		sydze=rs.getDouble("sydze");
		syddje=rs.getDouble("syddje");
		syzdje=rs.getDouble("syzdje");
		syxdje=rs.getDouble("syxdje");
		qdl=rs.getDouble("qdl");

		sfbxsgd="M";

		ls_sql="insert into pd_pdyxjjl (khbh,pdsgd,sgd,qdl,bqjdze,bqdde,bqzde,bqxde,yjdze,yjddje  ,yjzdje,yjxdje,sydze,syddje,syzdje,syxdje,sfbxsgd) ";
		ls_sql+=" values (?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,sgd);
		ps.setString(3,lssgd);
		ps.setDouble(4,qdl);
		ps.setDouble(5,bqjdze);
		ps.setDouble(6,bqdde);
		ps.setDouble(7,bqzde);
		ps.setDouble(8,bqxde);
		ps.setDouble(9,yjdze);
		ps.setDouble(10,yjddje);

		ps.setDouble(11,yjzdje);
		ps.setDouble(12,yjxdje);
		ps.setDouble(13,sydze);
		ps.setDouble(14,syddje);
		ps.setDouble(15,syzdje);
		ps.setDouble(16,syxdje);
		ps.setString(17,sfbxsgd);
		ps.executeUpdate();
		ps.close();
	}
	rs.close();
	ps.close();

	//ʩ�����ɵ����ȼ���¼==============================
	double jrpde=qye;

	ls_sql="insert into pd_pdjl (khbh,sgd,sgbz,zjxm,pdsj,pdr,pdsm,sgdyxj,shzzb,kpjlh,deflbm,jrpde,jlbz,qye,hfjl,kppdbz,xuhao) ";
	ls_sql+=" values (?,?,?,?,SYSDATE,?,?,?,?,?,?,?,?,?,'0','2',?) ";//0��δ�ܵ���3���ܵ�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,sgd);
	ps.setString(3,sgbz);
	ps.setString(4,zjxm);
	ps.setString(5,pdr);
	ps.setString(6,pdsm);
	ps.setString(7,sgdyxj);
	ps.setString(8,shzzb);//Y��ռָ�ꣻN����ռָ��
	ps.setString(9,kpjlh);
	ps.setString(10,deflbm);
	ps.setDouble(11,jrpde);
	ps.setString(12,jlbz);
	ps.setDouble(13,qye);
	ps.setLong(14,xuhao);
	ps.executeUpdate();
	ps.close();

	String dlx="";


//0+�����ɵ�&5+�󵥵�С��&6+С���ִ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�

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
	

	ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,sgbz=?,pdsm=?,pdclzt='5',jlbz=?,zjxm=?";
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
	rs.close();
	ps.close();

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
		rs.close();
		ps.close();
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