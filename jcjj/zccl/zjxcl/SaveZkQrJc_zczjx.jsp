<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String zjxbh=request.getParameter("zjxbh");
String qrr=cf.GB2Uni(request.getParameter("qrr"));

java.sql.Date qrsj=null;
ls=request.getParameter("qrsj");
try{
	if (!(ls.equals("")))  qrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ȷ��ʱ�� ]����ת����������:"+e);
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
String zktkbz=request.getParameter("zktkbz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ddbh=null;
	String khbh=null;
	String clzt=null;
	String ppbm=null;
	double zjxze=0;
	ls_sql =" select ddbh,khbh,clzt,ppbm,zjxze";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ddbh=rs.getString("ddbh").trim();
		khbh=rs.getString("khbh").trim();
		clzt=rs.getString("clzt");
		ppbm=rs.getString("ppbm");
		zjxze=rs.getDouble("zjxze");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("01"))
	{
		out.println("<BR>���󣬴���ʧ�ܣ������״̬����ȷ");
		return;
	}

	double hkze=0;
	double zjhze=0;
	ls_sql="select hkze,zjhze";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
	}
	rs.close();
	ps.close();

	String fgsbh=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	String fkkhxm=null;
	String fkfwdz=null;
	ls_sql="select fgsbh,dwbh,sjsbh,sjs,khxm,fwdz";
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
		fkkhxm=cf.fillNull(rs.getString("khxm"));
		fkfwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	if (zktkbz.equals("1"))//1��ת�2���˿3�����������4��Ԥ�����
	{
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
	}
	else if (zktkbz.equals("2"))//1��ת�2���˿3�����������4��Ԥ�����
	{
		if (sfkje>0)//��ת��Ԥ����
		{
			//������Ƿ��㹻��������������������������ʼ	
			double yfk=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yfk=rs.getDouble(1);//����ת����
			}
			rs.close();
			ps.close();


			if ( (yfk-(hkze+zjhze))<sfkje)
			{
				out.println("<BR>����ת��㣡��ת�"+sfkje+"��ʣ���"+(yfk-(hkze+zjhze)));
				return;
			}
			//������Ƿ��㹻----------------------����	
		}
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_zczjx set qrr='"+qrr+"',qrsj=SYSDATE,clzt='02'";
	ls_sql+=" where zjxbh='"+zjxbh+"' and  clzt='01'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (zktkbz.equals("1"))//1��ת�2���˿3�����������4��Ԥ�����
	{
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

				String fklxbm="23";//23:����

				ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz ) ";
				ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?,?,?,?,?) ";//1�������տ2���ǲ�����տ�
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,fkxh);
				ps.setString(3,"");
				ps.setString(4,fklxbm);
				ps.setDouble(5,bcfkje);
				ps.setString(6,"");
				ps.setString(7,qrr);
				ps.setDate(8,qrsj);
				ps.setString(9,lrbm);
				ps.setString(10,qrr);

				ps.setDate(11,qrsj);
				ps.setString(12,"����������ȷ���Զ�ת��");
				ps.setString(13,"31");//31:ת��
				ps.setString(14,zkfklxbm[i]);
				ps.setString(15,lrbm);

				ps.setString(16,ppbm);
				ps.setString(17,ddbh);
				ps.setString(18,sjs);
				ps.setString(19,sjsbh);
				ps.setString(20,dwbh);
				ps.setString(21,fgsbh);
				ps.setString(22,"");
				ps.setString(23,"");

				ps.setString(24,qrr);
				ps.setDate(25,qrsj);

				ps.setString(26,"1");//1�������տ2���ǲ�����տ�
				ps.setString(27,"");
				ps.setString(28,zjxbh);
				ps.setString(29,"");
				ps.setString(30,fkkhxm);
				ps.setString(31,fkfwdz);
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

				ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz) ";
				ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?,?,?) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,newfkxh);
				ps.setString(3,"");
				ps.setString(4,zkfklxbm[i]);
				ps.setDouble(5,-1*bcfkje);
				ps.setString(6,"");
				ps.setString(7,qrr);
				ps.setDate(8,qrsj);
				ps.setString(9,lrbm);
				ps.setString(10,qrr);

				ps.setDate(11,qrsj);
				ps.setString(12,"����������ȷ���Զ�ת��");
				ps.setString(13,"31");
				ps.setString(14,fklxbm);
				ps.setString(15,lrbm);

				ps.setString(16,"");
				ps.setString(17,"");
				ps.setString(18,sjs);
				ps.setString(19,sjsbh);
				ps.setString(20,dwbh);
				ps.setString(21,fgsbh);
				ps.setString(22,ppbm);
				ps.setString(23,ddbh);

				ps.setString(24,qrr);
				ps.setDate(25,qrsj);
				ps.setInt(26,glxh);

				ps.setString(27,"1");//1�������տ2���ǲ�����տ�
				ps.setString(28,"");
				ps.setString(29,"");
				ps.setString(30,zjxbh);
				ps.setString(31,fkkhxm);
				ps.setString(32,fkfwdz);
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

	}
	else if (zktkbz.equals("2"))//1��ת�2���˿3�����������4��Ԥ�����
	{
		if (sfkje>0)//��ת��Ԥ����
		{
			double bcfkje=sfkje;

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

			String fklxbm="62";//62:����Ԥ����
			String zckx="23";//23:����

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?,?,?,?,?) ";//1�������տ2���ǲ�����տ�
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,fklxbm);
			ps.setDouble(5,bcfkje);
			ps.setString(6,"");
			ps.setString(7,qrr);
			ps.setDate(8,qrsj);
			ps.setString(9,lrbm);
			ps.setString(10,qrr);

			ps.setDate(11,qrsj);
			ps.setString(12,"����������ȷ���Զ�ת��");
			ps.setString(13,"31");//31:ת��
			ps.setString(14,zckx);
			ps.setString(15,lrbm);

			ps.setString(16,"");
			ps.setString(17,"");
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,ppbm);
			ps.setString(23,ddbh);

			ps.setString(24,qrr);
			ps.setDate(25,qrsj);

			ps.setString(26,"1");//1�������տ2���ǲ�����տ�
			ps.setString(27,"");
			ps.setString(28,"");
			ps.setString(29,zjxbh);
			ps.setString(30,fkkhxm);
			ps.setString(31,fkfwdz);
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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?,?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,newfkxh);
			ps.setString(3,"");
			ps.setString(4,zckx);
			ps.setDouble(5,-1*bcfkje);
			ps.setString(6,"");
			ps.setString(7,qrr);
			ps.setDate(8,qrsj);
			ps.setString(9,lrbm);
			ps.setString(10,qrr);

			ps.setDate(11,qrsj);
			ps.setString(12,"����������ȷ���Զ�ת��");
			ps.setString(13,"31");
			ps.setString(14,fklxbm);
			ps.setString(15,lrbm);

			ps.setString(16,ppbm);
			ps.setString(17,ddbh);
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,"");
			ps.setString(23,"");

			ps.setString(24,qrr);
			ps.setDate(25,qrsj);
			ps.setInt(26,glxh);

			ps.setString(27,"1");//1�������տ2���ǲ�����տ�
			ps.setString(28,"");
			ps.setString(29,zjxbh);
			ps.setString(30,"");
			ps.setString(31,fkkhxm);
			ps.setString(32,fkfwdz);
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

	//��鸶��ܳ�����������
	if (zktkbz.equals("1"))//1��ת�2���˿3�����������4��Ԥ�����
	{
		double fkjeall=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//23:����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fkjeall=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (fkjeall>cf.round(hkze+zjhze,2))
		{
			conn.rollback();
			out.println("<BR>���󣬸�����["+fkjeall+"]���ܳ����������["+cf.round(hkze+zjhze,2)+"]");
			return;
		}
	}
		

	int skmark=0;	
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//23:����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		skmark=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (skmark>1)
	{
		conn.rollback();
		out.println("<BR>�������������и����¼��������ȷ��ת����ò����տ�");
		return;
	}
		
	
	//�ۼƸ��������������������������������ʼ
	double sskje=0;//ʵ�տ���
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and zjxbh='"+zjxbh+"'";
	ls_sql+=" and fklxbm='23'";//23:����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sskje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (sskje<0)
	{
//		conn.rollback();
//		out.println("���󣡸ö����ۼƸ����ܶ��Ϊ����:"+sskje);
//		return;
	}

	double shsskje=0;//�������ʵ�տ���
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and zjxbh='"+zjxbh+"'";
	ls_sql+=" and fklxbm='23'";//23:����
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shsskje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sskje);
	ps.setDouble(2,shsskje);
	ps.executeUpdate();
	ps.close();

	double getzjxze=0;
	java.sql.Date yjjzsj=null;
	ls_sql="select zjxze,yjjzsj";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzjxze=rs.getDouble(1);
		yjjzsj=rs.getDate(2);
	}
	rs.close();
	ps.close();

	if (yjjzsj==null)
	{
		if (shsskje>=getzjxze)
		{
			yjjzsj=qrsj;

			ls_sql="update jc_zczjx set yjjzsj=?";
			ls_sql+=" where zjxbh='"+zjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{
		if (shsskje<getzjxze)
		{
			yjjzsj=null;

			ls_sql="update jc_zczjx set yjjzsj=?";
			ls_sql+=" where zjxbh='"+zjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	//�ۼƸ����������������������������������
	
	
	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ȷ�ϳɹ���");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>