<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String slfsbm=null;
String khbh=null;
String wxsgd=null;
java.sql.Date yqjjsj=null;

String bz=cf.GB2Uni(request.getParameter("bz"));
String tsjlh=request.getParameter("tsjlh");
String slbm=request.getParameter("slbm");
String tsnr=cf.GB2Uni(request.getParameter("tsnr"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
slfsbm=cf.GB2Uni(request.getParameter("slfsbm"));
wxsgd=cf.GB2Uni(request.getParameter("wxsgd"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yqjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�Ҫ����ʱ��]����ת����������:"+e);
	return;
}

java.sql.Date tsbxsj=null;
ls=request.getParameter("tsbxsj");
try{
	if (!(ls.equals("")))  tsbxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsbxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ����ޱ���ʱ��]����ת����������:"+e);
	return;
}
String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
String ysgd=cf.GB2Uni(request.getParameter("ysgd"));
String ysgdsflz=cf.GB2Uni(request.getParameter("ysgdsflz"));
String wxfl=request.getParameter("wxfl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String jcppbz=request.getParameter("jcppbz");
String tspp=cf.GB2Uni(request.getParameter("tspp"));

String tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
String tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String dwbh=request.getParameter("dwbh");
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));


try {
	conn=cf.getConnection();

	//���޹�Ӧ��
	String ppmc=null;
	String gys=null;

	if (tspp!=null && !tspp.equals(""))
	{
		if (!jcppbz.equals("N"))//�Ƿ����ü��ɶ���:Y�����ã�N�������еĹ�Ӧ����ɾ����Ҫ�Ӷ���ȡ
		{
			int pos=tspp.indexOf("*");
			ppmc=tspp.substring(pos+1);
			tspp=tspp.substring(0,pos);

			pos=ppmc.indexOf("*");
			gys=ppmc.substring(pos+1);
			ppmc=ppmc.substring(0,pos);
		}
		else{
			ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppgysdzb.ppmc='"+tspp+"' and jxc_ppgysdzb.ssfgs='"+ssfgs+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				ppmc=rs.getString("scsmc");
				gys=rs.getString("gysmc");
			}
			rs.close();
			ps.close();
		}
	}

	String zrr="";
	ls_sql="select yhmc";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrr=rs.getString("yhmc");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set bxbz='Y',bxjlh=? where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into crm_tsjl ( tsjlh,khbh,slfsbm,wxsgd,yqjjsj  ,sfxhf,tsbxsj,lrr  ,lrsj,slbm,bz,clzt,lx   ,zrbmclzt,tsnr,ssfgs,sfxtz,sfpz,sfxnbgz,sfxldcl,sfpfkh,khpfze,sfnbcf,nbcfze,ysgd,ysgdsflz,wxfl,sfhsgd,sffswxf,wxfze ) ";
	ls_sql+=" values ( ?,?,?,?,?  ,?,?,?  ,SYSDATE,?,?,?,'2'  ,'1',?,?,?,'N','N','N','1',0,'1',0,?,?,?,'T','1',0) ";//1��δ����2���ڴ���3���ѽ��
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,khbh);
	ps.setString(3,slfsbm);
	ps.setString(4,wxsgd);
	ps.setDate(5,yqjjsj);

	ps.setString(6,"N");//Y:��ط�;N:����ط�
	ps.setDate(7,tsbxsj);
	ps.setString(8,lrr);

	ps.setString(9,slbm);
	ps.setString(10,bz);
	ps.setString(11,"0");//0��δ����1��������2���ڴ���3���᰸��9:������

	ps.setString(12,tsnr);
	ps.setString(13,ssfgs);
	ps.setString(14,"N");//Y����֪ͨ��N������֪ͨ
	ps.setString(15,ysgd);
	ps.setString(16,ysgdsflz);
	ps.setString(17,wxfl);

	ps.executeUpdate();
	ps.close();


	//�ͻ�����ԭ��
	ls_sql="insert into crm_tsbm (tsjlh,tsyybm,tslxbm,tsxlbm,dwbh   ,sfytz,clzt,ssfgs,khbh  ,tspp,ppmc,gys,rglrbz,zrr,ygbh,sfpfkh,khpfze,sfnbcf,nbcfze,sffswxf,wxfze ) ";
	ls_sql+=" values (?,?,?,?,?   ,?,?,?,?  ,?,?,?,?,?,?,'1',0,'1',0,'1',0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,tsyybm);
	ps.setString(3,tslxbm);
	ps.setString(4,tsxlbm);
	ps.setString(5,dwbh);

	ps.setString(6,"2");//0��δ֪ͨ��1����֪ͨ��2������֪ͨ
	ps.setString(7,"1");//1��δ����2���ڴ���3���ѽ��
	ps.setString(8,ssfgs);
	ps.setString(9,khbh);

	ps.setString(10,tspp);
	ps.setString(11,ppmc);
	ps.setString(12,gys);
	ps.setString(13,"1");//1��ϵͳȡ�ã�2���˹�¼��
	ps.setString(14,zrr);
	ps.setString(15,ygbh);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("SQL: " + ls_sql);
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