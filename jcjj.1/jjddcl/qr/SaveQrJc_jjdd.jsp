<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");


String ls=null;
String htqrbz=cf.GB2Uni(request.getParameter("htqrbz"));
String htqrr=cf.GB2Uni(request.getParameter("htqrr"));
java.sql.Date htqrsj=null;
ls=request.getParameter("htqrsj");
try{
	if (!(ls.equals("")))  htqrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htqrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȷ��ʱ��]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

String[] zkfklxbm=request.getParameterValues("fklxbm");
double sfkje=0;
ls=request.getParameter("sfkje");
try{
	if (!(ls.equals("")))  sfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sfkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ����ת����]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String pdgcmc=null;
String khbh=null;
String clzt=null;
double htze=0;
double wdzje=0;

try {
	conn=cf.getConnection();

	ls_sql="select pdgcmc,khbh,clzt,htze,wdzje";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pdgcmc=rs.getString("pdgcmc");
		khbh=rs.getString("khbh").trim();
		clzt=rs.getString("clzt");
		htze=rs.getDouble("htze");
		wdzje=rs.getDouble("wdzje");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}

	String fgsbh=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	ls_sql="select fgsbh,dwbh,sjsbh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();
	ps.close();

	if (zkfklxbm!=null)
	{
		//������Ƿ��㹻��������������������������ʼ	
		double yfk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
		ls_sql+=" and "+cf.arrayToInSQL(zkfklxbm,"fklxbm");
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfk=rs.getDouble(1);//����ת����
		}
		rs.close();
		ps.close();

		if (yfk<sfkje)
		{
			out.println("<BR>����ת��㣡��ת�"+sfkje+"������Ԥ���"+yfk);
			return;
		}

		//������Ƿ��㹻----------------------����	
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set htqrsj=?,htqrr=?,htqrbz=?,clzt='15'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='13'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,htqrsj);
	ps.setString(2,htqrr);
	ps.setString(3,htqrbz);
	ps.executeUpdate();
	ps.close();

	if (zkfklxbm!=null)
	{
		for (int i=0;i<zkfklxbm.length ;i++ )
		{
			if (sfkje<=0)
			{
				continue;
			}
			//���θ�����
			double bcfkje=0;
			double kyje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
			ls_sql+=" and fklxbm='"+zkfklxbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				kyje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (kyje>sfkje)
			{
				bcfkje=sfkje;
			}
			else{
				bcfkje=kyje;
			}

			sfkje=sfkje-bcfkje;

			//���븶���¼ 
			String fkxh=null;
			int count=0;
			ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			fkxh=khbh+cf.addZero(count+1,3);

			String fklxbm="24";//24���Ҿ�

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?) ";//1�������տ2���ǲ�����տ�
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,fklxbm);
			ps.setDouble(5,bcfkje);
			ps.setString(6,"");
			ps.setString(7,htqrr);
			ps.setDate(8,htqrsj);
			ps.setString(9,lrbm);
			ps.setString(10,htqrr);

			ps.setDate(11,htqrsj);
			ps.setString(12,"�Ҿ��տ�ȷ���Զ�ת��");
			ps.setString(13,"31");//31:ת��
			ps.setString(14,zkfklxbm[i]);
			ps.setString(15,lrbm);

			ps.setString(16,pdgcmc);
			ps.setString(17,ddbh);
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,"");
			ps.setString(23,"");

			ps.setString(24,htqrr);
			ps.setDate(25,htqrsj);

			ps.setString(26,"1");//1�������տ2���ǲ�����տ�
			ps.setString(27,"");
			ps.executeUpdate();
			ps.close();

			
			//ת�����ʽ�����ɹ�����¼
			int glxh=0;//�������
			count=0;

			//��ȡ�������
			ls_sql="select NVL(max(glxh),0)";
			ls_sql+=" from  cw_glfkjl";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				glxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			glxh++;

			//���������¼ 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,glxh);
			ps.setString(2,fkxh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update cw_khfkjl set glxh=?";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,glxh);
			ps.executeUpdate();
			ps.close();

			//������������¼ 
			String newfkxh=null;
			ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newfkxh=khbh+cf.addZero(count+1,3);

			//fkxh=newfkxh
			//����glxh
			//����gljlbz
			//����gysbh=zcgysbh
			//fklxbm=zckx
			//fkje=-1*fkje
			//zckx=fklxbm
			//zcgysbh=gysbh
			//fkcs=""
			//yfkbl=""
			//yfkje=""
			//sfkbl=""

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,newfkxh);
			ps.setString(3,"");
			ps.setString(4,zkfklxbm[i]);
			ps.setDouble(5,-1*bcfkje);
			ps.setString(6,"");
			ps.setString(7,htqrr);
			ps.setDate(8,htqrsj);
			ps.setString(9,lrbm);
			ps.setString(10,htqrr);

			ps.setDate(11,htqrsj);
			ps.setString(12,"�Ҿ��տ�ȷ���Զ�ת��");
			ps.setString(13,"31");
			ps.setString(14,fklxbm);
			ps.setString(15,lrbm);

			ps.setString(16,"");
			ps.setString(17,"");
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,pdgcmc);
			ps.setString(23,ddbh);

			ps.setString(24,htqrr);
			ps.setDate(25,htqrsj);
			ps.setInt(26,glxh);

			ps.setString(27,"1");//1�������տ2���ǲ�����տ�
			ps.setString(28,"");
			ps.executeUpdate();
			ps.close();

			//���������¼ 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,glxh);
			ps.setString(2,newfkxh);
			ps.executeUpdate();
			ps.close();
		}
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