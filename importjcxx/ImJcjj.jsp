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

String zcmc=null;
String zcdlbm=null;
String zcdlmc=null;
String ppbm=null;
String ppmc=null;
String zclbbm=null;
String xh=null;
String gg=null;
String zcysbm=null;
String jldwbm=null;
String jldwmc=null;
String lsjstr=null;
double lsj=0;
String yhjstr=null;
double yhj=0;
int pjts=0;

String sfbhpj=null;
String pjjgstr=null;
double pjjg=0;
String dwbh=null;
String dwmc=null;
String bz=null;

int count=0;
int start=0;
int pos=0;

String zcbm=null;
String ls=null;
	String zcbm1=null;

try {
	//�õ�ORACLE����
	conn=cf.getConnection();    

	ls_sql="select NVL(max(TO_NUMBER(zcbm)),0)";
	ls_sql+=" from  jc_zcjgb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		start=rs.getInt(1);
	}
	ps.close();
	rs.close();
	

	conn.setAutoCommit(false);

	//�м�����
	ls_sql1 ="select zcbm,zcmc,zcdlbm,ppbm,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,sfbhpj,pjjg,dwbh,bz ";
	ls_sql1+=" from imp_zcjgb ";
	ls_sql1+=" order by zcbm";
//	out.println(ls_sql1);
	ps1= conn.prepareStatement(ls_sql1);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		count++;

		zcbm1=rs1.getString("zcbm");
		zcmc=rs1.getString("zcmc");
		zcdlmc=rs1.getString("zcdlbm");
		ppmc=cf.fillNull(rs1.getString("ppbm"));
		zclbbm=rs1.getString("zclbbm");
		xh=rs1.getString("xh");
		gg=rs1.getString("gg");
		zcysbm=rs1.getString("zcysbm");
		jldwmc=rs1.getString("jldwbm");
		lsjstr=cf.fillNull(rs1.getString("lsj"));
		yhjstr=cf.fillNull(rs1.getString("yhj"));

		sfbhpj=cf.fillNull(rs1.getString("sfbhpj"));
		pjjgstr=cf.fillNull(rs1.getString("pjjg"));
		dwmc=cf.fillNull(rs1.getString("dwbh"));
		bz=cf.fillNull(rs1.getString("bz"));


		if (!sfbhpj.equals(""))
		{
			pjts=1;
			sfbhpj="Y";
		}
		else{
			pjts=0;
			sfbhpj="N";
		}



//		out.println("<BR>zcmc="+zcmc+";xh="+xh);


		zcdlbm=null;
		ppbm=null;
		jldwbm=null;

		lsj=0;
		yhj=0;
		pjjg=0;
		try{
			if (lsjstr.equals("") || lsjstr.equals("0"))
			{
				lsj=0;
			}
			else{
				lsj=Double.parseDouble(lsjstr);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[�г�ͳһ�޼�]����ת����������:"+lsjstr+";zcbm="+zcbm1);
			return;
		}

		try{
			if (yhjstr.equals("") || yhjstr.equals("0"))
			{
				yhj=0;
			}
			else{
				yhj=Double.parseDouble(yhjstr);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[�Żݼ�]����ת����������:"+yhjstr);
			return;
		}

		try{
			if (pjjgstr.equals("") || pjjgstr.equals("0"))
			{
				pjjg=0;
			}
			else{
				pjjg=Double.parseDouble(pjjgstr);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[����۸�]����ת����������:"+pjjgstr);
			return;
		}


		ls_sql1 ="select zcdlbm";
		ls_sql1+=" from jdm_zcdlbm ";
		ls_sql1+=" where zcdlmc='"+zcdlmc+"'";
		ps= conn.prepareStatement(ls_sql1);
		rs=ps.executeQuery();
		if(rs.next())
		{
			zcdlbm=rs.getString("zcdlbm");
		}
		else{
			out.println("<BR>[����]�����Ĵ������:"+zcdlmc);
		}
		rs.close();
		ps.close();

		ls_sql1 ="select ppbm";
		ls_sql1+=" from jdm_ppbm ";
		ls_sql1+=" where ppmc='"+ppmc+"'";
		ps= conn.prepareStatement(ls_sql1);
		rs=ps.executeQuery();
		if(rs.next())
		{
			ppbm=rs.getString("ppbm");
		}
		else{
			out.println("<BR>[����]��Ʒ�Ʊ���:"+ppmc);
		}
		rs.close();
		ps.close();

		ls_sql1 ="select jldwbm";
		ls_sql1+=" from jdm_jldwbm ";
		ls_sql1+=" where jldwmc='"+jldwmc+"'";
		ps= conn.prepareStatement(ls_sql1);
		rs=ps.executeQuery();
		if(rs.next())
		{
			jldwbm=rs.getString("jldwbm");
		}
		else{
			out.println("<BR>[����]�޼�����λ����:"+jldwmc);
		}
		rs.close();
		ps.close();


		//��Ҫ���ĵı��
		dwbh="G0137";
        //��Ҫ���ĵı��


		ls_sql1 ="select dwbh";
		ls_sql1+=" from sq_dwxx ";
		ls_sql1+=" where dwmc='"+dwmc+"'";
		ps= conn.prepareStatement(ls_sql1);
		rs=ps.executeQuery();
		if(rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		else{
//			out.println("<BR>[����]�޹�Ӧ��:"+dwmc);
		}
		rs.close();
		ps.close();


		
		zcbm=cf.addZero(count+start,7);

		ls_sql="insert into jc_zcjgb ( zcbm,zcmc,zcdlbm,ppbm,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,sfbhpj,pjts,pjjg,dwbh,bz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zcbm);
		ps.setString(2,zcmc);
		ps.setString(3,zcdlbm);
		ps.setString(4,ppbm);
		ps.setString(5,zclbbm);
		ps.setString(6,xh);
		ps.setString(7,gg);
		ps.setString(8,zcysbm);
		ps.setString(9,jldwbm);
		ps.setDouble(10,lsj);
		ps.setDouble(11,yhj);
		ps.setString(12,sfbhpj);
		ps.setLong(13,pjts);
		ps.setDouble(14,pjjg);
		ps.setString(15,dwbh);
		ps.setString(16,bz);
			
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
//	out.print("<BR>SQL=" + ls_sql);
	out.println("<BR>zcmc="+zcmc+";zcbm="+zcbm1);
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
