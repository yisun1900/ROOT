<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String ls_sql1=null;


String fkxh=null;
java.sql.Date fsrq=null;
String qyrq=null;
String bm=null;
String hth=null;
String kh=null;
String ygbh=null;
String zy=null;
String kq=null;
String bz=null;
double jf=0;
double df=0;

int count=0;
int start=20705;
int pos=0;

String khbh=null;
String ls=null;

try {

	//�õ�ORACLE����
	conn=cf.getConnection();    
	
	conn.setAutoCommit(false);

	//�м�����
	ls_sql1 ="select fkxh,fsrq,bm,kh,zy,bz,jf,df  ";
	ls_sql1+=" from imp_khfkjl  ";
	ls_sql1+=" order by fkxh";
//	out.println(ls_sql1);
	ps1= conn.prepareStatement(ls_sql1);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		count++;

		fkxh=rs1.getString("fkxh");
		fsrq=rs1.getDate("fsrq");
		bm=rs1.getString("bm");
		kh=rs1.getString("kh");
		zy=cf.fillNull(rs1.getString("zy"));
		bz=cf.fillNull(rs1.getString("bz"));
		jf=rs1.getDouble("jf");
		df=rs1.getDouble("df");

//		out.println("<BR>fkxh="+fkxh+";bz="+bz);


		try{
			pos=bm.indexOf("-");
			qyrq=bm.substring(0,pos);
			bm=bm.substring(pos+1);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[����]����ת����������:"+bm);
			return;
		}

		try{
			pos=kh.lastIndexOf("-");
			hth=kh.substring(0,pos);
			kh=kh.substring(pos+1);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[�ͻ�]����ת����������:"+kh);
			return;
		}

		try{
			if (zy==null || zy.equals(""))
			{
				ygbh=null;
				zy=null;
			}
			else{
				pos=zy.indexOf("-");
				ygbh=zy.substring(0,pos);
				zy=zy.substring(pos+1);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[ְԱ]����ת����������:"+zy);
			return;
		}

		if (bz.indexOf("����")>-1)
		{
			kq="����";
		}
		else if (bz.indexOf("�˶���")>-1)
		{
			kq="�˶���";
		}
		else if (bz.indexOf("һ�ڿ�")>-1)
		{
			kq="һ�ڿ�";
		}
		else if (bz.indexOf("���ڿ�")>-1)
		{
			kq="һ�ڿ�";
		}
		else if (bz.indexOf("���ڿ�")>-1)
		{
			kq="���ڿ�";
		}
		else if (bz.indexOf("���ڿ�")>-1)
		{
			kq="���ڿ�";
		}
		else if (bz.indexOf("β��")>-1)
		{
			kq="β��";
		}
		else if (bz.indexOf("�����")>-1)
		{
			kq="�����";
		}
		else if (bz.indexOf("��Ԥ����")>-1)
		{
			kq="��Ԥ����";
		}
		else if (bz.indexOf("����Ԥ����")>-1)
		{
			kq="����Ԥ����";
		}
		else if (bz.indexOf("���̿���Ͽ�")>-1)
		{
			kq="���̿���Ͽ�";
		}
		else if (bz.indexOf("���̿�")>-1)
		{
			kq="���̿�";
		}
		else if (bz.indexOf("����")>-1)
		{
			kq="����";
		}
		else if (bz.indexOf("���������")>-1)
		{
			kq="���������";
		}
		else if (bz.indexOf("�˹��̿�")>-1)
		{
			kq="�˹��̿�";
		}
		else if (bz.indexOf("�˿�")>-1)
		{
			kq="�˿�";
		}
		else if (bz.indexOf("�����˵���һ�ڿ�")>-1)
		{
			kq="�����˵���һ�ڿ�";
		}
		else
		{
			out.println("<BR>[��ע]:"+bz);
			kq="";
		}



		ls_sql="insert into imp_khfkjl1 (fkxh,fsrq,qyrq,bm,hth,kh,ygbh,zy,kq,bz,jf,df) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,fkxh);
		ps.setDate(2,fsrq);
		ps.setString(3,qyrq);
		ps.setString(4,bm);
		ps.setString(5,hth);
		ps.setString(6,kh);
		ps.setString(7,ygbh);
		ps.setString(8,zy);
		ps.setString(9,kq);
		ps.setString(10,bz);
		ps.setDouble(11,jf);
		ps.setDouble(12,df);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	
	conn.commit();

	out.print("<BR>���ݵ���ɹ����������¼����"+count);
}
catch (Exception e) {
	conn.rollback();
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
