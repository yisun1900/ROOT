<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010110")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String xtrzip=request.getRemoteHost();

String newssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String newssdw=cf.GB2Uni(request.getParameter("ssdw"));
String newssdqbm=cf.GB2Uni(request.getParameter("ssdqbm"));
String newdqbm=cf.GB2Uni(request.getParameter("dqbm"));
String[] dwbh=request.getParameterValues("dwbh");

if (dwbh==null)
{
	out.println("<BR>����û��ѡ���κβ���");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String ssdwdwlx=null;
try {
	conn=cf.getConnection();

	ls_sql="select dwlx";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+newssdw+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssdwdwlx=cf.fillNull(rs.getString("dwlx"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	for (int i=0;i<dwbh.length ;i++ )
	{
		//�޸ģ���λ��Ϣ��(sq_dwxx)
		//��顺���ϼ���λ���Ƿ���ȷ
		String dwlx=null;
		String oldssfgs=null;
		ls_sql="select dwlx,ssfgs";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dwlx=cf.fillNull(rs.getString("dwlx"));
			oldssfgs=cf.fillNull(rs.getString("ssfgs"));
		}
		rs.close();
		ps.close();

		if (ssdwdwlx.equals(dwlx))
		{
			conn.rollback();
			out.println("<BR>���󣡵�λ��š�"+dwbh[i]+"���ġ����ϼ���λ������ȷ");
			return;
		}
		
		ls_sql="update sq_dwxx set ssdw=?,ssfgs=?,ssdqbm=?,dqbm=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssdw);
		ps.setString(2,newssfgs);
		ps.setString(3,newssdqbm);
		ps.setString(4,newdqbm);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�ʩ������Ϣ��(sq_sgd)
		ls_sql="update sq_sgd set ssfgs=?";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�ʩ������Ϣ��(sq_sgd)
		ls_sql="update sq_fxfzr set ssfgs=?";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�Ա�����������(sq_yhxx)
		ls_sql="update sq_yhxx set ssfgs=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�Ա����ְ��¼(rs_yhrzjl)
		ls_sql="update rs_yhrzjl set ssfgs=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�Ա����ְ��¼(rs_yhlzjl)
		ls_sql="update rs_yhlzjl set ssfgs=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();
	
	

		//�޸ģ���ѯ�ͻ���Ϣ��crm_zxkhxx��
		ls_sql="update crm_zxkhxx set ssfgs=?";
		ls_sql+=" where zxdjbm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ���ѯ�ͻ���Ϣ��crm_zxkhxx����ע���Ⱥ�˳�򣬱�����ǰһ�����
		ls_sql="update crm_zxkhxx set ssfgs=?";
		ls_sql+=" where zxdm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ���ѯ�ͻ������¼��crm_zxkhfwjl��
		ls_sql="update crm_zxkhfwjl set ssfgs=?";
		ls_sql+=" where zxdm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�����ӵ���¼��crm_dmjdjl��
		ls_sql="update crm_dmjdjl set ssfgs=?";
		ls_sql+=" where zxdm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����ʦ�ӵ���¼��crm_sjsjdjl��
		ls_sql="update crm_sjsjdjl set ssfgs=?";
		ls_sql+=" where zxdm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ���ѯ�طü�¼��crm_zxhfjl��
		ls_sql="update crm_zxhfjl set ssfgs=?";
		ls_sql+=" where zxdm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();





		//�޸ģ��ͻ���Ϣ��crm_khxx��
		ls_sql="update crm_khxx set fgsbh=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();


		//�޸ģ��ڲ�Ͷ�߼�¼��crm_nbtsjl��
		ls_sql="update crm_nbtsjl set btsfgs=?";
		ls_sql+=" where btsbm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();
		ls_sql="update crm_nbtsjl set slfgs=?";
		ls_sql+=" where slbm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();



		//�޸ģ��ͻ������¼��cw_khfkjl��
		ls_sql="update cw_khfkjl set fgsbh=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����ʦ�����¼��cw_sjsjsjl��
		ls_sql="update cw_sjsjsjl set fgsbh=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();


		//�޸ģ�ҵ��Ա�����¼��cw_ywyjsjl��
		ls_sql="update cw_ywyjsjl set fgsbh=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ��ʼ�����¼��cw_zjjsjl��
		ls_sql="update cw_zjjsjl set fgsbh=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();




		//�޸ģ����ɶ�����jc_jcdd��
		ls_sql="update jc_jcdd set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����Ķ�����jc_zcdd��
		ls_sql="update jc_zcdd set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����Ķ�����ϸ��jc_zcddmx��
		ls_sql="update jc_zcddmx set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����������jc_zczjx��
		ls_sql="update jc_zczjx set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����������jc_zczjx��
		ls_sql="update jc_zczjx set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�ľ��Ԥ������jc_mmydd��
		ls_sql="update jc_mmydd set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ�ľ�������jc_mmzjx��
		ls_sql="update jc_mmzjx set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ��Ҿ߶�����jc_jjdd��
		ls_sql="update jc_jjdd set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ��Ҿ������jc_jjzjx��
		ls_sql="update jc_jjzjx set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����񶩵���jc_cgdd��
		ls_sql="update jc_cgdd set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����������jc_cgzjx��
		ls_sql="update jc_cgzjx set fgsbh=?";
		ls_sql+=" where qddm='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�޸ģ����������jc_cgzjx��
		ls_sql="update cw_qmjzmx set fgsbh=?";
		ls_sql+=" where dwbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newssfgs);
		ps.executeUpdate();
		ps.close();

		//�����ֹ�˾��־
		ls_sql="insert into sq_ghfgsrz (yhdlm,czsj,dwbh,oldfgs,newfgs,yhmc,ip ) ";
		ls_sql+=" values('"+yhdlm+"',SYSDATE,'"+dwbh[i]+"','"+oldssfgs+"','"+newssfgs+"','"+yhmc+"','"+xtrzip+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�����ֹ�˾�ɹ���");
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






