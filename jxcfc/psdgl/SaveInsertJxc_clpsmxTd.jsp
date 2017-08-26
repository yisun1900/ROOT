<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String psph=cf.GB2Uni(request.getParameter("psph"));
String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
double pssl = 0;
double psje = 0;
ls=request.getParameter("pssl");
try{
	if (!(ls.equals("")))  pssl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pssl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("psje");
try{
	if (!(ls.equals("")))  psje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����psje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ͽ��]����ת����������:"+e);
	return;
}
String xsfs=request.getParameter("xsfs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	String ssfgs=null;
	ls_sql=" SELECT psdzt,ssfgs ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0") && !psdzt.equals("6"))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����δͨ����7�����ϣ�
	{
		out.print("���󣡲��ϵ�["+psph+"]���ύ���������޸ģ�");
		return;
	}

	String fccbj="";//1�����ۣ�2����Ȩƽ����
	ls_sql=" SELECT fccbj ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fccbj=cf.fillNull(rs.getString("fccbj"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql=" select count(*) ";
	ls_sql+=" from jxc_clpsmx ";
	ls_sql+=" where clbm='"+clbm+"'  and psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ѯ�������
	int psxh=0;
	ls_sql="select NVL(max(psxh),0)+1 ";
	ls_sql+=" from  jxc_clpsmx";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (count==0)
	{
		if (fccbj.equals("2"))//1�����ۣ�2����Ȩƽ����
		{
			ls_sql="insert into jxc_clpsmx (psph,clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dj,ppmc,gysmc,cldlbm,clxlbm,sqpssl,pssl,psje,cksl,psxh,xsfs)";
			ls_sql+=" select ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,jqpjcbj,dgzjg,ppmc,gysmc,cldlbm,clxlbm,?,?,?,0,?,? ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,psph);
			ps.setDouble(2,pssl);
			ps.setDouble(3,pssl);
			ps.setDouble(4,psje);
			ps.setInt(5,psxh);
			ps.setString(6,xsfs);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into jxc_clpsmx (psph,clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dj,ppmc,gysmc,cldlbm,clxlbm,sqpssl,pssl,psje,cksl,psxh,xsfs)";
			ls_sql+=" select ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dgzjg,ppmc,gysmc,cldlbm,clxlbm,?,?,?,0,?,? ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,psph);
			ps.setDouble(2,pssl);
			ps.setDouble(3,pssl);
			ps.setDouble(4,psje);
			ps.setInt(5,psxh);
			ps.setString(6,xsfs);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{
		ls_sql="update jxc_clpsmx set sqpssl=?,pssl=?,psje=?";
		ls_sql+=" where clbm='"+clbm+"'  and psph='"+psph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,pssl);
		ps.setDouble(2,pssl);
		ps.setDouble(3,psje);
		ps.executeUpdate();
		ps.close();
	}
	

	double pszsl=0;
	double pszje=0;
	double cbze=0;
	ls_sql=" SELECT sum(pssl),sum(psje),sum(cbj*pssl) ";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszsl=rs.getDouble(1);
		pszje=rs.getDouble(2);
		cbze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_clpsd set pszsl="+pszsl+",pszje="+pszje+",cbze="+cbze;
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
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
	out.print("Exception: " + e);
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