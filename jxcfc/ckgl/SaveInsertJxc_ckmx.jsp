<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String lsh=null;
String ckph = request.getParameter("ckph");
String ckbh = request.getParameter("ckbh");
String dqbm = request.getParameter("dqbm");


String[] clbm =request.getParameterValues("clbm");
String[] ckslstr =request.getParameterValues("cksl");
String[] xsfs =request.getParameterValues("xsfs");
String[] kcslstr =request.getParameterValues("kcsl");
String[] xckslstr =request.getParameterValues("xcksl");
String[] ckdjstr =request.getParameterValues("ckdj");
String[] cbdjstr =request.getParameterValues("cbdj");

double cksl=0;
double kcsl=0;
double xcksl=0;//���������
double ckdj=0;
double cbdj=0;

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps2=null;
ResultSet rs2 = null;

try {
	conn=cf.getConnection();    //�õ�����


	//��ѯ���ⵥ
	String ckdzt = null;
	String ssfgs=null;
	ls_sql = " select ckdzt,fgsbh ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	else
	{
		out.print("���󣡲����ڵĳ��ⵥ");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("���󣡳��ⵥ���ύ");
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

	//��ѯ������
	double ckxh=0;
	ls_sql=" select NVL(max(ckxh),0)";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		double count=0;
		ls_sql=" select count(*)";
		ls_sql+=" from jxc_ckmx ";
		ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("<BR>���󣡡�"+clbm[i]+"���ѳ���");
			return;
		}

		//��������
		try{
			cksl=Double.parseDouble(ckslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>���󣡡�"+clbm[i]+"��[��������]�����������ͣ�"+ckslstr[i]);
			return;
		}

		if (cksl<0)
		{
			out.println("<BR>���󣡡�"+clbm[i]+"��������������С��0");
			conn.rollback();
			return;
		}

		if (cksl==0)
		{
			continue;
		}

		kcsl=Double.parseDouble(kcslstr[i].trim());
		xcksl=Double.parseDouble(xckslstr[i].trim());
		ckdj=Double.parseDouble(ckdjstr[i].trim());
		cbdj=Double.parseDouble(cbdjstr[i].trim());

		//��飺�����������ܴ�����Ҫ��������������������������������ʼ
		//��������������������������������ѳ�������
		if (cksl>xcksl)
		{
			conn.rollback();
			out.print("<BR>���󣡲��ϡ�"+clbm[i]+"��������������"+cksl+"�����ܴ��ڡ������������"+xcksl+"��");
			return;
		}
		//��飺�����������ܴ�����Ҫ����������������������������������

		//��飺�����������ܴ��ڿ������������������������������ʼ
		//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4�����������
		if (xsfs[i].equals("2") || xsfs[i].equals("3"))
		{
			if (cksl>kcsl)
			{
				conn.rollback();
				out.print("<BR>���󣡲��ϡ�"+clbm[i]+"��������������"+cksl+"�����ܴ��ڡ����������"+kcsl+"��");
				return;
			}
		}
		//��飺�����������ܴ��ڿ��������������������������������
		
		ckxh++;

		String zljb="1";//1������Ʒ��2���д�Ʒ��3������Ʒ
		double ckje=ckdj*cksl;

		if (fccbj.equals("2"))//1�����ۣ�2����Ȩƽ����
		{
			if (xsfs[i].equals("1"))//����Ʒ
			{
				ls_sql="insert into jxc_ckmx (ckph,ckxh  ,clbm         ,clmc,xh,gg,nbbm,ppmc,gysmc          ,cldlbm         ,clxlbm           ,zljb,jldwbm,cksl,ckdj,ckje,cbdj             ,cbje               ,ckbh,xsfs,sfyfkc,fkcs) ";
				ls_sql+=" select              ?   ,?     ,jxc_clbm.clbm,clmc,xh,gg,nbbm,ppmc,jxc_cljgb.gysmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm  ,?   ,jldwbm,?   ,?   ,?   ,jxc_cljgb.cbj    ,jxc_cljgb.cbj*?    ,?   ,?   ,'1'   ,0  ";
				ls_sql+=" from jxc_clbm,jxc_cljgb ";
				ls_sql+=" where  jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ckph);
				ps.setDouble(2,ckxh);
				ps.setString(3,zljb);
				ps.setDouble(4,cksl);
				ps.setDouble(5,ckdj);
				ps.setDouble(6,ckje);
				ps.setDouble(7,cksl);
				ps.setString(8,ckbh);
				ps.setString(9,xsfs[i]);
				ps.executeUpdate();
				ps.close();
			}
			else {
				ls_sql="insert into jxc_ckmx (ckph,ckxh  ,clbm         ,clmc,xh,gg,nbbm,ppmc,gysmc          ,cldlbm         ,clxlbm           ,zljb,jldwbm,cksl,ckdj,ckje,cbdj             ,cbje               ,ckbh,xsfs,sfyfkc,fkcs) ";
				ls_sql+=" select              ?   ,?     ,jxc_clbm.clbm,clmc,xh,gg,nbbm,ppmc,jxc_cljgb.gysmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm  ,?   ,jldwbm,?   ,?   ,?   ,jxc_cljgb.jqpjcbj,jxc_cljgb.jqpjcbj*?,?   ,?   ,'1'   ,0  ";
				ls_sql+=" from jxc_clbm,jxc_cljgb ";
				ls_sql+=" where  jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ckph);
				ps.setDouble(2,ckxh);
				ps.setString(3,zljb);
				ps.setDouble(4,cksl);
				ps.setDouble(5,ckdj);
				ps.setDouble(6,ckje);
				ps.setDouble(7,cksl);
				ps.setString(8,ckbh);
				ps.setString(9,xsfs[i]);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			ls_sql="insert into jxc_ckmx (ckph,ckxh  ,clbm         ,clmc,xh,gg,nbbm,ppmc,gysmc          ,cldlbm         ,clxlbm           ,zljb,jldwbm,cksl,ckdj,ckje,cbdj         ,cbje           ,ckbh,xsfs,sfyfkc,fkcs) ";
			ls_sql+=" select              ?   ,?     ,jxc_clbm.clbm,clmc,xh,gg,nbbm,ppmc,jxc_cljgb.gysmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm  ,?   ,jldwbm,?   ,?   ,?   ,jxc_cljgb.cbj,jxc_cljgb.cbj*?,?   ,?   ,'1'   ,0  ";
			ls_sql+=" from jxc_clbm,jxc_cljgb ";
			ls_sql+=" where  jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ckph);
			ps.setDouble(2,ckxh);
			ps.setString(3,zljb);
			ps.setDouble(4,cksl);
			ps.setDouble(5,ckdj);
			ps.setDouble(6,ckje);
			ps.setDouble(7,cksl);
			ps.setString(8,ckbh);
			ps.setString(9,xsfs[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
