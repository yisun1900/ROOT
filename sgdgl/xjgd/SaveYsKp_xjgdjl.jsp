<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String clr=null;
clr=cf.GB2Uni(request.getParameter("clr"));
java.sql.Date clsj=null;
String clsm=cf.GB2Uni(request.getParameter("clsm"));

ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����clsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
String cljg=request.getParameter("cljg");

String zgcljlh=request.getParameter("zgcljlh");
String zgjlh=request.getParameter("zgjlh");
String xjjlh=request.getParameter("xjjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getwtclbz=null;
	ls_sql="select wtclbz";
	ls_sql+=" from kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getwtclbz=cf.fillNull(rs.getString("wtclbz"));
	}
	rs.close();
	ps.close();

	if (getwtclbz.equals("Y"))//B�������ģ�N������δ���գ�C���ڴ�����Y���ѽ��
	{
		out.println("���������ѽ��");
		return;
	}

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from kp_zggdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("4"))//1:δ���գ�2�����գ�3���ڴ�����4���ѽ����5������ͨ����6������δͨ��
	{
		out.println("����״̬����ȷ");
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="insert into kp_zgclgdmx (zgcljlh,zgjlh,xjjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,zgjlh);
	ps.setString(3,xjjlh);
	ps.setString(4,"��������");
	ps.setString(5,cljg);
	ps.setString(6,clr);
	ps.setString(7,clsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_zggdmx set clzt='"+cljg+"',zgcljlh=?,ysr=?,yssj=SYSDATE,yssm=?  ";//1:δ���գ�2�����գ�3���ڴ�����4���ѽ����5������ͨ����6������δͨ��
	ls_sql+=" where zgjlh='"+zgjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,clr);
	ps.setString(3,clsm);
	ps.executeUpdate();
	ps.close();

	String setwtclbz=null;
	int zgclsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from kp_zggdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"' ";
	ls_sql+=" and clzt!='1'";//1:δ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zgclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (zgclsl==0)
	{
		setwtclbz="N";//B�������ģ�N������δ���գ�C���ڴ�����Y���ѽ��
	}
	else{
		zgclsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from kp_zggdmx";
		ls_sql+=" where xjjlh='"+xjjlh+"' ";
		ls_sql+=" and clzt!='5'";//1:δ���գ�2�����գ�3���ڴ�����4���ѽ����5������ͨ����6������δͨ��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zgclsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (zgclsl==0)
		{
			setwtclbz="Y";//B�������ģ�N������δ���գ�C���ڴ�����Y���ѽ��
		}
		else{
			setwtclbz="C";//B�������ģ�N������δ���գ�C���ڴ�����Y���ѽ��
		}
	}

	ls_sql="update kp_xjgdjl set wtclbz='"+setwtclbz+"'";
	ls_sql+=" where xjjlh='"+xjjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	if (cljg.equals("6"))//5������ͨ����6������δͨ��
	{
		//���Ͷ���
		ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
		String retStr=dxxt.jczgYs(conn,zgjlh,clr);//���÷��Ͷ��ź���
		if (retStr.equals(""))
		{
			out.println("���ŷ��ͳɹ�");
		}
		else{
			out.println(retStr);//�����ͽ����ʾ��ҳ����
		}
	}


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