<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>������ϳ��ⵥ </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;


String khbh =null;
String ckdh =null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql1=null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	khbh = up.getParameter("khbh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\foxpro\\IMP_"+yhdlm+".DBF";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();
%>


<%
	String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
	String url = "jdbc:odbc:foxpro";
	String user = "";
	String passwd = "";

	conn1=cf.getConnection();    //�õ�����
	
	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);
	
	String col_1 =null;
	String col_2 =null;
	String col_4 =null;

	String jldwbm=null;
	String col_9=null;
	java.sql.Date order_date=null;
	String col_12=null;
	String col_18=null;
	String col_19=null;
	String note=null;


	String sgd=null;
	String fgsbh=null;
	ls_sql="select sgd,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps1= conn1.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		sgd=rs1.getString("sgd");
		fgsbh=rs1.getString("fgsbh");
	}
	rs1.close();
	ps1.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps1= conn1.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		dqbm=rs1.getString(1);
	}
	rs1.close();
	ps1.close();

	conn1.setAutoCommit(false);

	java.sql.Date cksj=null;
	String hth=null;

	int row=0;
	//col_2:��������;col_4:�������ϱ���;col_8������������λ��col_9��������col_12�����ⵥ�ţ�col_18�����ۣ�col_19����
	ls_sql = "select col_1,col_2,col_4,col_8,col_9,col_12,col_18,col_19";
	ls_sql+= " from IMP_"+yhdlm;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{
		row++;

		col_1=cf.fillNull(rs.getString("col_1"));//�к�
		col_2=cf.fillNull(rs.getString("col_2"));//�������ڡ���ͬ��
		col_4=cf.fillNull(rs.getString("col_4"));//�������ϱ���
		jldwbm=cf.fillNull(rs.getString("col_8"));//����������λ
		col_9=cf.fillNull(rs.getString("col_9"));//����
		col_12=cf.fillNull(rs.getString("col_12"));//���ⵥ��
		col_18=cf.fillNull(rs.getString("col_18"));//����
		col_19=cf.fillNull(rs.getString("col_19"));//���


		if (row==4)
		{
			ckdh=col_12;
		}

		if (row==5)
		{
			hth=col_2;

			String gethth="";
			ls_sql = "select hth";
			ls_sql+= " from crm_khxx";
			ls_sql+= " where khbh='"+khbh+"'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				gethth=cf.fillNull(rs1.getString("hth"));
			}
			rs1.close();
			ps1.close();

			if (!gethth.equals(hth))
			{
				conn1.rollback();
				out.println("<BR>����<BR>������λΪ["+hth+"]����ERP��ͬ��["+gethth+"]����");
				return;
			}
		}
		if (row==6)
		{
			cksj=java.sql.Date.valueOf(col_2.trim());
			break;
		}
	}

	//���룺���ϳ�����ϸ��bj_clckmx��
	//���ݴӵ�9�п�ʼ

	row++;
	rs.next();
	row++;
	rs.next();
	while(rs.next())
	{
		row++;

		col_1=cf.fillNull(rs.getString("col_1"));//�к�
		col_2=cf.fillNull(rs.getString("col_2"));//�������ڡ���ͬ��
		col_4=cf.fillNull(rs.getString("col_4"));//�������ϱ���
		jldwbm=cf.fillNull(rs.getString("col_8"));//����������λ
		col_9=cf.fillNull(rs.getString("col_9"));//����
		col_18=cf.fillNull(rs.getString("col_18"));//����
		col_19=cf.fillNull(rs.getString("col_19"));//���

		if (col_1.equals(""))//�к�Ϊ�գ���ʾ�ǻ����У�����
		{
			break;
		}
        
		if (!col_4.equals(""))
		{
			double sl=java.lang.Double.parseDouble(col_9.trim());
			double dj=java.lang.Double.parseDouble(col_18.trim());

			String getjldwbm=null;
			double getdj=0;
			ls_sql = "select jldwbm,dj";
			ls_sql+= " from bj_jzcljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+col_4+"'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				getjldwbm=cf.fillNull(rs1.getString("jldwbm"));
				getdj=rs1.getDouble("dj");
			}
			else{
				conn1.rollback();
				out.println("<BR>����ʧ�ܣ��������ϱ���["+col_4+"]��ERP�в�����");
				return;
			}
			rs1.close();
			ps1.close();

			if (jldwbm.equals(getjldwbm))
			{
				conn1.rollback();
				out.println("<BR>����<BR>���ϱ���["+col_4+"]�ļ�����λ["+jldwbm+"]����ERPϵͳ["+getjldwbm+"]����");
				return;
			}

			if (dj!=getdj)
			{
				conn1.rollback();
				out.println("<BR>����<BR>���ϱ���["+col_4+"]�ĵ���["+dj+"]����ERPϵͳ["+getdj+"]����");
				return;
			}

			ls_sql="insert into bj_clckmx (ckdh,wlbm,jswlbm,dqbm,cldlbm,glmc,pp,xhgg,jldwbm,jsjldwbm,wljsbz,dj,sl,je)";
			ls_sql+=" select '"+ckdh+"',wlbm,jswlbm,dqbm,cldlbm,glmc,pp,xhgg,jldwbm,jsjldwbm,wljsbz,'"+dj+"','"+sl+"',"+dj+"*"+sl;
			ls_sql+=" from bj_jzcljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+col_4+"'";
			
			ps1= conn1.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
	}
	rs.close();
	ps.close();

	double ckzsl=0;
	double ckzje=0;

	ls_sql="select sum(sl),sum(je)";
	ls_sql+=" from  bj_clckmx";
	ls_sql+=" where ckdh='"+ckdh+"'  ";
	ps1= conn1.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ckzsl=rs1.getDouble(1);
		ckzje=rs1.getDouble(2);
	}
	rs1.close();
	ps1.close();

	//���룺���ϳ��ⵥ��bj_clckd��
	ls_sql="insert into bj_clckd ( ckdh,khbh,ckzsl,ckzje,clzt,ckr,cksj,lrr,lrsj,bz,sgd,dqbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,SYSDATE,?,?,? ) ";
	ps1= conn1.prepareStatement(ls_sql);
	ps1.setString(1,ckdh);
	ps1.setString(2,khbh);
	ps1.setDouble(3,ckzsl);
	ps1.setDouble(4,ckzje);
	ps1.setString(5,"1");
	ps1.setString(6,"����");
	ps1.setDate(7,cksj);
	ps1.setString(8,yhmc);
	ps1.setString(9,"");
	ps1.setString(10,sgd);
	ps1.setString(11,dqbm);
	ps1.executeUpdate();
	ps1.close();
	
	
	conn1.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�������ݳɹ������ɳ��ⵥ��<<%=ckdh%>>");
	window.close();    //2007-07-20 ȡ���������ݳɹ���ϵͳ�Զ��رմ���
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn1.rollback();
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	conn1.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //�ͷ�����

		f.close();
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 

</body>
</html>

