<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
double qye=0;
double wdzgce=0;
double sjf=0;
java.sql.Date qyrq=null;
String dwbh=null;
java.sql.Date lrsj=null;
String khlxbm=null;
String lrr=null;
String bz=null;


khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));

sjs=cf.GB2Uni(request.getParameter("sjs"));
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qye������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩԼ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ���۹��̶�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qyrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩԼ����]����ת����������:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ϱ�����]����ת����������:"+e);
	return;
}
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));



String khjl=cf.GB2Uni(request.getParameter("khjl"));
String ywy=cf.GB2Uni(request.getParameter("ywy"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String jiedao=cf.GB2Uni(request.getParameter("jiedao"));

//�ۿ���
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿ���]����ת����������:"+e);
	return;
}

String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String zt=cf.GB2Uni(request.getParameter("zt"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));
String hth=cf.GB2Uni(request.getParameter("hth"));
String smhtbh=cf.GB2Uni(request.getParameter("smhtbh"));
String ywyssxz=request.getParameter("ywyssxz");
String sjsbh=request.getParameter("sjsbh");

String ysy=request.getParameter("ysy");

String hdsfss=null;

String czkbz="0";

String khbh=cf.GB2Uni(request.getParameter("khbh"));

if (khxm.indexOf("����")>0 || khxm.indexOf("С��")>0 || khxm.indexOf("Ůʿ")>0 || khxm.indexOf("����")>0 || khxm.indexOf("����")>0)
{
	out.println("<BR>����[����]������ȫ�ƣ��磺����������С�㡢��Ůʿ�ȶ����淶");
	return;
}

if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[����]���м䲻��������ո�");
	return;
}
if (cf.isHanzi(fwdz)!=2 && cf.isHanzi(fwdz)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[���ݵ�ַ]���м䲻��������ո�");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	double lsi=0;

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where fwdz='"+fwdz+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>���󣡴˷��ݵ�ַ�Ѵ���");
		return;
	}

	//�ͻ�����
	String mqzt=null;
	String mqxmzy=null;
	ls_sql="select zt,xmzy";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqzt=rs.getString("zt");//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
		mqxmzy=rs.getString("xmzy");
	}
	rs.close();
	ps.close();


	//��ͬ�ż��
	int hthsfcz=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hthsfcz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (hthsfcz>0)
	{
		out.println("<BR>���󣡺�ͬ���ѱ������ͻ�ʹ��");
		return;
	}

	String sybz="";
	String sykhbh="";
	ls_sql="select sybz,khbh";
	ls_sql+=" from  crm_hthxx";
	ls_sql+=" where  hth='"+hth+"' and dwbh='"+dwbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sybz=cf.fillNull(rs.getString("sybz"));
		sykhbh=cf.fillNull(rs.getString("khbh"));
	}
	else{
		out.println("<BR>���󣡲����ں�ͬ�ţ���������ϵͳ�������ͬ��");
		return;
	}
	rs.close();
	ps.close();

	if (sybz.equals("Y"))
	{
		out.println("<BR>���󣡺�ͬ���ѱ��ͻ�["+sykhbh+"]ʹ��");
		return;
	}

/*
	if (!hth.substring(3,7).equals(qyrq.toString().substring(2,4)+qyrq.toString().substring(5,7)))
	{
		out.println("<BR>���󣡷ǵ��º�ͬ�ţ�"+hth);
		return;
	}
*/
	conn.setAutoCommit(false);

	if (mqzt!=null)
	{
		if (mqzt.equals("4"))//����ת��װ�ͻ�
		{
			ls_sql="delete from  crm_khxx ";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
	}

	ls_sql="update crm_zxkhxx set zxzt='3',khxm=?,xb=?,fwdz=?,lxfs=?,qtdh=?,email=?,cqbm=?,xqbm=?,louhao=?,qdsj=?,hth=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,qtdh);
	ps.setString(6,email);
	ps.setString(7,cqbm);
	ps.setString(8,xqbm);
	ps.setString(9,louhao);
	ps.setDate(10,qyrq);
	ps.setString(11,hth);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,sfzhm,zkl,wdzgce,qye,sjf   ,qyrq,sjs,ywy,sjsbh,dwbh,fgsbh,khlxbm,jzbz,zt,lrr";
	ls_sql+=" ,lrsj,bz,cqbm,xqbm,louhao,qtdh,email,hth,smhtbh,khjl,jiedao,ywyssxz,ysy";

	ls_sql+=" ,zjxwcbz,sffj,sfyrz,pdclzt,gcjdbm,dalqbz,gdjsjd,sjsjsbz   ,ywyjsbz,sfxhf,ybjbz,hdbz,tsbz,bxbz,kpbz,hfdjbz,htshbz,khjsbz,zjjsbz,sjssjfjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,xmjfzt,zqsuijin,zqzjxsuijin,fjtcbz)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?";

	ls_sql+=" ,'2','N','N','1','1','1','0','0'   ,'0','N','N','1','N','N','N','0','N','N','0','0','N',0,0,0,'N',0,0,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setString(6,sfzhm);
	ps.setDouble(7,zkl);
	ps.setDouble(8,wdzgce);
	ps.setDouble(9,qye);
	ps.setDouble(10,sjf);

	ps.setDate(11,qyrq);
	ps.setString(12,sjs);
	ps.setString(13,ywy);
	ps.setString(14,sjsbh);
	ps.setString(15,dwbh);
	ps.setString(16,fgsbh);
	ps.setString(17,khlxbm);
	ps.setString(18,jzbz);
	ps.setString(19,zt);
	ps.setString(20,lrr);

	ps.setDate(21,lrsj);
	ps.setString(22,bz);
	ps.setString(23,cqbm);
	ps.setString(24,xqbm);
	ps.setString(25,louhao);
	ps.setString(26,qtdh);
	ps.setString(27,email);
	ps.setString(28,hth);
	ps.setString(29,smhtbh);
	ps.setString(30,khjl);
	ps.setString(31,jiedao);
	ps.setString(32,ywyssxz);
	ps.setString(33,ysy);
	ps.executeUpdate();
	ps.close();


	//�ͻ����Ϸ�����bj_khglfxb��
	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	//ɾ����ʱ���ۣ�������������������������ʼ

	//��ʱ����--��Ŀ��ϸ
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--���Ϸ�����
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--������Ϣ
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--��������ϸ
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--��������
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--�����շ���Ŀ��ϸ
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ����ʱ����========================���


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
