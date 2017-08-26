<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jlbz=cf.GB2Uni(request.getParameter("jlbz"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
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
String qye=cf.GB2Uni(request.getParameter("qye"));
String deflbm=cf.GB2Uni(request.getParameter("deflbm"));

String mgfrz=cf.GB2Uni(request.getParameter("mgfrz"));
String nwgfrz=cf.GB2Uni(request.getParameter("nwgfrz"));
String sdgfrz=cf.GB2Uni(request.getParameter("sdgfrz"));
String yqgfrz=cf.GB2Uni(request.getParameter("yqgfrz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


//0+�����ɵ�&5+�󵥵�С��&6+С���ִ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�
	
	ls_sql="delete from pd_pdjl";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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

	deflbm="A";

	ls_sql="insert into pd_pdjl (khbh,sgd,sgbz,zjxm,pdsj,pdr,pdsm,shzzb,jlbz,qye,deflbm,hfjl,kppdbz,xuhao,jrpde) ";
	ls_sql+=" values (?,?,?,?,SYSDATE,?,?,?,?,?,?,'0','1',?,0) ";//0��δ�ܵ���3���ܵ�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,sgd);
	ps.setString(3,"");
	ps.setString(4,zjxm);
	ps.setString(5,pdr);
	ps.setString(6,pdsm);
	ps.setString(7,"N");//Y��ռָ�ꣻN����ռָ��
	ps.setString(8,jlbz);
	ps.setString(9,qye);
	ps.setString(10,deflbm);
	ps.setLong(11,xuhao);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,mgfrz=?,nwgfrz=?,sdgfrz=?,yqgfrz=?,pdsm=?,pdclzt='2',jlbz=?,zjxm=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,pdsj);
	ps.setString(2,pdr);
	ps.setString(3,sgd);
	ps.setString(4,mgfrz);
	ps.setString(5,nwgfrz);
	ps.setString(6,sdgfrz);
	ps.setString(7,yqgfrz);
	ps.setString(8,pdsm);
	ps.setString(9,jlbz);
	ps.setString(10,zjxm);
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
	out.print("<BR>Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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