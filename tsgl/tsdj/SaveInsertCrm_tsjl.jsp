<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String slfsbm=null;
String khbh=null;
String yzcdbm=null;
String sfxhf=null;
java.sql.Date yqjjsj=null;
java.sql.Date hfsj=null;

String bz=cf.GB2Uni(request.getParameter("bz"));
String tsjlh=request.getParameter("tsjlh");
String slbm=request.getParameter("slbm");
String tsnr=cf.GB2Uni(request.getParameter("tsnr"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String sfla=cf.GB2Uni(request.getParameter("sfla"));
slfsbm=cf.GB2Uni(request.getParameter("slfsbm"));
yzcdbm=cf.GB2Uni(request.getParameter("yzcdbm"));
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


String slr=cf.GB2Uni(request.getParameter("slr"));
java.sql.Date slsj=null;
ls=request.getParameter("slsj");
try{
	if (!(ls.equals("")))  slsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����slsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͷ�����ʱ��]����ת����������:"+e);
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
	out.println("<BR>[�ͻ�Ͷ�߱���ʱ��]����ת����������:"+e);
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


sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�ʱ��]����ת����������:"+e);
	return;
}


String clzt=null;
if (sfla.equals("N"))
{
	clzt="9";//0��δ����1��������2���ڴ���3���᰸��9:������
}
else{
	clzt="1";//0��δ����1��������2���ڴ���3���᰸��9:������
}
String sfxtz=request.getParameter("sfxtz");

String rglrbz=request.getParameter("rglrbz");
String tspp=cf.GB2Uni(request.getParameter("tspp"));
String rglrtspp=cf.GB2Uni(request.getParameter("rglrtspp"));

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String sfxnbgz=null;
java.sql.Date nbgzsj=null;
sfxnbgz=cf.GB2Uni(request.getParameter("sfxnbgz"));
ls=request.getParameter("nbgzsj");
try{
	if (!(ls.equals("")))  nbgzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����nbgzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ڲ�����ʱ��]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String jcppbz=request.getParameter("jcppbz");

String tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
String tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String dwbh=request.getParameter("dwbh");
String kszy=cf.GB2Uni(request.getParameter("kszy"));
int khldcs=0;
ls=request.getParameter("khldcs");
try{
	if (!(ls.equals("")))  khldcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khldcs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ��������]����ת����������:"+e);
	return;
}


try {
	conn=cf.getConnection();

	//Ͷ�߹�Ӧ��
	String ppmc=null;
	String gys=null;
	if (rglrbz.equals("1"))//1��ϵͳȡ��2���˹�¼��
	{
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
	}
	else{
		if (!rglrtspp.equals(""))
		{
			tspp=rglrtspp;
			ppmc=rglrtspp;
			gys=rglrtspp;
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

	ls_sql="update crm_khxx set tsbz='Y',tsjlh=? where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into crm_tsjl ( tsjlh,khbh,slfsbm,yzcdbm,yqjjsj   ,sfxhf,hfsj,tsbxsj,slr,slsj,lrr   ,lrsj,slbm,bz,clzt,lx   ,zrbmclzt,tsnr,ssfgs,sfxtz,kszy,khldcs,sfpz,sfxnbgz,nbgzsj,sfxldcl,sfpfkh,khpfze,sfnbcf,nbcfze,sffswxf,wxfze ) ";
	ls_sql+=" values ( ?,?,?,?,?   ,?,?,?,?,?,?   ,SYSDATE,?,?,?,'1'  ,?,?,?,?,?,?,'N',?,?,'N','1',0,'1',0,'1',0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,khbh);
	ps.setString(3,slfsbm);
	ps.setString(4,yzcdbm);
	ps.setDate(5,yqjjsj);

	ps.setString(6,sfxhf);
	ps.setDate(7,hfsj);
	ps.setDate(8,tsbxsj);
	ps.setString(9,slr);
	ps.setDate(10,slsj);
	ps.setString(11,lrr);

	ps.setString(12,slbm);
	ps.setString(13,bz);
	ps.setString(14,clzt);

	ps.setString(15,"1");//1��δ����2���ڴ���3���ѽ��
	ps.setString(16,tsnr);
	ps.setString(17,ssfgs);
	ps.setString(18,sfxtz);
	ps.setString(19,kszy);
	ps.setInt(20,khldcs);
	ps.setString(21,sfxnbgz);
	ps.setDate(22,nbgzsj);

	ps.executeUpdate();
	ps.close();



	//�ͻ�Ͷ��ԭ��
	String sfytz=null;
	if (sfxtz.equals("Y"))
	{
		sfytz="0";//0��δ֪ͨ��1����֪ͨ��2������֪ͨ
	}
	else{
		sfytz="2";
	}

	ls_sql="insert into crm_tsbm (tsjlh,tsyybm,tslxbm,tsxlbm,dwbh   ,sfytz,clzt,ssfgs,khbh  ,tspp,ppmc,gys,rglrbz,zrr,ygbh,sfpfkh,khpfze,sfnbcf,nbcfze,tzr,tzsj,sffswxf,wxfze) ";
	ls_sql+=" values (?,?,?,?,?  ,?,?,?,?  ,?,?,?,?,?,?,'1',0,'1',0,?,SYSDATE,'1',0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,tsyybm);
	ps.setString(3,tslxbm);
	ps.setString(4,tsxlbm);
	ps.setString(5,dwbh);

	ps.setString(6,sfytz);
	ps.setString(7,"1");//1��δ����2���ڴ���3���ѽ��
	ps.setString(8,ssfgs);
	ps.setString(9,khbh);

	ps.setString(10,tspp);
	ps.setString(11,ppmc);
	ps.setString(12,gys);
	ps.setString(13,rglrbz);
	ps.setString(14,zrr);
	ps.setString(15,ygbh);
	ps.setString(16,lrr);
	ps.executeUpdate();
	ps.close();

	//�ͻ������¼
	ls_sql="insert into crm_khldjl (tsjlh,khldsj,khbh) ";
	ls_sql+=" values (?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,khbh);
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
	out.print("<BR>SQL: " + ls_sql);
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