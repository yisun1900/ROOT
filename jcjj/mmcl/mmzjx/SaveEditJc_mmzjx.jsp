<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmzjxyybm=null;
String zjxbz=null;
String bz=null;
java.sql.Date jhazsj=null;
mmzjxyybm=cf.GB2Uni(request.getParameter("mmzjxyybm"));
zjxbz=cf.GB2Uni(request.getParameter("zjxbz"));
bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhazsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���װʱ��]����ת����������:"+e);
	return;
}
java.sql.Date zjxfssj=null;
ls=request.getParameter("zjxfssj");
try{
	if (!(ls.equals("")))  zjxfssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxfssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ʱ��]����ת����������:"+e);
	return;
}
double mmzkl=0;
ls=request.getParameter("mmzkl");
try{
	if (!(ls.equals("")))  mmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mmzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

String yddbh=request.getParameter("yddbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String fgsbh=null;
	ls_sql="select clzt,fgsbh";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00��¼��δ���
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

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
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������

	int count=0;
	ls_sql=" select kjxsj-SYSDATE";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count<0)
	{
		out.println("���ѣ��ѳ����ɼ����ֹʱ��");
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_mmzjx set mmzjxyybm=?,bz=?,jhazsj=?,zjxfssj=?,mmzkl=?,dzyy=? ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmzjxyybm);
	ps.setString(2,bz);
	ps.setDate(3,jhazsj);
	ps.setDate(4,zjxfssj);
	ps.setDouble(5,mmzkl);
	ps.setString(6,dzyy);
	ps.executeUpdate();
	ps.close();

	//��С��λ��������������������������������������ʼ
	ls_sql="update jc_mmdgdmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" and xh in(select xh from jc_mmzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_wjjddmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" and lrxh in(select lrxh from jc_wjzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_blddmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" and lrxh in(select lrxh from jc_blzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��С��λ������������������������������������
		
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>