<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String slfsbm=null;
String sfxhf=null;
java.sql.Date hfsj=null;
String bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tsnr=cf.GB2Uni(request.getParameter("tsnr"));
String sfla=cf.GB2Uni(request.getParameter("sfla"));
slfsbm=cf.GB2Uni(request.getParameter("slfsbm"));
java.sql.Date yqjjsj=null;
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

String clzt=null;

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
if (sfla.equals("N"))
{
	clzt="9";//0��δ����1��������2���ڴ���3���᰸��9:������
}
else{
	clzt="1";//0��δ����1��������2���ڴ���3���᰸��9:������
}
String sfxtz=request.getParameter("sfxtz");


String jcppbz=request.getParameter("jcppbz");

String tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
String tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String dwbh=request.getParameter("dwbh");
String ssfgs=request.getParameter("ssfgs");

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
String ysgd=cf.GB2Uni(request.getParameter("ysgd"));
String ysgdsflz=cf.GB2Uni(request.getParameter("ysgdsflz"));
String wxfl=request.getParameter("wxfl");

String wheretsyybm=cf.GB2Uni(request.getParameter("wheretsyybm"));
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!getclzt.equals("1") && !getclzt.equals("9"))//0��δ����1��������2���ڴ���3���᰸��9:������
	{
		out.println("���󣡴���״̬����ȷ���������޸�");
		return;
	}

	//���޹�Ӧ��
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

	ls_sql="update crm_tsjl set slfsbm=?,yqjjsj=?,sfxhf=?,hfsj=?, bz=?,tsnr=?,clzt=?   ,tsbxsj=?,slr=?,slsj=?,lrr=?,sfxtz=?,wxfl=?,sfxnbgz=?,nbgzsj=?,ysgd=?,ysgdsflz=?";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,slfsbm);
	ps.setDate(2,yqjjsj);
	ps.setString(3,sfxhf);
	ps.setDate(4,hfsj);
	ps.setString(5,bz);
	ps.setString(6,tsnr);
	ps.setString(7,clzt);

	ps.setDate(8,tsbxsj);
	ps.setString(9,slr);
	ps.setDate(10,slsj);
	ps.setString(11,lrr);
	ps.setString(12,sfxtz);
	ps.setString(13,wxfl);
	ps.setString(14,sfxnbgz);
	ps.setDate(15,nbgzsj);
	ps.setString(16,ysgd);
	ps.setString(17,ysgdsflz);
	ps.executeUpdate();
	ps.close();

	//�ͻ�����ԭ��
	ls_sql="update crm_tsbm set tslxbm=?,tsxlbm=?,tsyybm=?,dwbh=?,tspp=?,ppmc=?,gys=?,rglrbz=?,zrr=?,ygbh=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+wheretsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tslxbm);
	ps.setString(2,tsxlbm);
	ps.setString(3,tsyybm);
	ps.setString(4,dwbh);
	ps.setString(5,tspp);
	ps.setString(6,ppmc);
	ps.setString(7,gys);
	ps.setString(8,rglrbz);
	ps.setString(9,zrr);
	ps.setString(10,ygbh);
	if (ps.executeUpdate()!=1)
	{
		ps.close();
		conn.rollback();
		out.println("���󣡱��ޱ���ԭ����ȷ���������޸ģ���ˢ�º����´���");
		return;
	}
	ps.close();

	String sfytz=null;
	if (sfxtz.equals("Y"))
	{
		sfytz="0";//0��δ֪ͨ��1����֪ͨ��2������֪ͨ
	}
	else{
		sfytz="2";
	}

	ls_sql="update crm_tsbm set sfytz=?";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfytz);
	ps.executeUpdate();
	ps.close();

	//��������ط���ϸ
	ls_sql="update crm_tswthfmx set tsyybm=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+wheretsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsyybm);
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