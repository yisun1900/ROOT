<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String dwlx=(String)session.getAttribute("dwlx");
String ls=null;
//String khbh=null;
String khxm=null;
String xb=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String fwdz=null;
String lxfs=null;
String zybm=null;
long fj=0;
String sjs=null;
String khlxbm=null;
java.sql.Date yjzxsj=null;
String zxysbm=null;
String fwlxbm=null;
String hxbm=null;
long fwmj=0;
String fgyqbm=null;
String hdbz=null;
String cgdz=null;
String yzxxbz=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String zxdm=null;
String zxdjbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
//khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
jiedao=cf.GB2Uni(request.getParameter("jiedao"));
xqbm=cf.GB2Uni(request.getParameter("xqbm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
zybm=cf.GB2Uni(request.getParameter("zybm"));
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
sjs=cf.GB2Uni(request.getParameter("sjs"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjzxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ��װ��ʱ��]����ת����������:"+e);
	return;
}
zxysbm=cf.GB2Uni(request.getParameter("zxysbm"));
fwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fwmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڽ������]����ת����������:"+e);
	return;
}
fgyqbm=cf.GB2Uni(request.getParameter("fgyqbm"));
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�����]����ת����������:"+e);
	return;
}
zxdm=cf.GB2Uni(request.getParameter("zxdm"));
zxdjbm=cf.GB2Uni(request.getParameter("zxdjbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
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
bz=cf.GB2Uni(request.getParameter("bz"));

String ywy=cf.GB2Uni(request.getParameter("ywy"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));

java.sql.Date jhjfsj=null;
String hdr=null;
hdr=cf.GB2Uni(request.getParameter("hdr"));
ls=request.getParameter("jhjfsj");
try{
	if (!(ls.equals("")))  jhjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhjfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));
String khlxfs=cf.GB2Uni(request.getParameter("khlxfs"));
String email=cf.GB2Uni(request.getParameter("email"));

String khjl=cf.GB2Uni(request.getParameter("khjl"));
String xxlysm=cf.GB2Uni(request.getParameter("xxlysm"));
String djbbh=cf.GB2Uni(request.getParameter("djbbh"));

java.sql.Date jhctsj=null;
ls=request.getParameter("jhctsj");
try{
	if (!(ls.equals("")))  jhctsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhctsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ƽ��ͼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhcxgtsj=null;
ls=request.getParameter("jhcxgtsj");
try{
	if (!(ls.equals("")))  jhcxgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhcxgtsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���Ч��ͼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhcsgtsj=null;
ls=request.getParameter("jhcsgtsj");
try{
	if (!(ls.equals("")))  jhcsgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhcsgtsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ʩ��ͼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date jhzbjsj=null;
ls=request.getParameter("jhzbjsj");
try{
	if (!(ls.equals("")))  jhzbjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhzbjsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ������ӱ���ʱ��]����ת����������:"+e);
	return;
}
String khzyxz=cf.GB2Uni(request.getParameter("khzyxz"));


String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}

String[] xxlybm=request.getParameterValues("xxlybm");

String yxtxdz=cf.GB2Uni(request.getParameter("yxtxdz"));
String sshybm=cf.GB2Uni(request.getParameter("sshybm"));
String gmyx=cf.GB2Uni(request.getParameter("gmyx"));
String ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
String xqlx=cf.GB2Uni(request.getParameter("xqlx"));


String clpp=cf.GB2Uni(request.getParameter("clpp"));
String cph=cf.GB2Uni(request.getParameter("cph"));
String czms=cf.GB2Uni(request.getParameter("czms"));
String gnyq=cf.GB2Uni(request.getParameter("gnyq"));
String hyzk=cf.GB2Uni(request.getParameter("hyzk"));
String sfdkzx=cf.GB2Uni(request.getParameter("sfdkzx"));
String hznl=cf.GB2Uni(request.getParameter("hznl"));
String lrtz=cf.GB2Uni(request.getParameter("lrtz"));
//����������־������ʱ��  20100915
String lfbz=cf.GB2Uni(request.getParameter("lfbz"));
java.sql.Date lfsj=null;
ls=request.getParameter("lfsj");
try{
	if (!(ls.equals("")))  lfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}

java.sql.Date yylfsj=null;
ls=request.getParameter("yylfsj");
try{
	if (!(ls.equals("")))  yylfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yylfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԤԼ����ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date xclfsj=null;
ls=request.getParameter("xclfsj");
try{
	if (!(ls.equals("")))  xclfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xclfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�´�����ʱ��]����ת����������:"+e);
	return;
}
String sfyckh=cf.GB2Uni(request.getParameter("sfyckh"));
String pdqybm=cf.GB2Uni(request.getParameter("pdqybm"));
String ywybm=cf.GB2Uni(request.getParameter("ywybm"));
String dianz=cf.GB2Uni(request.getParameter("dianz"));
String scbjl=cf.GB2Uni(request.getParameter("scbjl"));

//����ֵ��0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[����]���м������������ַ�");
	return;
}
if (cf.isHanzi(xqbm)!=2 && cf.isHanzi(xqbm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[С��]���м������������ַ�");
	return;
}


String sjsgh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where fwdz='"+fwdz+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("���󣡴˷��ݵ�ַ�Ѵ���");
		return;
	}

	String getkhbh=null;
	String getkhxm=null;
	String getfwdz=null;
	String getlrr=null;
	String getlrsj=null;
	String getdwmc=null;
	ls_sql="select khbh,khxm,fwdz,lrr,lrsj,dwmc";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.zxdjbm=sq_dwxx.dwbh and crm_zxkhxx.lxfs='"+lxfs+"' ";
	ls_sql+=" and rownum<5";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhbh=cf.fillNull(rs.getString("khbh"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getfwdz=cf.fillNull(rs.getString("fwdz"));
		getlrr=cf.fillNull(rs.getString("lrr"));
		getlrsj=cf.fillNull(rs.getDate("lrsj"));
		getdwmc=cf.fillNull(rs.getString("dwmc"));

		out.println("<P>���󣡵绰�Ѵ��ڣ���"+getkhbh+"��"+getkhxm+"��"+getfwdz+"����"+getdwmc+"����"+getlrsj+"¼��");
		return;
	}
	rs.close();
	ps.close();

	//�ͻ����
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_zxkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	String khbh=cf.addZero(xh,7);

	//�ͻ����
	while (true)
	{
		khbh=cf.addZero(xh,7);

		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			xh++;
		}
		else{
			break;
		}
	}

	/*��������Ƿ�ɹ�������������������������������������ʼ*/
	String kgxqthd="";
	if (!cxhdbm.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if (!cxhdbmxq.equals("") || !cxhdbmzh.equals(""))
			{
				out.println("<BR>���󣡣�����˾�����["+cxhdbm+"]���ɹ��������");
				return;
			}
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmxq+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if ( (!cxhdbm.equals("�޻") && !cxhdbm.equals("")) || !cxhdbmzh.equals(""))
			{
				out.println("<BR>���󣡣���С�������["+cxhdbmxq+"]���ɹ��������");
				return;
			}
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmzh+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if ((!cxhdbm.equals("�޻") && !cxhdbm.equals("")) || !cxhdbmxq.equals(""))
			{
				out.println("<BR>���󣡣���չ������["+cxhdbmzh+"]���ɹ��������");
				return;
			}
		}
	}
	/*��������Ƿ�ɹ���=====================================����*/

	String hxmjbm=null;
	ls_sql="select hxmjmc";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" where  qd<="+fwmj+" and "+fwmj+"<zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxmjbm=rs.getString("hxmjmc");
	}
	rs.close();
	ps.close();

	String xxly=null;
	ls_sql="select xxlymc";
	ls_sql+=" from  dm_xxlybm";
	ls_sql+=" where xxlybm='"+xxlybm[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xxly=rs.getString("xxlymc");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//�Զ�������С��������������������������������ʼ
	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	int xqmark=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM yx_lsdcb ";
	ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqmark=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (xqmark==0)
	{
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM yx_xxqmd ";
		ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqmark=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (xqmark==0)
		{
			ls_sql="insert into yx_xxqmd (dqbm,xqmc,cqbm,dz,zt,lrr,lrsj,fgsbh)";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,dqbm);
			ps.setString(2,xqbm);
			ps.setString(3,cqbm);
			ps.setString(4,fwdz);
			ps.setString(5,"1");
			ps.setString(6,lrr);
			ps.setDate(7,lrsj);
			ps.setString(8,ssfgs);
			ps.executeUpdate();
			ps.close();
		}
	}
	//�Զ�������С����������������������������������

	//sjs��Ϊ�գ���¼�����ʦ����ʱ�䣨sjsfpsj��,zxdm��Ϊ�գ���¼����ѯ�������ʱ�䣨zxdmfpsj��
	java.sql.Date sjsfpsj=null;
	java.sql.Date zxdmfpsj=null;
	String zxzt=null;
	String khfwjlh=null;
	String sjsjdjlh=null;
	String dmjdjlh=null;

	if (zxdm==null || zxdm.equals(""))
	{
		zxdmfpsj=null;
		zxzt="0";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	}
	else{
		zxdmfpsj=cf.getDate();
		zxzt="1";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��

		//���룺����ӵ���¼��crm_dmjdjl��
		dmjdjlh=khbh+"001";
		ls_sql="insert into crm_dmjdjl (dmjdjlh,khbh,ssfgs,zxdm,kssj,kslrr,zxzt)";
		ls_sql+=" values ( ?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dmjdjlh);
		ps.setString(2,khbh);
		ps.setString(3,ssfgs);
		ps.setString(4,zxdm);
		ps.setDate(5,lrsj);
		ps.setString(6,lrr);
		ps.setString(7,zxzt);
		ps.executeUpdate();
		ps.close();

	}

	if (sjs==null || sjs.equals(""))
	{
		sjsfpsj=null;
	}
	else{
		sjsfpsj=cf.getDate();

		ls_sql="select sq_yhxx.ygbh";
		ls_sql+=" from  sq_yhxx,sq_sqbm";
		ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' ";
		ls_sql+=" and sq_yhxx.yhmc ='"+sjs+"' and sq_yhxx.zwbm='04' and sq_yhxx.sfzszg in('Y','N')";//04:���ʦ
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsgh=cf.fillNull(rs.getString("ygbh"));
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<BR>���󣡸õ�λ�޴����ʦ");
			return;
		}
		rs.close();
		ps.close();

		
		//��������ʦ�ӵ���¼��crm_sjsjdjl��
		sjsjdjlh=khbh+"001";
		ls_sql="insert into crm_sjsjdjl  (sjsjdjlh,khbh,ssfgs,zxdm,sjs,kssj,kslrr,zxzt)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjsjdjlh);
		ps.setString(2,khbh);
		ps.setString(3,ssfgs);
		ps.setString(4,zxdm);
		ps.setString(5,sjs);
		ps.setDate(6,lrsj);
		ps.setString(7,lrr);
		ps.setString(8,zxzt);
		ps.executeUpdate();
		ps.close();
	}

	String czlx=null;//1: �ܲ��ͻ�����¼�룻2: �ֹ�˾�ͻ�����¼�룻3: ����ͻ�����¼��
	if (dwlx.equals("A0") || dwlx.equals("A1"))
	{
		czlx="1";
	}
	else if (dwlx.equals("F0") || dwlx.equals("F1"))
	{
		czlx="2";
	}
	else{//����Ǽ�
		czlx="3";
	}
	//�������ѯ�ͻ������¼��crm_zxkhfwjl��
	khfwjlh=khbh+"001";
	ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,czlx,xzxzt,lrr,lrsj,lrbm)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khfwjlh);
	ps.setString(2,khbh);
	ps.setString(3,ssfgs);
	ps.setString(4,zxdm);
	ps.setString(5,sjs);
	ps.setString(6,czlx);
	ps.setString(7,zxzt);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,zxdjbm);
	ps.executeUpdate();
	ps.close();

	//�ͻ���Ϣ��Դ
	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";//1��ǩԼ�ͻ���2����ѯ�ͻ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="insert into crm_zxkhxx ( khbh,khxm,xb,cqbm,xqbm,fwdz,lxfs,nlqjbm,zybm,fj    ,sjs,khlxbm,yjzxsj,zxysbm,fwlxbm,hxbm,fwmj,fgyqbm,hdbz,cgdz   ,yzxxbz,sfxhf,hfrq,zxdm,zxdjbm,ywy,ssfgs,sjsfpsj,jhjfsj,hdr   ,zxdmfpsj,hdsfss,jzbz,sjsbh,ysrbm,louhao,khfwjlh,sjsjdjlh,dmjdjlh,cxhdbm    ,sjsgh,lrkhxm,lrfwdz,lrlxfs,email,cxhdbmxq,cxhdbmzh,yxtxdz,sshybm,gmyx     ,khjl,xxlysm,jhctsj,jhcxgtsj,jhcsgtsj,jhzbjsj,khzyxz,jiedao,djbbh,ywyssxz   ,xqlx,clpp,cph,czms,gnyq,hyzk,sfdkzx,hznl,lrtz,yylfsj    ,xclfsj,lrr,lrsj,bz,zxzt   ,lfbz,ctbz,shbz,sfzdzbj,sjsjsbz,sfjczjz,lfdjbz,hddjbz,sjfbz,cxgtbz,csgtbz,qsjhtbz,ysshbz,bjdysq,xcjdbz,lfsj,ywybm,pdqybm,sfyckh,dianz,scbjl,hxmjbm,xxly) ";
	ls_sql+=" values (               ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,?,?,?,?,?                                          ,?,?,?,?,?,?,?,?,?,?                                          ,?,?,?,?,?,?,?,?,?,?                                                        ,?,?,?,?,?,?,?,?,?,?                                                       ,?,?,?,?,?,?,?,?,?,?                                                        ,?,?,?,?,?,?,?,?,?,?                                     ,?,?,SYSDATE,?,?           ,?,'N','N','N','0','2','N','N','N','N','N','N','N','0','1',?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,cqbm);
	ps.setString(5,xqbm);
	ps.setString(6,fwdz);
	ps.setString(7,lxfs);
	ps.setString(8,nlqjbm);
	ps.setString(9,zybm);
	ps.setLong(10,fj);

	ps.setString(11,sjs);
	ps.setString(12,khlxbm);
	ps.setDate(13,yjzxsj);
	ps.setString(14,zxysbm);
	ps.setString(15,fwlxbm);
	ps.setString(16,hxbm);
	ps.setLong(17,fwmj);
	ps.setString(18,fgyqbm);
	ps.setString(19,hdbz);
	ps.setString(20,cgdz);

	ps.setString(21,yzxxbz);
	ps.setString(22,sfxhf);
	ps.setDate(23,hfrq);
	ps.setString(24,zxdm);
	ps.setString(25,zxdjbm);
	ps.setString(26,ywy);
	ps.setString(27,ssfgs);
	ps.setDate(28,sjsfpsj);
	ps.setDate(29,jhjfsj);
	ps.setString(30,hdr);

	ps.setDate(31,zxdmfpsj);
	ps.setString(32,hdsfss);
	ps.setString(33,jzbz);
	ps.setString(34,sjsbh);
	ps.setString(35,ysrbm);
	ps.setString(36,louhao);
	ps.setString(37,khfwjlh);
	ps.setString(38,sjsjdjlh);
	ps.setString(39,dmjdjlh);
	ps.setString(40,cxhdbm);

	ps.setString(41,sjsgh);
	ps.setString(42,khxm);
	ps.setString(43,fwdz);
	ps.setString(44,lxfs);
	ps.setString(45,email);
	ps.setString(46,cxhdbmxq);
	ps.setString(47,cxhdbmzh);
	ps.setString(48,yxtxdz);
	ps.setString(49,sshybm);
	ps.setString(50,gmyx);

	ps.setString(51,khjl);
	ps.setString(52,xxlysm);
	ps.setDate(53,jhctsj);
	ps.setDate(54,jhcxgtsj);
	ps.setDate(55,jhcsgtsj);
	ps.setDate(56,jhzbjsj);
	ps.setString(57,khzyxz);
	ps.setString(58,jiedao);
	ps.setString(59,djbbh);
	ps.setString(60,ywyssxz);

	ps.setString(61,xqlx);
	ps.setString(62,clpp);
	ps.setString(63,cph);
	ps.setString(64,czms);
	ps.setString(65,gnyq);
	ps.setString(66,hyzk);
	ps.setString(67,sfdkzx);
	ps.setString(68,hznl);
	ps.setString(69,lrtz);
	ps.setDate(70,yylfsj);

	ps.setDate(71,xclfsj);
	ps.setString(72,lrr);
	ps.setString(73,bz);
	ps.setString(74,zxzt);
	ps.setString(75,lfbz);
    ps.setDate(76,lfsj);
	ps.setString(77,ywybm);
	ps.setString(78,pdqybm);
	ps.setString(79,sfyckh);
	ps.setString(80,dianz);
	ps.setString(81,scbjl);
	ps.setString(82,hxmjbm);
	ps.setString(83,xxly);

	ps.executeUpdate();
	ps.close();

	//���ӣ��ͻ���ϵ��ʽ����������������������������ʼ
	ls_sql="delete from crm_khlxfs ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	java.util.StringTokenizer rowArray=new java.util.StringTokenizer(khlxfs,"*");
	int row=rowArray.countTokens();
	for (int i=0;i<row;i++ )
	{
		String rowStr=rowArray.nextToken();
		java.util.StringTokenizer colArray=new java.util.StringTokenizer(rowStr,"^");
		int col=colArray.countTokens();

		String lxr="";
		String lx="";
		String dhqh="";
		String qhdh="";
		String dhhm="";
		String fenji="";

		if (col>0)
		{
			lxr=colArray.nextToken();
		}
		if (col>1)
		{
			lx=colArray.nextToken();
		}
		if (col>2)
		{
			dhqh=colArray.nextToken();
		}
		if (col>3)
		{
			qhdh=colArray.nextToken();
		}
		if (col>4)
		{
			dhhm=colArray.nextToken();
		}
		if (col>5)
		{
			fenji=colArray.nextToken();
		}

		String getscbkhbh=null;
		String getywy=null;
		int scbsl=0;
		ls_sql="select scbkhbh,khxm,fwdz,lrr,lrsj,ywy";
		ls_sql+=" from  crm_scbkhxx";
		ls_sql+=" where ssfgs='"+ssfgs+"' and lxfs='"+dhhm+"' ";
		ls_sql+=" and zt in('1','3','5')";//1�����٣�2��ʧ�ܣ�3���ƽ���4���ѽ��գ�5��׼���ƽ���6��׼��ʧ�ܣ�7���ƽ�����
		ls_sql+=" and rownum<5";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getscbkhbh=cf.fillNull(rs.getString("scbkhbh"));
			getkhxm=cf.fillNull(rs.getString("khxm"));
			getfwdz=cf.fillNull(rs.getString("fwdz"));
			getlrr=cf.fillNull(rs.getString("lrr"));
			getlrsj=cf.fillNull(rs.getDate("lrsj"));
			getywy=cf.fillNull(rs.getString("ywy"));

			scbsl++;


			out.println("<P>����ʧ�ܣ��绰���г����ͻ�ռ�ã���"+getscbkhbh+"��"+getkhxm+"��"+getfwdz+"����"+lrr+"����"+getlrsj+"¼��");
		}
		rs.close();
		ps.close();

		if (scbsl>0)
		{
			conn.rollback();
			return;
		}

		ls_sql="insert into crm_khlxfs ( khbh,qhdh,lxr,dhhm,fj,dhqh,lx,bz ) ";
		ls_sql+=" values ( '"+khbh+"','"+qhdh+"','"+lxr+"','"+dhhm+"','"+fenji+"','"+dhqh+"','"+lx+"','' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	//���ӣ��ͻ���ϵ��ʽ������������������������������

	dzbj.Tzk tzk=new dzbj.Tzk();

	//���ݴ���������¿ͻ��ۿ�
	tzk.updateHdZkl(conn,khbh,"yz");

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ������ɿͻ����<<%=khbh%>>");
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