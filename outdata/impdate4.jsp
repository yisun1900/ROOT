<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
Connection conn=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
ResultSet rs=null;
ResultSet rs2=null;
String ls_sql=null;
String sql=null;
//get����cUserID��cPassword
String n0=null;
String n10=null;
String n11=null;
String n12=null;
String n13=null;
String n14=null;

String n3=null;
String dwbh=null;
String n7=null;
String sgd=null;
String n8=null;
String sgbz=null;
String khbh=null;
String pdclzt="1";//1�����ɵ���2�ɵ���3�ܾ��ɵ���4�����ɵ���5������ԭ��
String hdbz="1";//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص�

double qye=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date jgrq=null;
java.sql.Date sjjgrq=null;

//��ѯ�û���½��Ϣ

try {
	conn=cf.getConnection();   //�õ�����

	sql="select n0,n14,'2004-'||substr(N10,1,2)||'-'||substr(N10,3,2) n10";
	sql+=" ,'2004-'||substr(N11,1,2)||'-'||substr(N11,3,2) n11 ";
	sql+=" ,'2004-'||substr(N12,1,2)||'-'||substr(N12,3,2) n12 ";
	sql+=" ,'2004-'||substr(N13,1,2)||'-'||substr(N13,3,2) n13 ";
	sql+=" ,n3,n7,n8";
	sql+=" from KHXX041";
	sql+=" order by n0";
//	out.println("<BR>sql="+sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())//�û�����
	{
		n0=rs.getString("n0");
		n10=rs.getString("n10");
		n11=rs.getString("n11");
		n12=rs.getString("n12");
		n13=rs.getString("n13");
		n14=rs.getString("n14");

		n3=rs.getString("n3");
		n7=rs.getString("n7");
		n8=rs.getString("n8");

		khbh=cf.addZero(n0,7);

		hdbz="1";

		pdclzt="1";
		if (n3!=null)
		{
			pdclzt="4";

			sql="select dwbh";
			sql+=" from sq_dwxx";
			sql+=" where dwjc='"+n3+"' ";
	//		out.println("<BR>sql="+sql);
			ps2=conn.prepareStatement(sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//�û�����
			{
				dwbh=rs2.getString("dwbh");
			}
			else{
				out.println("<BR>n0="+n0+";  n3="+n3);
				dwbh=null;
			}
			rs2.close();
			ps2.close();

		}

		if (n7!=null)
		{
			sql="select dwbh";
			sql+=" from sq_dwxx";
			sql+=" where dwmc='"+n7+"' ";
	//		out.println("<BR>sql="+sql);
			ps2=conn.prepareStatement(sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//�û�����
			{
				sgd=rs2.getString("dwbh");
			}
			else{
				out.println("<BR>n0="+n0+";  n7="+n7);
				sgd=null;
			}
			rs2.close();
			ps2.close();
		}

		if (n8!=null)
		{
			sql="select dwbh";
			sql+=" from sq_dwxx";
			sql+=" where dwmc='"+n8+"' ";
	//		out.println("<BR>sql="+sql);
			ps2=conn.prepareStatement(sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//�û�����
			{
				sgbz=rs2.getString("dwbh");
			}
			else{
				out.println("<BR>n0="+n0+";  ����="+n8);
				sgbz=null;
			}
			rs2.close();
			ps2.close();
		}

		if (n14!=null && !n14.equals(""))
		{
			qye=Double.parseDouble(n14);
		}
		else{
			qye=0;
		}

		if (!n10.equals("2004--")&&!n10.equals("2004-����-") )
		{
			qyrq=java.sql.Date.valueOf(n10);
		}
		if (!n11.equals("2004--")&&!n11.equals("2004-����-"))
		{
			kgrq=java.sql.Date.valueOf(n11);
		}
		if (!n12.equals("2004--")&&!n12.equals("2004-����-"))
		{
			jgrq=java.sql.Date.valueOf(n12);
		}
		if (!n13.equals("2004--")&&!n13.equals("2004-����-"))
		{
			sjjgrq=java.sql.Date.valueOf(n13);
		}
/*
*/
		//�ͻ����
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
		ls_sql+=" from  crm_khxx";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			xh=rs2.getInt(1);
		}
		ps2.close();
		rs2.close();
		khbh=cf.addZero(xh,7);

		ls_sql="update  KHXX041 set qyrq=?,kgrq=?,jgrq=?,sjjgrq=?,dwbh=?,sgd=?,sgbz=?,khbh=?";
		ls_sql+=" where  n0='"+n0+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,qyrq);
		ps1.setDate(2,kgrq);
		ps1.setDate(3,jgrq);
		ps1.setDate(4,sjjgrq);
		ps1.setString(5,dwbh);
		ps1.setString(6,sgd);
		ps1.setString(7,sgbz);
		ps1.setString(8,khbh);
		ps1.executeUpdate();
		ps1.close();

		
		ls_sql="insert into crm_khxx(hdbz,pdclzt,khbh,khxm,sjs,zjxm,qye,qyrq,kgrq,jgrq,sjjgrq,lxfs,fwdz,bz,gcjdbm,wgbz,ybjbz,zt,khlxbm,tsbz,tkbz,lrr,lrsj,dwbh,sgd,sgbz)";
		ls_sql+=" select '"+hdbz+"','"+pdclzt+"','"+khbh+"',N5,N6,N9,N14,qyrq,kgrq,jgrq,sjjgrq,N16,N17,N18,'4','Y','N','2','04','N','N','crm',trim(sysdate),dwbh,sgd,sgbz";
		ls_sql+=" from KHXX041";
		ls_sql+=" where  n0='"+n0+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

	}
	
	out.println("<BR>�������ݳɹ���");
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.println("<BR>n0="+n0+";  n14="+n14+"; n10="+n10+"; n11="+n11+"; n12="+n12+"; n13="+n13);
	out.println("<BR>ls_sql="+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%>

