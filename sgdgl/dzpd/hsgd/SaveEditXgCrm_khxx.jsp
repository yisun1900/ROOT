<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String oldsgd=cf.GB2Uni(request.getParameter("oldsgd"));
String newsgd=cf.GB2Uni(request.getParameter("newsgd"));
String newsgbz=cf.GB2Uni(request.getParameter("sgbz"));
String oldsgbz=cf.GB2Uni(request.getParameter("oldsgbz"));
String hsgdyy=cf.GB2Uni(request.getParameter("hsgdyy"));

double oldkzbbfb=0;
ls=request.getParameter("oldkzbbfb");
try{
	if (!(ls.equals("")))  oldkzbbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����oldkzbbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ԭʩ�����ɵ�ָ��ٷֱ�]����ת����������:"+e);
	return;
}
double newkzbbfb=0;
ls=request.getParameter("newkzbbfb");
try{
	if (!(ls.equals("")))  newkzbbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����newkzbbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʩ�����ɵ�ָ��ٷֱ�]����ת����������:"+e);
	return;
}
java.sql.Date lrsj=null;
String lrr=null;
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));

String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  pd_hsgdjl";
	ls_sql+=" where  khbh='"+khbh+"' and newsgd='"+newsgd+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("���󣡸�ʩ�����ѱ������������ܱ�������");
		return;
	}

	String ybysxmbm=null;
	String zqysxmbm=null;
	String pdclzt=null;
	ls_sql="select ybysxmbm,zqysxmbm,pdclzt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
	}
	rs.close();
	ps.close();

	String deflbm=null;
	String shzzb=null;
	double getnewkzbbfb=0;
	double yqye=0;
	if (pdclzt.equals("5") || pdclzt.equals("6"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
		ls_sql=" select deflbm,shzzb,qye";
		ls_sql+=" from pd_pdjl ";
		ls_sql+=" where  khbh='"+khbh+"' and sgd='"+oldsgd+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			deflbm=cf.fillNull(rs.getString("deflbm"));
			shzzb=cf.fillNull(rs.getString("shzzb"));
			yqye=rs.getDouble("qye");
		}
		else{
			out.println("���󣡲����ڵ��ɵ���¼");
			return;
		}
		rs.close();
		ps.close();
	}
	else if (pdclzt.equals("8"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
		ls_sql="select deflbm,newkzbbfb,qye";
		ls_sql+=" from  pd_hsgdjl";
		ls_sql+=" where  khbh='"+khbh+"' and newsgd='"+oldsgd+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			deflbm=cf.fillNull(rs.getString("deflbm"));
			getnewkzbbfb=rs.getDouble("newkzbbfb");
			yqye=rs.getDouble("qye");
		}
		else{
			out.println("���󣡲����ڵĻ�ʩ���Ӽ�¼");
			return;
		}
		rs.close();
		ps.close();
	}
	else{
		out.println("�����ɵ�״̬����ȷ");
		return;
	}


	double oldjrpde=0;//ԭʩ���Ӽ����ɵ���
	double newjrpde=0;//��ʩ���Ӽ����ɵ���
	if (pdclzt.equals("5") || pdclzt.equals("6"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
		if (shzzb.equals("Y"))//Y��ռָ�ꣻN����ռָ��
		{
			oldjrpde=(oldkzbbfb-100)/100*yqye;//��
		}
		else{
			oldjrpde=oldkzbbfb/100*yqye;//��
		}

	}
	else if (pdclzt.equals("8"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
		oldjrpde=(oldkzbbfb-getnewkzbbfb)/100*yqye;//��
	}

	newjrpde=newkzbbfb/100*yqye;//��
	
	
	long xuhao=0;
	ls_sql="SELECT max(xuhao)";
	ls_sql+=" FROM pd_hsgdjl ";
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

	ls_sql="insert into pd_hsgdjl (khbh,newsgd,newsgbz,oldsgd,oldsgbz,oldpdclzt,qye,deflbm,kpjlh,oldkzbbfb   ,newkzbbfb,oldjrpde,newjrpde,hsgdyy,ybysxmbm,zqysxmbm,lrr,lrsj,dwbh,xuhao) ";
	ls_sql+=" values (?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,newsgd);
	ps.setString(3,newsgbz);
	ps.setString(4,oldsgd);
	ps.setString(5,oldsgbz);
	ps.setString(6,pdclzt);
	ps.setDouble(7,yqye);
	ps.setString(8,deflbm);
	ps.setString(9,kpjlh);
	ps.setDouble(10,oldkzbbfb);

	ps.setDouble(11,newkzbbfb);
	ps.setDouble(12,oldjrpde);
	ps.setDouble(13,newjrpde);
	ps.setString(14,hsgdyy);
	ps.setString(15,ybysxmbm);
	ps.setString(16,zqysxmbm);
	ps.setString(17,lrr);
	ps.setDate(18,lrsj);
	ps.setString(19,dwbh);
	ps.setLong(20,xuhao);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set sgd=?,sgbz=?,pdr=?,pdsj=?,pdsm=?,pdclzt='8'";//8����ʩ����
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newsgd);
	ps.setString(2,newsgbz);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,hsgdyy);
	ps.executeUpdate();
	ps.close();

	if (pdclzt.equals("5") || pdclzt.equals("6"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
		ls_sql="update pd_pdjl set hfjl='5'";//0���ɵ���3���ܵ���5����ʩ����
		ls_sql+=" where  khbh='"+khbh+"' and sgd='"+oldsgd+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	//�޸��ɵ�ָ�꣫����������������������������������ʼ

	//�޸ģ�ԭʩ����
	if (deflbm.equals("1"))//1����
	{
		//�ѽӴ���
		ls_sql="update kp_pdkpmx set yjddje=yjddje+("+oldjrpde+"/10000.0),syddje=syddje-("+oldjrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("2"))//2���е�
	{
		ls_sql="update kp_pdkpmx set yjzdje=yjzdje+("+oldjrpde+"/10000.0),syzdje=syzdje-("+oldjrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("3"))//3��С��
	{
		ls_sql="update kp_pdkpmx set yjxdje=yjxdje+("+oldjrpde+"/10000.0),syxdje=syxdje-("+oldjrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

			
	ls_sql="update kp_pdkpmx set yjdze=yjddje+yjzdje+yjxdje,sydze=syddje+syzdje+syxdje";
	ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�޸ģ���ʩ����

	if (deflbm.equals("1"))//1����
	{
		//�ѽӴ���
		ls_sql="update kp_pdkpmx set yjddje=yjddje+("+newjrpde+"/10000.0),syddje=syddje-("+newjrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("2"))//2���е�
	{
		ls_sql="update kp_pdkpmx set yjzdje=yjzdje+("+newjrpde+"/10000.0),syzdje=syzdje-("+newjrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("3"))//3��С��
	{
		ls_sql="update kp_pdkpmx set yjxdje=yjxdje+("+newjrpde+"/10000.0),syxdje=syxdje-("+newjrpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

			
	ls_sql="update kp_pdkpmx set yjdze=yjddje+yjzdje+yjxdje,sydze=syddje+syzdje+syxdje";
	ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�޸��ɵ�ָ�ꣽ�����������������������������������������


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("��ʩ���ӳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
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