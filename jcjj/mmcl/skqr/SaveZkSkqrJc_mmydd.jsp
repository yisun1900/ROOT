<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String skqrr=cf.GB2Uni(request.getParameter("skqrr"));

String ls=null;
java.sql.Date skqrsj=null;
ls=request.getParameter("skqrsj");
try{
	if (!(ls.equals("")))  skqrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����skqrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�տ�ȷ��ʱ��]����ת����������:"+e);
	return;
}
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


try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String pdgcmc=null;
	ls_sql="select khbh,clzt,pdgcmc";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh").trim();
		clzt=rs.getString("clzt");
		pdgcmc=rs.getString("pdgcmc");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("04"))
	{
		out.println("������ʧ�ܣ�����״̬����ȷ��");
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

	ls_sql="update jc_mmydd set clzt='23',skqrsj=?,skqrr=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='04' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,skqrsj);
	ps.setString(2,skqrr);
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

			String fklxbm="21";//21:ľ��

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?) ";//1�������տ2���ǲ�����տ�
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,fklxbm);
			ps.setDouble(5,bcfkje);
			ps.setString(6,"");
			ps.setString(7,skqrr);
			ps.setDate(8,skqrsj);
			ps.setString(9,lrbm);
			ps.setString(10,skqrr);

			ps.setDate(11,skqrsj);
			ps.setString(12,"ľ���տ�ȷ���Զ�ת��");
			ps.setString(13,"31");//31:ת��
			ps.setString(14,zkfklxbm[i]);
			ps.setString(15,lrbm);

			ps.setString(16,pdgcmc);
			ps.setString(17,yddbh);
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,"");
			ps.setString(23,"");

			ps.setString(24,skqrr);
			ps.setDate(25,skqrsj);

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
			ps.setString(7,skqrr);
			ps.setDate(8,skqrsj);
			ps.setString(9,lrbm);
			ps.setString(10,skqrr);

			ps.setDate(11,skqrsj);
			ps.setString(12,"ľ���տ�ȷ���Զ�ת��");
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
			ps.setString(23,yddbh);

			ps.setString(24,skqrr);
			ps.setDate(25,skqrsj);
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