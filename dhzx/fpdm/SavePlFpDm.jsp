<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] khbh=request.getParameterValues("khbh");
String zxdm=cf.GB2Uni(request.getParameter("zxdm"));
String sjsbh="";

if (zxdm==null || zxdm.equals(""))
{
	out.println("������ѯ����Ϊ��");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

String yzxdm=null;
java.sql.Date yzxdmfpsj=null;
java.sql.Date zxdmfpsj=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		int fpsj=0;
		String yzxzt=null;
		String ssfgs=null;
		String ykhfwjlh=null;
		String ydmjdjlh=null;
		ls_sql="select zxzt,ssfgs,zxdm,zxdmfpsj,SYSDATE-zxdmfpsj fpsj,khfwjlh,dmjdjlh";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yzxzt=rs.getString("zxzt");
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			yzxdm=cf.fillNull(rs.getString("zxdm"));
			yzxdmfpsj=rs.getDate("zxdmfpsj");
			fpsj=rs.getInt("fpsj");
			ykhfwjlh=rs.getString("khfwjlh");
			ydmjdjlh=rs.getString("dmjdjlh");
		}
		ps.close();
		rs.close();
		if (yzxdmfpsj==null)
		{
			fpsj=20;
		}




		String zt="";
		ls_sql="select zt";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=rs.getString("zt");
		}
		rs.close();
		ps.close();

		String dmjdjlh=null;//�������
		ls_sql="select NVL(max(substr(dmjdjlh,8,3)),0)";
		ls_sql+=" from  crm_dmjdjl";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		dmjdjlh=khbh[i]+cf.addZero(count+1,3);

		String khfwjlh=null;//�������
		ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
		ls_sql+=" from  crm_zxkhfwjl";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		khfwjlh=khbh[i]+cf.addZero(count+1,3);


		conn.setAutoCommit(false);
		String zxzt="1";//1: �������

		if (yzxdm.equals(zxdm))//δ�ı�
		{
			ls_sql="update crm_zxkhxx set sjsbh=?,sjs=null,sjsfpsj=null,zxzt=?";//zxzt,0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjsbh);
			ps.setString(2,zxzt);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_khxx set sjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

	//		out.println(ls_sql);

			//���¼��ɶ�����������������������������������������������������
			ls_sql="update jc_jcdd set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_mmydd set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_mmzjx set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_cgdd set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_cgzjx set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_jjdd set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_jjzjx set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_zcdd set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_zcddmx set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_zczjx set jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//���¼��ɶ�������������������������������������������������������������������
		}
		else{
			zxdmfpsj=cf.getDate();

			if (fpsj<2)//2���ڲ������¼�¼��ֻ���޸�
			{
				ls_sql="update crm_dmjdjl set zxdm=?";
				ls_sql+=" where  (dmjdjlh='"+ydmjdjlh+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zxdm);
				ps.executeUpdate();
				ps.close();

				ls_sql="update crm_zxkhfwjl set zxdm=?";
				ls_sql+=" where  (khfwjlh='"+ykhfwjlh+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zxdm);
				ps.executeUpdate();
				ps.close();

				ls_sql="update crm_zxkhxx set zxdm=?,zxdmfpsj=?,sjsbh=?,sjs=null,sjsfpsj=null,zxzt=?";//zxzt,0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
				ls_sql+=" where khbh='"+khbh[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zxdm);
				ps.setDate(2,zxdmfpsj);
				ps.setString(3,sjsbh);
				ps.setString(4,zxzt);
				ps.executeUpdate();
				ps.close();
			}
			else{
				//���룺����ӵ���¼��crm_dmjdjl��
				ls_sql="insert into crm_dmjdjl (dmjdjlh,khbh,ssfgs,zxdm,kssj,kslrr,ydmjdjlh,zxzt)";
				ls_sql+=" values ( ?,?,?,?,TRUNC(SYSDATE),?,?,?)";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dmjdjlh);
				ps.setString(2,khbh[i]);
				ps.setString(3,ssfgs);
				ps.setString(4,zxdm);
				ps.setString(5,yhmc);
				ps.setString(6,ydmjdjlh);
				ps.setString(7,zxzt);
				ps.executeUpdate();
				ps.close();


				//�������ѯ�ͻ������¼��crm_zxkhfwjl��
				ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,czlx,xzxzt,yzxzt,yzxdm,lrr,lrsj,lrbm,ykhfwjlh)";
				ls_sql+=" values ( ?,?,?,?,'5',?,?,?,?,TRUNC(SYSDATE),?,?)";//5: �������
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khfwjlh);
				ps.setString(2,khbh[i]);
				ps.setString(3,ssfgs);
				ps.setString(4,zxdm);
				ps.setString(5,zxzt);
				ps.setString(6,yzxzt);
				ps.setString(7,yzxdm);
				ps.setString(8,yhmc);
				ps.setString(9,dwbh);
				ps.setString(10,ykhfwjlh);
				ps.executeUpdate();
				ps.close();

				ls_sql="update crm_zxkhxx set zxdm=?,zxdmfpsj=?,sjsbh=?,sjs=null,sjsfpsj=null,zxzt=?,khfwjlh=?,dmjdjlh=?";//zxzt,0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
				ls_sql+=" where khbh='"+khbh[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zxdm);
				ps.setDate(2,zxdmfpsj);
				ps.setString(3,sjsbh);
				ps.setString(4,zxzt);
				ps.setString(5,khfwjlh);
				ps.setString(6,dmjdjlh);
				ps.executeUpdate();
				ps.close();
			}


			ls_sql="update crm_khxx set fgsbh=?,dwbh=?,sjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();

	//		out.println(ls_sql);

			//���¼��ɶ�����������������������������������������������������
			ls_sql="update jc_jcdd set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_mmydd set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_mmzjx set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_cgdd set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_cgzjx set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_jjdd set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_jjzjx set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_zcdd set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_zczjx set fgsbh=?,qddm=?,jzsjs=''";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,zxdm);
			ps.executeUpdate();
			ps.close();
			//���¼��ɶ�������������������������������������������������������������������
		}


	}



	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("����ɹ���");
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