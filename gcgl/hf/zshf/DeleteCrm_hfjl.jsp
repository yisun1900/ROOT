<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlhStr = request.getParameterValues("hfjlh");
if (hfjlhStr.length!=1)
{
	out.println("����ÿ��ֻ��ɾ��һ����¼");
	return;
}

String hfjlh=hfjlhStr[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//�طü�¼��
	String khbh="";
	String oldzxhfbz="";//���»طñ�־
	String oldhfszjlh="";
	String oldsfjxhf="";//�����´λط�ʱ��
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;
	ls_sql="select khbh,zxhfbz,hfszjlh,sfjxhf,ysfxhf,yhfrq,yhflxbm";
	ls_sql+=" from  crm_hfjl ";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		oldzxhfbz=cf.fillNull(rs.getString("zxhfbz"));
		oldhfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		oldsfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		oldysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		oldyhfrq=rs.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs.getString("yhflxbm"));
	}
	ps.close();
	rs.close();
	if (!oldzxhfbz.equals("Y"))
	{
		out.println("����ֻ���޸�����һ�εĻطü�¼");
		return;
	}

	
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_gchffkbm where clzt='Y' and hfjlh="+hfjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("�����йز����ѶԻط����˴���������ɾ��");
		return;
	}

	//��ȡ�ط����ü�¼��Ϣ
	String getsfyhf="";//�Ƿ��ѻط� ,Y���طã�N��δ�ط�
	String getzxszbz="";//�������ñ�־  ,Y���ǣ�N����
	String yhfszjlh=null;
	ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl ";
	ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfyhf=cf.fillNull(rs.getString("sfyhf"));
		getzxszbz=cf.fillNull(rs.getString("zxszbz"));
		yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="delete from  crm_hfjl where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from  crm_gchffkbm where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	if (oldsfjxhf.equals("Y") || oldsfjxhf.equals("F"))//Y�����ã�N�������ã�F�����»ط�
	{
		if (getsfyhf.equals("N"))//�ͷ�û��ʵ�ʻط�
		{
			if (getzxszbz.equals("Y"))//�����¼�¼
			{
				//ɾ���ط����ü�¼
				ls_sql="delete from crm_hfszjl ";
				ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql=" update crm_hfszjl set zxszbz='Y',sfyhf='N',zxhfsj=null,hfjlh=null";	
				ls_sql+=" where  hfszjlh='"+yhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldysfxhf);
				ps.setDate(2,oldyhfrq);
				ps.setString(3,oldyhflxbm);
				ps.executeUpdate();
				ps.close();

			}
			else{//�������¼�¼��ɾ��,��һ����ǰһ������,ɾ������
				//ȡ��һ��
				String nexthfszjlh=null;
				ls_sql="SELECT hfszjlh ";
				ls_sql+=" FROM crm_hfszjl ";
				ls_sql+=" where  khbh='"+khbh+"' and yhfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					nexthfszjlh=cf.fillNull(rs.getString("hfszjlh"));
				}
				rs.close();
				ps.close();

				//��һ����ǰһ������
				ls_sql=" update crm_hfszjl set yhfszjlh=?";	
				ls_sql+=" where hfszjlh='"+nexthfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,yhfszjlh);
				ps.executeUpdate();
				ps.close();

				//ɾ�������ط����ü�¼
				ls_sql="delete from crm_hfszjl ";
				ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql=" update crm_hfszjl set sfyhf='N',zxhfsj=null,hfjlh=null";	
				ls_sql+=" where  hfszjlh='"+yhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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