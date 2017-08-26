<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fcsq=request.getParameter("fcsq");
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");
String[] clbm=request.getParameterValues("clbm");
String[] psslStr=request.getParameterValues("pssl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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

	if (!psdzt.equals("1"))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6������ˣ�
	{
		out.print("���󣡲��ϵ�["+psph+"]�������ɣ��������޸ģ������޸����ڡ����ϵ����޻���ˡ���ɾ�������Ϣ");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		double pssl = Double.parseDouble(psslStr[i]);

		String xsfs="";
		double dhsl=0;
		ls_sql="select xsfs,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.ssfgs='"+fcsq+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		double zcpzsl=0;//�����
		//��ѯ�����Ϣ
		ls_sql = " select sum(kcsl)";
		ls_sql+= " from jxc_kcb ";
		ls_sql +=" where clbm='"+clbm[i]+"' and ckbh in(select ckbh from jxc_ckssfgs where ssfgs='"+fcsq+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			zcpzsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4�����������
		{
			if (pssl > zcpzsl)
			{
				conn.rollback();
				out.println("�����ֻ����ۣ�����������"+pssl+"�����ܴ��ڡ��ɶ�������"+zcpzsl+"�����ɶ�������������Ʒ��棭����");
				return;
			}
		}

		ls_sql="update jxc_clpsmx set pssl=?,psje=dj*?";
		ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,pssl);
		ps.setDouble(2,pssl);
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


	//�����Ƿ���ϱ�׼��飫��������������������������������ʼ
	int mark=0;
    double qye=0;
	String fgsbh=null;
	ls_sql=" select fgsbh,NVL(guanlif,0)+NVL(suijin,0)+qye qye";
    ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();

	double allbzlyje=0;
	double alllyxxje=0;
	double alllysxje=0;
	ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allbzlyje=rs.getDouble(1);
		alllyxxje=rs.getDouble(2);
		alllysxje=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	double khpszje=0;
	ls_sql="SELECT sum(pszje)";
	ls_sql+=" FROM jxc_clpsd";
	ls_sql+=" where jxc_clpsd.khbh='"+khbh+"'";
	ls_sql+=" and jxc_clpsd.psdzt!='6' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khpszje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (alllyxxje!=0)
	{
		if (alllyxxje>khpszje)
		{
			mark++;
			out.println("<P>�ܶ����ѣ�С���������ޣ��������ޡ�"+alllyxxje+"���������ܶ"+khpszje+"��");
		}
	}

	if (alllysxje!=0)
	{
		if (alllysxje<khpszje)
		{
			mark++;
			out.println("<P>�ܶ����ѣ������������ޣ��������ޡ�"+alllysxje+"���������ܶ"+khpszje+"��");
		}
	}

	String clxlmc=null;
	ls_sql="SELECT jxc_clxlbm.clxlmc ";
	ls_sql+=" FROM jxc_clxlbm,jxc_cldlbm ";
    ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc";
    ls_sql+=" and jxc_cldlbm.cldllb in('2','3')";//1�����ģ�2�����ģ�3��ͨ��
    ls_sql+=" order by jxc_clxlbm.clxlmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clxlmc=cf.fillNull(rs.getString("clxlmc"));

		double bzlyje=0;
		double lyxxje=0;
		double lysxje=0;
		ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
		ls_sql+=" from jxc_fclybl";
		ls_sql+=" where dwbh='"+fgsbh+"' and clxlmc='"+clxlmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bzlyje=rs1.getDouble(1);
			lyxxje=rs1.getDouble(2);
			lysxje=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		double ljpssl=0;
		double ljpsje=0;
		ls_sql="SELECT sum(jxc_clpsmx.pssl),sum(jxc_clpsmx.psje)";
		ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,jxc_clbm ";
		ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph and jxc_clpsmx.clbm=jxc_clbm.clbm";
		ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' and jxc_clbm.clxlbm='"+clxlmc+"' ";
		ls_sql+=" and jxc_clpsd.psdzt!='6' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljpssl=rs1.getDouble(1);
			ljpsje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (lyxxje!=0)
		{
			if (lyxxje>ljpsje)
			{
				mark++;
				out.println("<P>С��["+clxlmc+"]���ѣ�С���������ޣ��������ޡ�"+lyxxje+"����Ŀǰ�ۼ����á�"+ljpsje+"��");
			}
		}

		if (lysxje!=0)
		{
			if (ljpsje>lysxje)
			{
				mark++;
				out.println("<P>С��["+clxlmc+"]���ѣ������������ޣ��������ޡ�"+lysxje+"����Ŀǰ�ۼ����á�"+ljpsje+"��");
			}
		}

	}
	rs.close();
	ps.close();
	//�����Ƿ���ϱ�׼��飽����������������������������������

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>