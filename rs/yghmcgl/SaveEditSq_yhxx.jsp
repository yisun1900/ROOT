<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bianhao=null;
String yhmc=null;
String xb=null;
java.sql.Date csrq=null;
String sfzszg=null;
String mz=null;
long sg=0;
long tz=0;
String xx=null;
String hf=null;
String zzmm=null;
String sjsjb=null;
String zcmc=null;
String zyzzzs=null;
String xlbm=null;
String zy=null;
java.sql.Date cjgzsj=null;
String xuewei=null;
String byyx=null;
String zz=null;
String yzbm=null;
String dh=null;
String bgdh=null;
String jtdh=null;
String email=null;
String sfzh=null;
String sfzdz=null;
long gznx=0;
String jjlxr=null;
String jjlxrdz=null;
String lxrdh=null;
String xzzwbm=null;
String sfytj=null;
java.sql.Date tjrq=null;
String sfqs=null;
String dhsfgb=null;
String zwpj=null;
String ssfgs=null;
String dwbh=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String sfydbs=null;
String qgzdw=null;
double wgzsj=0;
java.sql.Date syjzrq=null;
long kqhm=0;

String sjsbh=null;
long rzcs=0;
java.sql.Date rzsj=null;
java.sql.Date gqpxkssj=null;
java.sql.Date gqpxjssj=null;
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
xb=cf.GB2Uni(request.getParameter("xb"));
ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����csrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
sfzszg=cf.GB2Uni(request.getParameter("sfzszg"));
mz=cf.GB2Uni(request.getParameter("mz"));
ls=request.getParameter("sg");
try{
	if (!(ls.equals("")))  sg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sg������");
	return;
}
catch (Exception e){
	out.println("<BR>[���(cm)]����ת����������:"+e);
	return;
}
ls=request.getParameter("tz");
try{
	if (!(ls.equals("")))  tz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tz������");
	return;
}
catch (Exception e){
	out.println("<BR>[����(KG)]����ת����������:"+e);
	return;
}
xx=cf.GB2Uni(request.getParameter("xx"));
hf=cf.GB2Uni(request.getParameter("hf"));
zzmm=cf.GB2Uni(request.getParameter("zzmm"));
sjsjb=cf.GB2Uni(request.getParameter("sjsjb"));
zcmc=cf.GB2Uni(request.getParameter("zcmc"));
zyzzzs=cf.GB2Uni(request.getParameter("zyzzzs"));
xlbm=cf.GB2Uni(request.getParameter("xlbm"));
zy=cf.GB2Uni(request.getParameter("zy"));
ls=request.getParameter("cjgzsj");
try{
	if (!(ls.equals("")))  cjgzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjgzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ҵʱ��]����ת����������:"+e);
	return;
}
xuewei=cf.GB2Uni(request.getParameter("xuewei"));
byyx=cf.GB2Uni(request.getParameter("byyx"));
zz=cf.GB2Uni(request.getParameter("zz"));
yzbm=cf.GB2Uni(request.getParameter("yzbm"));
dh=cf.GB2Uni(request.getParameter("dh"));
bgdh=cf.GB2Uni(request.getParameter("bgdh"));
jtdh=cf.GB2Uni(request.getParameter("jtdh"));
email=cf.GB2Uni(request.getParameter("email"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
sfzdz=cf.GB2Uni(request.getParameter("sfzdz"));
ls=request.getParameter("gznx");
try{
	if (!(ls.equals("")))  gznx=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gznx������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));
lxrdh=cf.GB2Uni(request.getParameter("lxrdh"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
sfytj=cf.GB2Uni(request.getParameter("sfytj"));
ls=request.getParameter("tjrq");
try{
	if (!(ls.equals("")))  tjrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
sfqs=cf.GB2Uni(request.getParameter("sfqs"));
dhsfgb=cf.GB2Uni(request.getParameter("dhsfgb"));
zwpj=cf.GB2Uni(request.getParameter("zwpj"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
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
sfydbs=cf.GB2Uni(request.getParameter("sfydbs"));
qgzdw=cf.GB2Uni(request.getParameter("qgzdw"));
ls=request.getParameter("wgzsj");
try{
	if (!(ls.equals("")))  wgzsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wgzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ����ʱ��(��)]����ת����������:"+e);
	return;
}
ls=request.getParameter("syjzrq");
try{
	if (!(ls.equals("")))  syjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����syjzrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ý�������]����ת����������:"+e);
	return;
}

ls=request.getParameter("kqhm");
try{
	if (!(ls.equals("")))  kqhm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kqhm������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ں���]����ת����������:"+e);
	return;
}
sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
ls=request.getParameter("rzcs");
try{
	if (!(ls.equals("")))  rzcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rzcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ְ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ְ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gqpxkssj");
try{
	if (!(ls.equals("")))  gqpxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gqpxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ѵ��ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gqpxjssj");
try{
	if (!(ls.equals("")))  gqpxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gqpxjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ѵ����ʱ��]����ת����������:"+e);
	return;
}

String hjszd=null;
String dacfd=null;
java.sql.Date dazrsj=null;
java.sql.Date dazcsj=null;
String dazchc=null;
String dabgfjs=null;
hjszd=cf.GB2Uni(request.getParameter("hjszd"));
dacfd=cf.GB2Uni(request.getParameter("dacfd"));
ls=request.getParameter("dazrsj");
try{
	if (!(ls.equals("")))  dazrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dazrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ת��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dazcsj");
try{
	if (!(ls.equals("")))  dazcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dazcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ת��ʱ��]����ת����������:"+e);
	return;
}
dazchc=cf.GB2Uni(request.getParameter("dazchc"));
dabgfjs=cf.GB2Uni(request.getParameter("dabgfjs"));

int xuhao=0;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xuhao������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}



String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jcyhmc=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh!='"+whereygbh+"' and bianhao='"+bianhao+"' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jcyhmc=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (jcyhmc!=null)
	{
		out.println("���󣡸�[����]�ѱ���"+jcyhmc+"��ʹ��");
		return;
	}

	jcyhmc=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh!='"+whereygbh+"' and sfzh='"+sfzh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jcyhmc=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (jcyhmc!=null)
	{
		out.println("���󣡸�[���֤��]�ѱ���"+jcyhmc+"��ʹ��");
		return;
	}

	String zwbm=null;
	ls_sql="select gzbm";
	ls_sql+=" from  dm_xzzwbm";
	ls_sql+=" where xzzwmc='"+xzzwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zwbm=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (zwbm==null)
	{
		out.println("���󣡹��ֲ����ڣ�"+ls_sql);
		return;
	}

	String sjszdgh="";//���ʦ��������ѯ�ͻ��Զ�����
	String sjszdjz="";//���ʦ�������Զ���ְ
	String ywyzdgh="";//ҵ��Ա��������ѯ�ͻ��Զ�����
	String khjlzdgh="";//�ͻ�����������ѯ�ͻ��Զ�����
	String khjlzdjz="";//�ͻ����������Զ���ְ
	ls_sql="select sjszdgh,ywyzdgh,sjszdjz,khjlzdgh,khjlzdjz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjszdgh=cf.fillNull(rs.getString("sjszdgh"));
		ywyzdgh=cf.fillNull(rs.getString("ywyzdgh"));
		sjszdjz=cf.fillNull(rs.getString("sjszdjz"));
		khjlzdgh=cf.fillNull(rs.getString("khjlzdgh"));
		khjlzdjz=cf.fillNull(rs.getString("khjlzdjz"));
	}
	rs.close();
	ps.close();

	String ydwbh="";
	String yssfgs="";
	String ysjsbh="";
	ls_sql="select dwbh,ssfgs,sjsbh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ydwbh=rs.getString("dwbh");
		yssfgs=rs.getString("ssfgs");
		ysjsbh=cf.fillNull(rs.getString("sjsbh"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update sq_yhxx set bianhao=?,yhmc=?,xb=?,csrq=?,sfzszg=?,mz=?,sg=?,tz=?,xx=?,hf=?";
	ls_sql+=" ,zzmm=?,sjsjb=?,zcmc=?,zyzzzs=?,xlbm=?,zy=?,cjgzsj=?,xuewei=?,byyx=?,zz=?";
	ls_sql+=" ,yzbm=?,dh=?,bgdh=?,jtdh=?,email=?,sfzh=?,sfzdz=?,gznx=?,jjlxr=?,jjlxrdz=?";
	ls_sql+=" ,lxrdh=?,zwbm=?,xzzwbm=?,sfytj=?,tjrq=?,sfqs=?,dhsfgb=?,zwpj=?,ssfgs=?,dwbh=?";
	ls_sql+=" ,lrr=?,lrsj=?,bz=?,sfydbs=?,qgzdw=?,wgzsj=?,syjzrq=?,kqhm=?,sjsbh=?,rzcs=?";
	ls_sql+=" ,rzsj=?,gqpxkssj=?,gqpxjssj=?,hjszd=?,dacfd=?,dazrsj=?,dazcsj=?,dazchc=?,dabgfjs=?,xuhao=? ";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bianhao);
	ps.setString(2,yhmc);
	ps.setString(3,xb);
	ps.setDate(4,csrq);
	ps.setString(5,sfzszg);
	ps.setString(6,mz);
	ps.setLong(7,sg);
	ps.setLong(8,tz);
	ps.setString(9,xx);
	ps.setString(10,hf);

	ps.setString(11,zzmm);
	ps.setString(12,sjsjb);
	ps.setString(13,zcmc);
	ps.setString(14,zyzzzs);
	ps.setString(15,xlbm);
	ps.setString(16,zy);
	ps.setDate(17,cjgzsj);
	ps.setString(18,xuewei);
	ps.setString(19,byyx);
	ps.setString(20,zz);

	ps.setString(21,yzbm);
	ps.setString(22,dh);
	ps.setString(23,bgdh);
	ps.setString(24,jtdh);
	ps.setString(25,email);
	ps.setString(26,sfzh);
	ps.setString(27,sfzdz);
	ps.setLong(28,gznx);
	ps.setString(29,jjlxr);
	ps.setString(30,jjlxrdz);

	ps.setString(31,lxrdh);
	ps.setString(32,zwbm);
	ps.setString(33,xzzwbm);
	ps.setString(34,sfytj);
	ps.setDate(35,tjrq);
	ps.setString(36,sfqs);
	ps.setString(37,dhsfgb);
	ps.setString(38,zwpj);
	ps.setString(39,ssfgs);
	ps.setString(40,dwbh);

	ps.setString(41,lrr);
	ps.setDate(42,lrsj);
	ps.setString(43,bz);
	ps.setString(44,sfydbs);
	ps.setString(45,qgzdw);
	ps.setDouble(46,wgzsj);
	ps.setDate(47,syjzrq);
	ps.setLong(48,kqhm);
	ps.setString(49,sjsbh);
	ps.setLong(50,rzcs);

	ps.setDate(51,rzsj);
	ps.setDate(52,gqpxkssj);
	ps.setDate(53,gqpxjssj);
	ps.setString(54,hjszd);
	ps.setString(55,dacfd);
	ps.setDate(56,dazrsj);
	ps.setDate(57,dazcsj);
	ps.setString(58,dazchc);
	ps.setString(59,dabgfjs);
	ps.setInt(60,xuhao);
	ps.executeUpdate();
	ps.close();

	if (zwbm.equals("04"))//04:��װ���ʦ
	{
		if ((!ydwbh.equals(dwbh) || !ysjsbh.equals(sjsbh)) && yssfgs.equals(ssfgs))//������
		{

			if (sjszdgh.equals("Y"))//���ʦ��������ѯ�ͻ��Զ�����
			{
				ls_sql="update crm_zxkhxx set zxdm=?,sjsbh=? ";
				ls_sql+=" where zxdm='"+ydwbh+"' and sjs='"+yhmc+"'";
				ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dwbh);
				ps.setString(2,sjsbh);
				ps.executeUpdate();
				ps.close();
			}
		}


		if (!ydwbh.equals(dwbh) && yssfgs.equals(ssfgs))//������
		{
			if (sjszdjz.equals("Y"))//���ʦ�������Զ���ְ
			{
				ls_sql="delete from sq_sqbm";
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
				ls_sql+=" values('"+dwbh+"','"+whereygbh+"','"+ssfgs+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
				ls_sql+=" values('"+ydwbh+"','"+whereygbh+"','"+ssfgs+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update sq_yhxx set kfgssq='4'";//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="delete from sq_sqbm";
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
				ls_sql+=" values('"+dwbh+"','"+whereygbh+"','"+ssfgs+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update sq_yhxx set kfgssq='3'";//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
	}
	else if (zwbm.equals("03"))//03:�ͻ�����
	{
		if (!ydwbh.equals(dwbh) && yssfgs.equals(ssfgs))//������
		{

			if (khjlzdgh.equals("Y"))//�ͻ�����������ѯ�ͻ��Զ�����
			{
				ls_sql="update crm_zxkhxx set zxdm=? ";
				ls_sql+=" where zxdm='"+ydwbh+"' and khjl='"+yhmc+"'";
				ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dwbh);
				ps.executeUpdate();
				ps.close();
			}
		}


		if (!ydwbh.equals(dwbh) && yssfgs.equals(ssfgs))//������
		{
			if (khjlzdjz.equals("Y"))//�ͻ����������Զ���ְ
			{
				ls_sql="delete from sq_sqbm";
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
				ls_sql+=" values('"+dwbh+"','"+whereygbh+"','"+ssfgs+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
				ls_sql+=" values('"+ydwbh+"','"+whereygbh+"','"+ssfgs+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update sq_yhxx set kfgssq='4'";//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="delete from sq_sqbm";
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
				ls_sql+=" values('"+dwbh+"','"+whereygbh+"','"+ssfgs+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update sq_yhxx set kfgssq='3'";//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
				ls_sql+=" where ygbh="+whereygbh;
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
	}
	else if (zwbm.equals("19"))//19:ҵ��Ա
	{
		if ((!ydwbh.equals(dwbh) || !ysjsbh.equals(sjsbh)) && yssfgs.equals(ssfgs))//������
		{
			if (ywyzdgh.equals("Y"))//ҵ��Ա��������ѯ�ͻ��Զ�����
			{
				ls_sql="update crm_zxkhxx set ywybm=?,ywyssxz=? ";
				ls_sql+=" where ywybm='"+ydwbh+"' and ywy='"+yhmc+"'";
				ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dwbh);
				ps.setString(2,sjsbh);
				ps.executeUpdate();
				ps.close();
			}
		}
	}

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