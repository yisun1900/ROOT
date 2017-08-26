<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gysbm=0;
String gysmc=null;
ls=request.getParameter("gysbm");
try{
	if (!(ls.equals("")))  gysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gysbm������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ӧ�̱���]����ת����������:"+e);
	return;
}
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


String yhdlm=null;
String yhkl=null;
String yhmc=null;
String gyslx=null;
String kdlxtbz=null;
long lxdlsbcs=0;
java.sql.Date mmxgsj=null;
long mmsyzq=0;
long yxdlsbcs=0;
String sfsd=null;

yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
yhkl=cf.GB2Uni(request.getParameter("yhkl"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
kdlxtbz=cf.GB2Uni(request.getParameter("kdlxtbz"));
ls=request.getParameter("lxdlsbcs");
try{
	if (!(ls.equals("")))  lxdlsbcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lxdlsbcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ѿ���½ʧ�ܴ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("mmsyzq");
try{
	if (!(ls.equals("")))  mmsyzq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mmsyzq������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʹ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxdlsbcs");
try{
	if (!(ls.equals("")))  yxdlsbcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yxdlsbcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����½ʧ�ܴ���]����ת����������:"+e);
	return;
}
sfsd=cf.GB2Uni(request.getParameter("sfsd"));

String whereppbm=null;
String wheregysbm=null;
whereppbm=cf.GB2Uni(request.getParameter("whereppbm"));
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  yhdlm='"+yhdlm+"' and gysbm!='"+wheregysbm+"'";
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
		out.println("�����û���½���Ѵ���");
		return;
	}
	else{
		ls_sql="select count(*)";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			out.println("����[�û���¼��]�ѱ��ڲ�Ա��ռ��");
			return;
		}
	}

	
	String oldyhdlm=null;
	ls_sql="select yhdlm";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldyhdlm=rs.getString(1);
	}
	rs.close();
	ps.close();



	ls_sql="select gysmc ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+gysbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=rs.getString("gysmc");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm!="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jxc_ppgysdzb set gysbm=?,gysmc=?,yhdlm=?,yhkl=?,yhmc=?,kdlxtbz=?,lxdlsbcs=?,mmsyzq=?,yxdlsbcs=?,sfsd=?";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,gysbm);
	ps.setString(2,gysmc);
	ps.setString(3,yhdlm);
	ps.setString(4,yhkl);
	ps.setString(5,yhmc);
	ps.setString(6,kdlxtbz);
	ps.setLong(7,lxdlsbcs);
	ps.setLong(8,mmsyzq);
	ps.setLong(9,yxdlsbcs);
	ps.setString(10,sfsd);
	ps.executeUpdate();
	ps.close();


	if (oldyhdlm!=null && yhdlm.equals(""))
	{
		//ȡ���û�Ȩ��
		ls_sql="delete from sq_yhssz where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from  sq_yhewqx where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
	else if (oldyhdlm!=null && !yhdlm.equals(oldyhdlm))
	{
		//ȡ���û�Ȩ��
		ls_sql="update sq_yhssz set yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update sq_yhewqx set yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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