<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] shbh = request.getParameterValues("shbh");
//if (cqkbh.length>1)
//{
//	out.println("����ÿ��ֻ��ɾ��һ����¼");
//	return;
//}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	for(int i=0;i<shbh.length;i++){
		int count=0;

		long yshbh=0;
		String zpsqbh=null;
		String yztbm=null;
		String ysqzt=null;
		String yshjl=null;
		String yshyj=null;
		String yshr=null;
		long yshhrs=0;
		java.sql.Date yshsj=null;
//ȡ��Ҫ��ԭ������
		ls_sql="select zpsqbh,yshbh,yztbm,ysqzt,yshjl,yshyj,yshr,yshsj,yshhrs";
		ls_sql+=" from  rs_zpsh";
		ls_sql+=" where  shbh='"+shbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zpsqbh=rs.getString("zpsqbh");
			yshbh=rs.getLong("yshbh");
			yztbm=rs.getString("yztbm");
			ysqzt=rs.getString("ysqzt");
			yshjl=rs.getString("yshjl");
			yshyj=rs.getString("yshyj");
			yshr=rs.getString("yshr");
			yshsj=rs.getDate("yshsj");
			yshhrs=rs.getLong("yshhrs");
		}
		else{
			out.println("����������¼������");
			return;
		}
		rs.close();
		ps.close();

//��ԭ��Ƹ�ƻ�
		conn.setAutoCommit(false);

		ls_sql="update rs_zpsq set ztbm=?,shjl=?,sqzt=?,shyj=?,shr=?,shsj=?,shbh=?,shhrs=? ";
		ls_sql+=" where zpsqbh='"+zpsqbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yztbm);
		ps.setString(2,yshjl);
		ps.setString(3,ysqzt);
		ps.setString(4,yshyj);
		ps.setString(5,yshr);
		ps.setDate(6,yshsj);
		ps.setLong(7,yshbh);
		ps.setLong(8,yshhrs);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from rs_zpsh where shbh='"+shbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		conn.commit();
	}
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ�����ˢ���б���ʾɾ��������");
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
