<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ysjlhStr = request.getParameterValues("ysjlh");
if (ysjlhStr.length>1)
{
	out.println("����ÿ��ֻ��ɾ��һ����¼");
	return;
}

String ysjlh=ysjlhStr[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//��ȡ���ռ�¼��Ϣ
	String khbh=null;
	String oldgcysxmbm=null;
	String oldsfszhf=null;
	String oldhfszjlh=null;
	String oldgcjdbm=null;
	String oldygcjdbm=null;
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;
	String oldygcysxmbm=null;
	java.sql.Date oldyyssj=null;
	ls_sql="select khbh,gcysxmbm,sfszhf,hfszjlh,gcjdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm,ygcysxmbm,yyssj";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		oldgcysxmbm=rs.getString("gcysxmbm");
		oldsfszhf=cf.fillNull(rs.getString("sfszhf"));
		oldhfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		oldgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		oldygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
		oldysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		oldyhfrq=rs.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs.getString("yhflxbm"));
		oldygcysxmbm=cf.fillNull(rs.getString("ygcysxmbm"));
		oldyyssj=rs.getDate("yyssj");
	}
	else{
		out.println("���󣡲����ڵ����ռ�¼�ţ�"+ysjlh);
		return;
	}
	rs.close();
	ps.close();
	
	//��ȡ���¹��̽���
	String nowgcjdbm="";
	String nowzqysxmbm="";
	ls_sql="select gcjdbm,zqysxmbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
	}
	rs.close();
	ps.close();

	if (nowgcjdbm.equals("5"))
	{
		out.println("��������ᣬ������ɾ��");
		return;
	}

	String oldgcysxmmc=null;
	String olddygcjdbm="";
	String oldgetsfxhf="";
	String oldgethflxbm="";
	ls_sql="SELECT gcysxmmc,dygcjdbm,sfhf,hflxbm";
	ls_sql+=" FROM dm_gcysxm ";
	ls_sql+=" where  gcysxmbm='"+oldgcysxmbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldgcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		olddygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		oldgetsfxhf=cf.fillNull(rs.getString("sfhf"));
		oldgethflxbm=cf.fillNull(rs.getString("hflxbm"));
	}
	rs.close();
	ps.close();

	if (!olddygcjdbm.equals("") || oldgetsfxhf.equals("Y"))
	{
		if (!nowzqysxmbm.equals(oldgcysxmbm))
		{
			out.println("����ֻ��ɾ�����µ�������Ŀ");
			return;
		}
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

	//ɾ�������̷���������Ƭ
	ls_sql="delete from  crm_gcfxyszp ";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ�������̷������ռ�¼
	ls_sql="delete from  crm_gcfxysjl ";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ���ط�������Ϣ��������������������������������ʼ
	if (oldsfszhf.equals("Y"))//��ǰ���ù��ط�, Y���ǣ�N����
	{
		if (getsfyhf.equals("N"))//�ͷ�û��ʵ�ʻط�
		{
			if (getzxszbz.equals("Y"))//�����¼�¼����ɾ��
			{
				//��ԭ����ǰ������Ϣ
				ls_sql="update crm_khxx set sfxhf=?,hflxbm=?,hfrq=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldysfxhf);
				ps.setString(2,oldyhflxbm);
				ps.setDate(3,oldyhfrq);
				ps.executeUpdate();
				ps.close();

				//ɾ���ط����ü�¼
				ls_sql="delete from crm_hfszjl ";
				ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql=" update crm_hfszjl set zxszbz='Y'";	
				ls_sql+=" where hfszjlh='"+yhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{//δ�ط�,������,��һ����ǰһ������,ɾ������
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
			}
		}
	}
	//ɾ���ط�������Ϣ����������������������������������

	//ɾ�����̽���������Ϣ��������������������������������ʼ
	if (!oldgcjdbm.equals(""))//��ǰ���
	{
		if (!oldgcjdbm.equals(nowgcjdbm))//���õĹ��̽��ȱ����Ѹı䣬�������޸�
		{
			conn.rollback();
			out.println("���󣡿ͻ����̽����Ѹı䣬�������޸�");
			return;
		}
		else{//���޸�
			//����ɾ���ɵģ���������������������������ʼ
			if (oldgcjdbm.equals("1"))//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������
			{
				ls_sql="update crm_khxx set gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldgcjdbm.equals("2"))
			{
				ls_sql="update crm_khxx set sjkgrq=null,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldgcjdbm.equals("6"))
			{
				ls_sql="update crm_khxx set sybgcrq=null,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldgcjdbm.equals("3"))
			{
				ls_sql="update crm_khxx set szqsj=null,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldgcjdbm.equals("4"))
			{
				ls_sql="update crm_khxx set sjjgrq=null,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			//����ɾ���ɵģ�����������������������������
		}
	}
	//ɾ�����̽���������Ϣ����������������������������������

	ls_sql="update crm_khxx set szqsj=?,zqysxmbm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,oldyyssj);
	ps.setString(2,oldygcysxmbm);
	ps.executeUpdate();
	ps.close();

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