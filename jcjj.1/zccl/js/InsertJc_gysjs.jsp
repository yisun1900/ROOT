<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double qtycf=0;
String gys=null;
String ppbm=null;
String ssfgs=request.getParameter("ssfgs");

try {
	conn=cf.getConnection();

	int ddgyssl=0;
	ls_sql =" select count(distinct gys)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddgyssl>1)
	{
		out.println("���󣡲���ͬһ��Ӧ�̶���");
		return;
	}

	int ddppsl=0;
	ls_sql =" select count(distinct ppbm)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddppsl>1)
	{
		out.println("���󣡲���ͬһƷ��");
		return;
	}

	int isShMark=0;
	String jcddbh=null;
	String jcppbm=null;
	ls_sql =" select ddbh,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jcddbh=rs.getString("ddbh");
		jcppbm=rs.getString("ppbm");

		String getdsksjbz=null;
		String getfkxh=null;
		ls_sql =" select fkxh,dsksjbz";
		ls_sql+=" from cw_khfkjl";
		ls_sql+=" where ddbh='"+jcddbh+"' and scbz='N' and skdd='2'";//1��������ˣ�2�������
		ls_sql+=" and dsksjbz!='Y'";//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getfkxh=rs1.getString("fkxh");
			getdsksjbz=rs1.getString("dsksjbz");

			isShMark++;

			out.println("<BR>������"+jcddbh+"�������տ�δ��ˣ��տ���š�"+getfkxh+"��");
		}
		rs1.close();
		ps1.close();
	
	
	}
	rs.close();
	ps.close();

	if (isShMark>0)
	{
		return;
	}


	ls_sql =" select distinct gys,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gys=rs1.getString(1);
		ppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();


	int zjxgyssl=0;
	ls_sql =" select count(distinct gys)";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zjxgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (zjxgyssl>1)
	{
		out.println("���󣡲���ͬһ��Ӧ�̶���");
		return;
	}

	int zjxppsl=0;
	zjxppsl=0;
	ls_sql =" select count(distinct ppbm)";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zjxppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (zjxppsl>1)
	{
		out.println("���󣡲���ͬһƷ��");
		return;
	}

	String zjxgys="";
	String zjxppbm="";
	ls_sql =" select distinct gys,ppbm";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zjxgys=rs1.getString(1);
		zjxppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();


	if (ddgyssl>0 && zjxgyssl>0)
	{
		if (!zjxgys.equals("") && !gys.equals("") && !zjxgys.equals(gys) )
		{
			out.println("���󣡲���ͬһ��Ӧ�̶���");
			return;
		}

		if (!zjxppbm.equals("") && !ppbm.equals("") &&  !zjxppbm.equals(ppbm))
		{
			out.println("���󣡲���ͬһƷ��");
			return;
		}
	}

	if (ddgyssl==0)
	{
		gys=zjxgys;
		ppbm=zjxppbm;
	}
	
	//��������������������������������������ʼ	
	String jsfs=null;
	double jsbl=0;
	double dj=0;
	double cbj=0;
	String getddbh=null;
	String xh=null;
	ls_sql =" SELECT jsfs,jsbl,dj,cbj,ddbh,xh";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jsfs=cf.fillNull(rs.getString("jsfs"));
		jsbl=rs.getDouble("jsbl");
		dj=rs.getDouble("dj");
		cbj=rs.getDouble("cbj");
		getddbh=cf.fillNull(rs.getString("ddbh"));
		xh=cf.fillNull(rs.getString("xh"));

		if (jsfs.equals("2"))//1������ۣ�2���������
		{
			cbj=cf.round(dj*jsbl/100,2);

			ls_sql="update jc_zcddmx set cbj="+cbj;
			ls_sql+=" where ddbh='"+getddbh+"' and xh='"+xh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (jsfs.equals(""))
		{
			if (cbj==0 && jsbl!=0)
			{
				cbj=cf.round(dj*jsbl/100,2);

				ls_sql="update jc_zcddmx set cbj="+cbj;
				ls_sql+=" where ddbh='"+getddbh+"' and xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}

	}
	rs.close();
	ps.close();

	     //���������������������������������ʼ
	String getzjxbh="";
	ls_sql="select zjxbh";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ls_sql+=" and clzt!='00'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getzjxbh=rs1.getString(1);

		ls_sql="update jc_zczjxmx ";
		ls_sql+=" set zjcbje=jc_zczjxmx.zjsl*(select jc_zcddmx.cbj from jc_zcddmx where jc_zcddmx.xh=jc_zczjxmx.xh)";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���������jc_zczjx��:�������ܶ�
		double zjxcbze=0;
		ls_sql="select sum(zjcbje) ";
		ls_sql+=" from jc_zczjxmx ";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxcbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_zczjx set zjxcbze="+zjxcbze;
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="update jc_jcdd set cbje="+zjxcbze;
		ls_sql+=" where  gjz='"+getzjxbh+"' and lx='4' and czlx='2'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	    //�����������������������������������

	ls_sql =" select ddbh";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getddbh=cf.fillNull(rs1.getString("ddbh"));


		double zjxcbze=0;
		ls_sql="select sum(zjxcbze)";
		ls_sql+=" from jc_zczjx ";
		ls_sql+=" where ddbh='"+getddbh+"' and clzt!='00'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjxcbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double cbze=0;
		ls_sql =" select sum(cbj*sl)";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+getddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();


		ls_sql="update jc_zcdd set  cbze="+cbze+",zjxcbze="+zjxcbze;
		ls_sql+=" where  ddbh='"+getddbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="update jc_jcdd set cbje="+cbze;
		ls_sql+=" where  gjz='"+getddbh+"' and lx='4' and czlx='1'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	ls_sql =" SELECT jc_zcddmx.jsfs,jc_zcddmx.jsbl,jc_zcddmx.dj,jc_zcddmx.cbj,jc_zcddmx.ddbh,jc_zcddmx.xh ";
	ls_sql+=" FROM jc_zcddmx,jc_zczjxmx";
	ls_sql+=" where jc_zcddmx.ddbh=jc_zczjxmx.ddbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jsfs=cf.fillNull(rs.getString("jsfs"));
		jsbl=rs.getDouble("jsbl");
		dj=rs.getDouble("dj");
		cbj=rs.getDouble("cbj");
		getddbh=cf.fillNull(rs.getString("ddbh"));
		xh=cf.fillNull(rs.getString("xh"));

		if (jsfs.equals("2"))//1������ۣ�2���������
		{
			cbj=cf.round(dj*jsbl/100,2);

			ls_sql="update jc_zcddmx set cbj="+cbj;
			ls_sql+=" where ddbh='"+getddbh+"' and xh='"+xh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (jsfs.equals(""))
		{
			if (cbj==0 && jsbl!=0)
			{
				cbj=cf.round(dj*jsbl/100,2);

				ls_sql="update jc_zcddmx set cbj="+cbj;
				ls_sql+=" where ddbh='"+getddbh+"' and xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();
	
	     //���������������������������������ʼ
	ls_sql="select zjxbh";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getzjxbh=rs1.getString(1);

		ls_sql="update jc_zczjxmx ";
		ls_sql+=" set zjcbje=jc_zczjxmx.zjsl*(select jc_zcddmx.cbj from jc_zcddmx where jc_zcddmx.xh=jc_zczjxmx.xh)";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���������jc_zczjx��:�������ܶ�
		double zjxcbze=0;
		ls_sql="select sum(zjcbje) ";
		ls_sql+=" from jc_zczjxmx ";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxcbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_zczjx set zjxcbze="+zjxcbze;
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="update jc_jcdd set cbje="+zjxcbze;
		ls_sql+=" where  gjz='"+getzjxbh+"' and lx='4' and czlx='2'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	    //�����������������������������������

	ls_sql =" select distinct ddbh";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getddbh=cf.fillNull(rs1.getString("ddbh"));


		double zjxcbze=0;
		ls_sql="select sum(zjxcbze)";
		ls_sql+=" from jc_zczjx ";
		ls_sql+=" where ddbh='"+getddbh+"' and clzt!='00'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjxcbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double cbze=0;
		ls_sql =" select sum(cbj*sl)";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+getddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbze=rs.getDouble(1);
		}
		rs.close();
		ps.close();


		ls_sql="update jc_zcdd set  cbze="+cbze+",zjxcbze="+zjxcbze;
		ls_sql+=" where  ddbh='"+getddbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="update jc_jcdd set cbje="+cbze;
		ls_sql+=" where  gjz='"+getddbh+"' and lx='4' and czlx='1'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	//����������������������������������������
	
	ls_sql =" select sum(cbze),sum(ycf),sum(qtf),sum(qtycf)";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj=rs1.getDouble(1);
		ycfzj=rs1.getDouble(2);
		qtfzj=rs1.getDouble(3);
		qtycf=rs1.getDouble(4);
	}
	rs1.close();
	ps1.close();

	ls_sql =" select sum(zjxcbze),sum(zjxycf),sum(zjxqtf)";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj+=rs1.getDouble(1);//������ɱ��ܶ�
		ycfzj+=rs1.getDouble(2);//����Զ�̷�
		qtfzj+=rs1.getDouble(3);//����������
	}
	rs1.close();
	ps1.close();

	cbzj=cf.round(cbzj,2);
	ycfzj=cf.round(ycfzj,2);
	qtfzj=cf.round(qtfzj,2);

	int wshsl=0;
	String sxhtsfysh="";
	for (int i=0;i<ddbh.length ;i++ )
	{
		if (ddbh[i].length()==9)
		{
			ls_sql =" select sxhtsfysh";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sxhtsfysh=cf.fillNull(rs1.getString(1));

				if (sxhtsfysh.equals("N"))
				{
					wshsl++;
					out.println("<P>���󣡡���������д��ͬδ��ˣ����ܽ���:"+ddbh[i]);
				}
			}
			rs1.close();
			ps1.close();
		}
		else{
			ls_sql =" select sxhtsfysh";
			ls_sql+=" from jc_zczjx";
			ls_sql+=" where zjxbh='"+ddbh[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sxhtsfysh=cf.fillNull(rs1.getString(1));

				if (sxhtsfysh.equals("N"))
				{
					wshsl++;
					out.println("<P>���󣡡��������д��ͬδ��ˣ����ܽ���:"+ddbh[i]);
				}
			}
			rs1.close();
			ps1.close();
		}
	}

	if (wshsl>0)
	{
		return;
	}

	 //�������:����������ϸ���Ƿ�һ��
	String zddbh="";
	double ddcbje=0;
	double ddycf=0;//Զ�̷�=������ϸԶ�̷ѣ�����Զ�̷�
	double ddqtycf=0;//����Զ�̷ѣ��ײ��Զ��ֽ�Զ�̷�
	double ddqtf=0;
	ls_sql =" select ddbh,cbze,ycf,qtf,qtycf";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"ddbh");
	ls_sql+=" order by ddbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		zddbh=rs1.getString(1);
		ddcbje=rs1.getDouble(2);
		ddycf=rs1.getDouble(3);
		ddqtf=rs1.getDouble(4);
		ddqtycf=rs1.getDouble(5);

		ddycf=ddycf-ddqtycf;

		double mxcbje=0;
		double mxycf=0;
		double mxqtf=0;
		
	
		ls_sql=" SELECT sum(ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2)) je,sum(ROUND(NVL(jc_zcddmx.ycf,0),2)) ycf,sum(ROUND(NVL(jc_zcddmx.qtfyje,0),2)) qtfy";
		ls_sql+=" FROM jc_zcddmx";
		ls_sql+=" where ddbh='"+zddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mxcbje=rs.getDouble(1);
			mxycf=rs.getDouble(2);
			mxqtf=rs.getDouble(3);
		}
		rs.close();
		ps.close();

		if ((int)ddcbje!=(int)mxcbje)
		{
			out.println("<BR>���󣡶�����"+zddbh+"�����ϳɱ����󣡣�������"+ddcbje+",��ϸ��"+mxcbje);
			return;
		}
		
		if ((int)ddycf!=(int)mxycf)
		{
			out.println("<BR>���󣡶�����"+zddbh+"��Զ�̷Ѵ��󣡣�������"+ddycf+",��ϸ��"+mxycf);
			return;
		} 

		if ((int)ddqtf!=(int)mxqtf)
		{
			out.println("<BR>���󣡶�����"+zddbh+"�������Ѵ��󣡣�������"+ddqtf+",��ϸ��"+mxqtf);
			return;
		} 
		
		String zjxbhWwj=null;
		ls_sql =" select zjxbh";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where ddbh='"+zddbh+"' and clzt not in('30','00','03','99')";
		ls_sql+=" order by zjxbh";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zjxbhWwj=rs.getString(1);

			out.println("<P>���ѣ�������"+zddbh+"���������<A HREF='/jcjj/zccl/zjx/ViewJeJc_zczjx.jsp?zjxbh="+zjxbhWwj+"' target='_blank'>"+zjxbhWwj+"</A>��δ�ͻ����˲��ֽ����ܽ���");
		}
		rs.close();
		ps.close();

		ls_sql =" select zjxbh";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where ddbh='"+zddbh+"' and clzt='03'";
		ls_sql+=" order by zjxbh";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zjxbhWwj=rs.getString(1);

			out.println("<P>���ѣ�������"+zddbh+"���������<A HREF='/jcjj/zccl/zjx/ViewJeJc_zczjx.jsp?zjxbh="+zjxbhWwj+"' target='_blank'>"+zjxbhWwj+"</A>�����ͻ�δ��ᣬ�˲��ֽ����ܽ��㣬�Ƿ��������");
		}
		rs.close();
		ps.close();

	
	}
	rs1.close();
	ps1.close();

	 //�������:������������ϸ���Ƿ�һ��
	double getzjxcbje=0;
	double getzjxycf=0;//Զ�̷�=������ϸԶ�̷ѣ�����Զ�̷�
	double getzjxqtf=0;
	ls_sql =" select zjxbh,zjxcbze,zjxycf,zjxqtf";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where "+cf.arrayToInSQL(ddbh,"zjxbh");
	ls_sql+=" order by zjxbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getzjxbh=rs1.getString(1);
		getzjxcbje=rs1.getDouble(2);
		getzjxycf=rs1.getDouble(3);
		getzjxqtf=rs1.getDouble(4);


		double mxcbje=0;
		double mxycf=0;
		double mxqtf=0;
		
		
		ls_sql="select sum(zjcbje),sum(zjycf),sum(zjqtfy) ";
		ls_sql+=" from jc_zczjxmx ";
		ls_sql+=" where zjxbh='"+getzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mxcbje=rs.getDouble(1);
			mxycf=rs.getDouble(2);
			mxqtf=rs.getDouble(3);
		}
		rs.close();
		ps.close();

		if ((int)getzjxcbje!=(int)mxcbje)
		{
			out.println("<BR>���������"+getzjxbh+"�����ϳɱ����󣡣�������"+getzjxcbje+",��ϸ��"+mxcbje);
			return;
		}
		
		if ((int)getzjxycf!=(int)mxycf)
		{
			out.println("<BR>���������"+getzjxbh+"��Զ�̷Ѵ��󣡣�������"+getzjxycf+",��ϸ��"+mxycf);
			return;
		} 

		if ((int)getzjxqtf!=(int)mxqtf)
		{
			out.println("<BR>���������"+getzjxbh+"�������Ѵ��󣡣�������"+getzjxqtf+",��ϸ��"+mxqtf);
			return;
		} 
		
	}
	rs1.close();
	ps1.close();
%>


<CENTER >
  <B><font size="3">�����ڴ�װ�ι��̣����������޹�˾&nbsp;���Ĳ�Ʒ�̻����㵥</font></B>
</CENTER>

<form method="post" action="" name="editform" >
<div align="center">���̽��㣨��Ӧ�̣�<%=gys%>��Ʒ�ƣ�<%=ppbm%>��</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������˾</font></td>
      <td bgcolor="#FFFFFF">
		
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select></td>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font><font color="#0000CC">������</font> </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font>����ʱ�� </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">���ϳɱ�</font></td>
      <td><input type="text" name="cbzj" value="<%=cbzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td><input type="text" name="qtfzj" value="<%=qtfzj%>" size="20" maxlength="20" readonly/></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">Զ�̷�</font></td>
      <td colspan="3"><input type="text" name="ycfzj" value="<%=ycfzj%>" size="20" maxlength="20" readonly/>
        <font color="#990000" size="2"><strong>Զ�̷ѣ��ײͷֽ�Զ�̷ѣ�<%=qtycf%>����������ϸԶ�̷�(<%=cf.round(ycfzj-qtycf,2)%>)</strong></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�۳�����</td>
      <td><input type="text" name="kcfy" value="0" size="20" maxlength="20" onChange="f_jsjg(editform)"/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td><input type="text" name="jsje" value="<%=cf.round(cbzj+ycfzj+qtfzj,2)%>" size="20" maxlength="20" readonly/></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">����˵��</td>
      <td colspan="3"><textarea name="jssm" cols="71" rows="3"></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center">
<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
          <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
		<%
	}
%>
			<input type="hidden" name="gys"  value="<%=gys%>" >          
			<input type="hidden" name="ppbm"  value="<%=ppbm%>" >          
			<input type="button"  value="����" onClick="f_do(editform)" name="button">
            <input type="button"  value="����ѡ���־" onclick="f_szbz(editform)" name="button2" />
            <input type="reset"  value="����" name="reset"></td>
    </tr>
  </table>
</form>

<table border="1" width="113%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="4%">�ͻ�����</td>
    <td  width="12%">��ַ</td>
    <td  width="7%">������</td>
    <td  width="6%">����ʱ��</td>
    <td  width="6%">���ʱ��</td>
    <td  width="10%">��������</td>
    <td  width="8%">���</td>
    <td  width="8%">�ͺ�</td>
    <td  width="4%">��λ</td>
    <td  width="5%">��������</td>
    <td  width="5%">����</td>
    <td  width="7%">�����ܼ�</td>
    <td  width="5%">Զ��������</td>
    <td  width="13%">��ע</td>
  </tr>
  <%

	String khbh=null;
	String khxm=null;
	int row=0;
	double zjsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;

    ls_sql=" select * ";
    ls_sql+=" FROM ( ";
	ls_sql+=" select distinct jc_zcdd.khbh,khxm";
	ls_sql+=" from jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh" ;
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");

    ls_sql+=" UNION ";

	ls_sql+=" select distinct jc_zczjx.khbh,khxm";
	ls_sql+=" from jc_zczjx,crm_khxx";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh" ;
	ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zczjx.zjxbh");

    ls_sql+=" ) ";
    ls_sql+=" order by khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		khxm=cf.fillNull(rs1.getString("khxm"));

		ls_sql =" select sum(qtycf)";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtycf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		String qtycfStr="&nbsp;";
		if (qtycf!=0)
		{
			qtycfStr="(<font color=\"#990000\">�ײͷֽ�Զ�̷�:"+qtycf+"</font>)";
		}

		
		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1����ͬ�2������
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zcdd,jc_zczjx,jc_zczjxmx,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.ddbh=jc_zczjxmx.ddbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zczjx.zjxbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zczjxmx.zjxbh=jc_zczjx.zjxbh ";

		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String dwbh=null;
		String fwdz=null;
		String lx=null;
		String zcpzwzbm=null;
		String zcmc=null;
		String gg=null;
		String xinghao=null;
		String jldwbm=null;
		double sl=0;
//		double cbj=0;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;
		String qhtsj=null;
		String sshsj=null;
		String wjsj=null;
//		String getddbh=null;


		ls_sql=" SELECT dwbh,ddbh,qhtsj,sshsj,wjsj,khxm,fwdz,zcmc,gg,xinghao,jldwbm,sl,cbj,je,ycf,qtfy,cxhdbl,cxhdje,bz";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT jc_zcdd.ddbh,jc_zcdd.qhtsj,jc_zcdd.sshsj,jc_zcdd.wjsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zcddmx.sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zcddmx.sl,0),2) je,NVL(jc_zcddmx.ycf,0) ycf,NVL(jc_zcddmx.qtfyje,0) qtfy,cxhdbl||'%' cxhdbl,NVL(jc_zcddmx.cxhdje,0) cxhdje,jc_zcddmx.bz";
		ls_sql+=" FROM jc_zcddmx,jc_zcdd,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" AND jc_zcddmx.lx='1' ";//1����ͬ�2������
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zcdd.ddbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,jc_zczjx.zjxfssj qhtsj,jc_zczjx.sshsj,jc_zczjx.wjsj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcddmx.zcmc,jc_zcddmx.dwbh,jc_zcddmx.gg,jc_zcddmx.xinghao,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl sl,jc_zcddmx.cbj,ROUND(NVL(jc_zcddmx.cbj*jc_zczjxmx.zjsl,0),2) je,NVL(jc_zczjxmx.zjycf,0) ycf,NVL(jc_zczjxmx.zjqtfy,0) qtfy,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjcxhdje cxhdje,jc_zcddmx.bz";

		ls_sql+=" FROM jc_zcddmx,jc_zcdd,jc_zczjx,jc_zczjxmx,crm_khxx";
		ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.ddbh=jc_zczjxmx.ddbh and jc_zcddmx.xh=jc_zczjxmx.xh" ;
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh" ;
		ls_sql+=" and "+cf.arrayToInSQL(ddbh,"jc_zczjx.zjxbh");
		ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";

		ls_sql+=" and jc_zczjxmx.zjxbh=jc_zczjx.zjxbh ";

		ls_sql+=" ) ";

		ls_sql+=" order by ddbh,dwbh,xinghao";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dwbh=cf.fillHtml(rs.getString("dwbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
			sshsj=cf.fillHtml(rs.getDate("sshsj"));
			wjsj=cf.fillHtml(rs.getDate("wjsj"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));


			xjsl+=sl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;


			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td rowspan="<%=count%>"><%=khxm%></td>
				<td  rowspan="<%=count%>"><%=fwdz%></td>
				<td><A HREF="ViewDdmx.jsp?ddbh=<%=getddbh%>" target="_blank"><%=getddbh%></A></td>
				<td><%=qhtsj%></td>
				<td><%=wjsj%></td>
				<td><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cf.round(ycf+qtfy,2)%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}

		while (rs.next())//��ʾͬһ�ͻ����¶���
		{
			dwbh=cf.fillHtml(rs.getString("dwbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			qhtsj=cf.fillHtml(rs.getDate("qhtsj"));
			sshsj=cf.fillHtml(rs.getDate("sshsj"));
			wjsj=cf.fillHtml(rs.getDate("wjsj"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			zcmc=cf.fillHtml(rs.getString("zcmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xinghao=cf.fillHtml(rs.getString("xinghao"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sl=rs.getDouble("sl");
			cbj=rs.getDouble("cbj");
			je=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfy=rs.getDouble("qtfy");
			cxhdbl=cf.fillHtml(rs.getString("cxhdbl"));
			cxhdje=rs.getDouble("cxhdje");
			bz=cf.fillHtml(rs.getString("bz"));

			xjsl+=sl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td><A HREF="ViewDdmx.jsp?ddbh=<%=getddbh%>" target="_blank"><%=getddbh%></A></td>
				<td ><%=qhtsj%></td>
				<td ><%=wjsj%></td>
				<td ><%=zcmc%></td>
				<td ><%=gg%></td>
				<td ><%=xinghao%></td>
				<td ><%=jldwbm%></td>
				<td ><%=sl%></td>
				<td ><%=cbj%></td>
				<td ><%=je%></td>
				<td ><%=cf.round(ycf+qtfy,2)%></td>
				<td ><%=bz%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();
		

		zjsl+=xjsl;
		zjje+=xjje;
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;

		zjsl=cf.round(zjsl,2);
		zjje=cf.round(zjje,2);
		zjycf=cf.round(zjycf,2);
		zjqtfy=cf.round(zjqtfy,2);
		zjcxhdje=cf.round(zjcxhdje,2);
		
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="9"><font size="2"><b>[<%=khxm%>]С��<%=qtycfStr%></b></font></td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjje)%></td>
			<td ><%=cf.round(xjycf+xjqtfy,2)%></td>
			<td>&nbsp;</td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	
	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="8"><font size="3"><b>�ܼ�</b></font></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjsl)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
		<td ><%=cf.round(zjycf+zjqtfy,2)%></td>
		<td>&nbsp;</td>
	  </tr>
	  <%

	if ((int)cbzj!=(int)zjje)
	{
		out.println("<B><font color=\"#FF0000\">������ϸ["+zjje+"]����ܽ��["+cbzj+"]��һ��</B></font>");
		return;
	}

}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>


</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//����FormName:Form������
{
	var jsje=<%=cf.round(cbzj+ycfzj+qtfzj,2)%>-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;

}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("��ѡ��[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kcfy)=="") {
		alert("��ѡ��[�۳�����]��");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "�۳�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("��ѡ��[������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "������"))) {
		return false;
	}

	FormName.action="SaveInsertJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_szbz(FormName)//����FormName:Form������
{
	FormName.action="chooseJs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
