<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String psph=request.getParameter("psph");


String[] clbm=request.getParameterValues("clbm");
String[] psslstr=request.getParameterValues("pssl");
double pssl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	ls_sql=" SELECT psdzt ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0"))//0���ȴ��ύ��2���ȴ����⣻3���ѳ��⣻5�����ֳ���
	{
		out.print("�������͵�["+psph+"]���ύ���������޸ģ�");
		return;
	}

	//��ѯ�������
	int psxh=0;
	ls_sql="select NVL(max(psxh),0)";
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

	for (int i=0;i<clbm.length ;i++ )
	{
		if (psslstr[i]==null || psslstr[i].trim().equals(""))
		{
			ls_sql="delete from jxc_clpsmx ";
			ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		pssl = Double.parseDouble(psslstr[i].trim());
		if (pssl==0)
		{
			ls_sql="delete from jxc_clpsmx ";
			ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		String xsfs="";
		double zcpzsl=0;
		double dhsl=0;
		ls_sql="select xsfs,zcpzsl,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
		{
			if (pssl > (zcpzsl-dhsl))
			{
				conn.rollback();
				out.println("�����ֻ����ۣ�����������"+pssl+"�����ܴ��ڡ��ɶ�������"+(zcpzsl-dhsl)+"�����ɶ�������������Ʒ��棭����");
				return;
			}
		}

		//��ѯ�Ƿ��Ѵ���
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and psph='"+psph+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			psxh++;
			ls_sql="insert into jxc_clpsmx (psph,clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dj,ppmc,pssl,psje,cksl,psxh)";
			ls_sql+=" select ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,dgzjg,dgzjg,ppmc,?,dgzjg*?,0,? ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,psph);
			ps.setDouble(2,pssl);
			ps.setDouble(3,pssl);
			ps.setInt(4,psxh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update jxc_clpsmx set pssl=?,psje=dj*?";
			ls_sql+=" where clbm='"+clbm[i]+"'  and psph='"+psph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,pssl);
			ps.setDouble(2,pssl);
			ps.executeUpdate();
			ps.close();
		}
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


	double wdzgce = 0;
	double zjxje = 0;
	ls_sql=" SELECT wdzgce,zjxje ";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		wdzgce = rs.getDouble("wdzgce");
		zjxje = rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();

	pszje = 0;
	ls_sql=" SELECT sum(pszje) ";
	ls_sql+=" FROM jxc_clpsd ";
	ls_sql+=" where jxc_clpsd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pszje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double thzje = 0;
	ls_sql=" SELECT sum(thzje) ";
	ls_sql+=" FROM jxc_clpsthd";
	ls_sql+=" where jxc_clpsthd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		thzje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	// ���ͱ�����ʽӦ����Ϊ���������ۼƽ��˻��ۼƽ�/���̷ѣ����й��̷ѣ���ͬԭ��ۣ���������ǰ���

	double psbl=cf.round((pszje-thzje)*100/(wdzgce+zjxje),1);


	if (psbl>25 || psbl<18)
	{
		out.println("�������ͱ������ѣ���ǰ���ͱ���"+psbl+"%����ͬԭ��ۣ���ǰ�����"+(wdzgce+zjxje)+"���������ۼƽ��˻��ۼƽ�"+(pszje-thzje)+"��");
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