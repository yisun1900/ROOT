<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");

String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String rddqbm="";
String hxwzbm="";
String fwdz="";
String lxfs="";
String sjs="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";
double lrsjts=0;


double wdzgce=0;
double qye=0;
double glf=0;
double glfbfb=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double suijin=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm="";

double zjxzkl=0;
double spzkl=0;
String sfpzqtyh="";
String pzqtyhnr="";

String hth="";
String sfjczjz="";
String zklx="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String qtdh=null;
String email=null;
String ysshbz="";


String dzbjjc="";//1���˹�¼��[�ۿ��ʡ����̷ѣ���ǰ]������[�ۿ��ʡ����̷ѣ���ǰ]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ����̷ѣ���ǰ]������[ǩԼ����̷ѣ���ǰ]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ����̷ѣ���ǰ]�����Զ�����4�����������ӱ��ۣ�[���̷ѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[���̷ѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
String zxkhlrjc="";//ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����
int zxkhlrts=0;//��ѯ�ͻ���ǰ¼������

String shdzbjjc="";//1���˹�¼��[�ۿ��ʡ����̷ѣ���ǰ]������[�ۿ��ʡ����̷ѣ���ǰ]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ����̷ѣ���ǰ]������[ǩԼ����̷ѣ���ǰ]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ����̷ѣ���ǰ]�����Զ�����4�����������ӱ��ۣ�[���̷ѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[���̷ѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
String shzxkhlrjc="";//ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����

double sjjryjbfb=0;
double sjf=0;
double sssjf=0;


String lfbz=null;
String ctbz=null;

double zqqyze=0;
double zhqyze=0;



try {
	conn=cf.getConnection();


	ls_sql="select ysshbz,sjf,qtdh,email,cxhdbmxq,cxhdbmzh,dzbjjc,zxkhlrjc,zklx,sfjczjz,spzkl,zjxzkl,sfpzqtyh,pzqtyhnr,cxhdbm,shbz,SYSDATE-lrsj lrsjts,louhao,rddqbm,hxwzbm,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" ,lfbz,ctbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lfbz=cf.fillNull(rs.getString("lfbz"));
		ctbz=cf.fillNull(rs.getString("ctbz"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		sssjf=rs.getDouble("sjf");
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��
		shzxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));//������ѯ�ͻ�¼����

		zklx=cf.fillNull(rs.getString("zklx"));
		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		spzkl=rs.getDouble("spzkl");
		zjxzkl=rs.getDouble("zjxzkl");
		sfpzqtyh=cf.fillNull(rs.getString("sfpzqtyh"));
		pzqtyhnr=cf.fillNull(rs.getString("pzqtyhnr"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		lrsjts=rs.getDouble("lrsjts");
		louhao=cf.fillNull(rs.getString("louhao"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (louhao.equals(""))
	{
		out.println("���󣡡�¥�š�Ϊ�գ�������ѯ�ͻ����޸�");
		return;
	}

	if (khxm.indexOf("����")>0 || khxm.indexOf("С��")>0 || khxm.indexOf("Ůʿ")>0 || khxm.indexOf("����")>0 || khxm.indexOf("����")>0)
	{
		out.println("<BR>����[����]������ȫ�ƣ��磺����������С�㡢��Ůʿ�ȶ����淶");
		return;
	}

	if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
	{
		out.println("<BR>������������ȷ��[����]���м䲻��������ո�");
		return;
	}
	if (cf.isHanzi(fwdz)!=2 && cf.isHanzi(fwdz)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
	{
		out.println("<BR>������������ȷ��[���ݵ�ַ]���м䲻��������ո�");
		return;
	}
/*
	if (!lfbz.equals("Y"))//lf
	{
		out.println("����δ������������ǩ���Ǽ�");
		return;
	}
	if (!ctbz.equals("Y"))
	{
		out.println("����δ��ͼ��������ǩ���Ǽ�");
		return;
	}

	if (ysshbz.equals("M"))//N��δ��ˣ�Y�����ͨ����M�����δͨ��
	{
		out.println("����Ԥ�����δͨ����������ǩ���Ǽ�");
		return;
	}
*/
	if (spzkl==0)//��ͬ�ۿ���
	{
		spzkl=10;
	}
	if (zjxzkl==0)//�������ۿ���
	{
		zjxzkl=10;
	}

	if (sfpzqtyh.equals(""))//�Ƿ���׼�����Ż�
	{
		sfpzqtyh="N";
	}

	//�Դ��������飫����������������������������������ʼ
	if (!cxhdbm.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_cxhd,jc_cxhdsj";
		ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.fgsbh='"+ssfgs+"'";
		ls_sql+=" and jc_cxhd.jsbz='N' and jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.qdjssj>=TRUNC(SYSDATE)";
		ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>��˾�������"+cxhdbm+"���ѹ��ڣ�������ѯ��Ϣ������ѡ��");
			return;
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_cxhd,jc_cxhdsj";
		ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.fgsbh='"+ssfgs+"'";
		ls_sql+=" and jc_cxhd.jsbz='N' and jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.qdjssj>=TRUNC(SYSDATE)";
		ls_sql+=" and jc_cxhd.hdlx in('3') and jc_cxhd.cxhdmc='"+cxhdbmxq+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>С���������"+cxhdbmxq+"���ѹ��ڣ�������ѯ��Ϣ������ѡ��");
			return;
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_cxhd,jc_cxhdsj";
		ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm and jc_cxhd.fgsbh='"+ssfgs+"'";
		ls_sql+=" and jc_cxhd.jsbz='N' and jc_cxhdsj.kssj<=TRUNC(SYSDATE) and jc_cxhdsj.qdjssj>=TRUNC(SYSDATE)";
		ls_sql+=" and jc_cxhd.hdlx in('4') and jc_cxhd.cxhdmc='"+cxhdbmzh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>չ��������"+cxhdbmzh+"���ѹ��ڣ�������ѯ��Ϣ������ѡ��");
			return;
		}
	}

	//�Դ���������=============================����


	ls_sql="SELECT dqbm,dzbjjc,zxkhlrjc,zxkhlrts,sjjryjbfb";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));//������ѯ�ͻ�¼����
		zxkhlrts=rs.getInt("zxkhlrts");//��ѯ�ͻ���ǰ¼������

		sjjryjbfb=rs.getDouble("sjjryjbfb");//��ƿͻ�����ҵ���տ���� 

	}
	rs.close();
	ps.close();

	if (shbz.equals("Y"))//��Ϣ��˱�־
	{
		dzbjjc=shdzbjjc;
		zxkhlrjc=shzxkhlrjc;
	}

	
	//ȡ���ӱ������ݣ�������������������ʼ

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	wdzgce=dzbj.getBjje(conn,khbh,"yz");//��ȡ����ǰ�����ӱ��۽�ֱ�ӷѣ������շѣ���������������ǩԼ���Ŀ
	qye=dzbj.getZhBjje(conn,khbh,"sxyd");//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շѣ���������������ǩԼ���Ŀ

	suijinbfb=dzbj.getSuijinBfb(conn,khbh,"yz");//˰��ٷֱ�
	suijin=dzbj.getZhSuijinJe(conn,khbh,"yz");//��ȡ�ۺ�˰���

	glfbfb=dzbj.getGlfBl(conn,khbh,"yz");//����Ѱٷֱ�
	zqguanlif=dzbj.getZqGlfJe(conn,khbh,"yz");//����ǰ�������
	guanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//��ȡ�ۺ󡺹���ѽ�

	zqwjrqyexm=dzbj.getZqWjrJe(conn,khbh,"yz");//��ȡ��ǰ�������շ���Ŀ����������˰�𡢹���ѡ���Ʒ�
	zhwjrqyexm=dzbj.getZhWjrJe(conn,khbh,"yz");//��ȡ�ۺ������շ���Ŀ����������˰�𡢹���ѡ���Ʒ�
	wjrqyexmsm=dzbj.getWjrJeMc(conn,khbh,"yz");//��ȡ�������շ���Ŀ���ơ���������˰�𡢹���ѡ���Ʒ�

	sjf=dzbj.getZhSjf(conn,khbh,"yz");//��ȡ�ۺ���Ʒѡ�

	//ȡ���ӱ�������===============����

	zqqyze=wdzgce+zqguanlif+suijin+zqwjrqyexm;
	zqqyze=cf.round(zqqyze,2);
	zhqyze=qye+guanlif+suijin+zhwjrqyexm;
	zhqyze=cf.round(zhqyze,2);


	//4:���������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
	//5:���������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
	if (dzbjjc.equals("4") || dzbjjc.equals("5"))
	{
		if (wdzgce<=0)
		{
			out.println("<BR>���󣡲������ӱ��ۣ����ܽ���ǩ���Ǽǣ�");
			return;
		}

/*
		//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���5������ѡ��Ŀ��6����鲻������Ŀ
		String retStr=dzbj.checkBjjb(conn,khbh,9);
		if (!retStr.equals("0"))
		{
			out.println(retStr);
			out.println("<P>�ͻ����ӱ��ۼ�����");
//			return;
		}

		int bxx=dzbj.getBxxm(conn,khbh,"yz");
		if (bxx!=9999)
		{
			%>
			<SCRIPT language=javascript >
			<!--
			alert("���ѣ�˰��ȱ�ѡ��Ŀû��ѡ��<%=bxx%>");
			//-->
			</SCRIPT>
			<%
			//return;//lf��Ҫ
		}
*/
	}

	//������ѯ�ͻ�¼����
	if (zxkhlrjc.equals("Y") && !shbz.equals("Y"))//N�������ã�Y������
	{
		if (lrsjts<zxkhlrts )
		{
			out.println("���󣡸ÿͻ�������["+lrsjts+"]��ǰ¼�룬������ǰ["+zxkhlrts+"]��¼�룬����ֻ�ܾ�����ˣ�����ǩ���Ǽǣ�");
			return;
		}
	}

	

	//ȡ��ͬ��
	String year=cf.today("YY")+cf.today("MM");
//	String year=cf.today("YY");//HG

	ls_sql="select hth";
	ls_sql+=" from  crm_hthxx";
//	ls_sql+=" where dwbh='"+zxdm+"' and sybz='N' and substr(hth,4,4)='"+year+"'";//Y����ʹ�ã�N��δʹ��
	ls_sql+=" where dwbh='"+zxdm+"' and sybz='N' and substr(hth,1,4)='"+year+"'";//Y����ʹ�ã�N��δʹ�ã�YZF
//	ls_sql+=" where dwbh='"+zxdm+"' and sybz='N' and substr(hth,11,2)='"+year+"'";//Y����ʹ�ã�N��δʹ��,HG
	ls_sql+=" order by hth";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString(1);
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
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
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center"> 
    <p>��¼��ͻ���Ϣ��<font color="#FF0033">*</font>Ϊ�����ֶΣ����ͻ���ţ�<%=khbh%>��</p>
    <p><strong><font color="#FF0000">ע�⣺ϵͳ����˵�����£�</font></strong></p>
    <p><font color="#FF0000"><strong>1������ǩԼ���ֱ��Ϊ�����֣�����ֱ�ӷѡ�����ѡ�˰�𣬼�������ǩԼ��=����ֱ�ӷ�+�����+˰��</strong></font></p>
    <p><strong><font color="#FF0000">2�����̼�������Ѽ���˰���������Ĩ��ʹ�ã��磺����ֱ�ӷ�=10000.36�����̼����=0.36��Ĩ��󹤳�ֱ�ӷ�=10000</font></strong></p>
    <p><strong><font color="#FF0000">3�������ͬ��ţ���д������ȡ�Ŀհ׺�ͬ���</font></strong></p>
    <p><strong><font color="#FF0000">4���Ե���ҵ��û��Ӱ�죬��Ҳ��õ��ģ��µ�ҵ��=����ֱ�ӷ�+�����+˰��</font></strong></p>
    <p><strong><font color="#FF0000">5������ֱ�ӷѲ�������ѡ�˰��</font></strong></p>
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ͬ��</td>
      <td width="34%"> 
        <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyGo(smhtbh)">
      </td>
      <td width="19%" align="right">�����ͬ���</td>
      <td width="31%"><input type="text" name="smhtbh" value="" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="34%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>
      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>�Ա�      </td>
      <td width="31%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        �� 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        Ů </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ֻ�</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">���ڽ��ն��ţ����¼һ��,�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����绰</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(ע�⣺�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ʼ�</td>
      <td width="34%"> 
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
      <td width="19%" align="right">ҵ�����֤����</td>
      <td width="31%"> 
        <input type="text" name="sfzhm" value="" size="20" maxlength="18" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"> 
        <font color="#FF0033">*</font><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"> 
		<input type="hidden" name="cqbm" value="<%=cqbm%>" >
		<input type="hidden" name="xqbm" value="<%=xqbm%>" >
		<input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="76" maxlength="100" readonly>
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ȵ����</td>
      <td width="34%"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">��������λ��</td>
      <td width="31%"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm",hxwzbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��������</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">ְҵ</td>
      <td width="31%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">������</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">����</td>
      <td width="31%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">���ʦ</font>      </td>
      <td width="34%"> 
        <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
      </td>
      <td width="19%" align="right"> 
        <font color="#0000FF">ҵ��Ա</font>      </td>
      <td width="31%"> 
        <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>�������      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
        <input type="hidden" name="pmjj" value="" >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���ۼ���</td>
      <td width="31%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <%
	if (dzbjjc.equals("1"))//1���˹�¼��[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]������[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]�Զ�����[ǩԼ��]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷ�ԭ����</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѼ����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷ�ǩԼ��</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ǰ�������</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ󣭹����</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("2"))//2���˹�¼��[ǩԼ�����ֱ�ӷѣ���ǰ]������[ǩԼ�����ֱ�ӷѣ���ǰ]�Զ�����[�ۿ���]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ��ۺ�</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ǰ�������</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ�ܣ����</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("3"))//3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ֱ�ӷѣ���ǰ]�����Զ�����
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%"><input type="hidden" name="cdzwjmje" value="0" size="20" maxlength="16"  >
      <input name="glfjmje2" type="hidden"  value="0" size="20" maxlength="16" >
      <input name="sjjmje2" type="hidden"  value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ��ۺ�</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ǰ�������</td>
      <td width="34%">
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�ۺ󣭹����</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>˰��</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>�����շѣ��ۺ�</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("6"))//6:ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]���Զ��������
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ��ۺ�</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ǰ�������</td>
      <td width="34%">
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�ۺ󣭹����</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>˰��</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>�����շѣ��ۺ�</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("4"))//4�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�Ƿ����Ż�</font></td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh,true);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�Ż�����</font></td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�������ۿ�</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
      <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�����շ���Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("7"))//7�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ����޸������Ż�
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%">
		<%
			cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
		%>	  </td> 
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�������ۿ�</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
      <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�����շ���Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("5"))//5�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=spzkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="0" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
% </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ǰ�������</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ󣭹����</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="0" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�����շ���Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else{
		out.println("�����õ��ӱ��ۼ�须����"+dzbjjc);
		return;
	}
%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��Ʒ�</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="<%=sjf%>" size="20" maxlength="16"  onKeyUp="keyGo(glf)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�����</td>
      <td width="31%"> 
        <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">
        <input type="hidden" name="hbqye" value="0" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ�ȯ</td>
      <td width="34%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        �� 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])">
        �� </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ȯ�ܽ��</td>
      <td width="34%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">
      </td>
      <td width="19%" align="right">��˾�е������</td>
      <td width="31%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ�����֤</td>
      <td width="34%"> 
        <input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
        �� 
        <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])">
        �� </td>
      <td width="19%" align="right">��֤�г�</td>
      <td width="31%"> 
        <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�μӹ�˾�����</font></td>
      <td colspan="3"> 
        <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="76" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">�μ�С�������</font></td>
      <td colspan="3"> 
        <input type="text" name="cxhdbmxq" value="<%=cxhdbmxq%>" size="76" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�μ�չ������</font></td>
      <td colspan="3"> 
        <input type="text" name="cxhdbmzh" value="<%=cxhdbmzh%>" size="76" maxlength="50" readonly>
      </td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��װ��־</td>
      <td width="34%"><%
	cf.radioToken(out, "jzbz","1+��װ&2+��װ",jzbz);
%></td>
      <td rowspan="5" align="right" width="19%"><font color="#FF0033">*</font>��Ϣ��Դ 
      </td>
      <td rowspan="5" width="31%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(jyjdrq)" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����</td>
      <td width="34%"> 
        <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>���</td>
      <td width="34%"> 
        <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ɫ</td>
      <td width="34%"> 
        <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(czbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">����</td>
      <td width="34%"> 
        <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xxlybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
        </select>
      </td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">����ʱ��</td>
      <td width="34%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        ��ȷ�� 
        <input type="radio" name="kgsjqd" value="N">
        δȷ��</td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��������</td>
      <td width="31%">
      <input type="text" name="gqts" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>���齻������</td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>ǩԼ����</td>
      <td width="31%"> 
        <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ͬ��������</td>
      <td width="34%"> 
        <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��ͬ��������</td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ص���־</td>
      <td width="34%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz);
%> 
        </select>      </td>
      <td width="19%" align="right">�ص���</td>
      <td width="31%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ص����ضӳ�</td>
      <td><input type="text" name="hdsgd" value="" size="20" maxlength="20"  ></td>
      <td align="right">�ص����ذ೤</td>
      <td><input type="text" name="hdsgbz" value="" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�ص�����</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="76" maxlength="100" onKeyUp="keyGo(bz)" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">ˮ�ʷ���������</td>
      <td width="34%"> 
        <input type="radio" name="sffk" value="Y">
        ���� 
        <input name="sffk" type="radio" value="N" checked>
        δ���� </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</td>
      <td width="31%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">��ͨ�ͻ�</option>");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ǽǿ���</td>
      <td width="34%"> 
        <input type="text" name="djkh" value="" size="20" maxlength="20" >      </td>
      <td width="19%" align="right">��������</td>
      <td width="31%"> 
        <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">ǩԼ����</font></td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
        </select>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font>      </td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font>     </td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        ��ע      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
        <input type="button"  value="���ӱ��۴�ӡԤ��" onClick="f_ck(insertform)" name="ck" >
        <input type="hidden" name="sfcjq" value="1" >
        <input type="hidden" name="sffby" value="1" >
        <input type="hidden" name="hyklxbm" value="" >
        <input type="hidden" name="hykh" value="" >
        <input type="hidden" name="yxsjs" value="" >
        <input type="hidden" name="yxsjz" value="" >
        <input type="hidden" name="sjsbh" value=""  >
      <input type="hidden" name="dzbjjc" value="<%=dzbjjc%>"></td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	<%
	if (dzbjjc.equals("1"))//1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]
	{
		%>
		var yqye=FormName.wdzgce.value/10.0*FormName.zkl.value;
		yqye=round(yqye,2);

		var qye=yqye-FormName.cdzwjmje.value;
		qye=round(qye,2);
		FormName.qye.value=qye;


		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  
		
		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      


		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		
		<%
	}
	else if (dzbjjc.equals("2"))//2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]
	{
		%>
		var yqye=FormName.qye.value*1.0+FormName.cdzwjmje.value*1.0;
		var zkl=yqye*10.0/FormName.wdzgce.value;
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;

		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     

		<%
	}
	else if (dzbjjc.equals("3"))//3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����
	{
		%>
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("6"))//6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����] �����Զ����㣬��¼����
	{
		%>
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("4"))//4�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
	{
		%>
		var qye=<%=qye%>-FormName.cdzwjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var guanlif=<%=guanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		var suijin=<%=suijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("7"))//7�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ����޸������Ż�
	{
		%>
		var qye=<%=qye%>-FormName.cdzwjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var guanlif=<%=guanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		var suijin=<%=suijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("5"))//5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
	{
		%>
		var yqye=FormName.wdzgce.value/10.0*FormName.zkl.value;
		yqye=round(yqye,2);

		var qye=yqye-FormName.cdzwjmje.value;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     

		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    

function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);


	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
	//if(	javaTrim(FormName.smhtbh)=="") {
		//alert("������[�����ͬ���]��");
		//FormName.smhtbh.focus();
		//return false;
	//}
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("��ѡ��[���ۼ���]��");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("������[���ۼ���]��");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("������[�ֻ�]��[�����绰]��");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "�ֻ�"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "�����绰"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��/�ֵ�]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("������[¥��/���ƺ�]��");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		//if(	javaTrim(FormName.sfzhm)=="") {
			//alert("������[���֤����]��");
			//FormName.sfzhm.focus();
			//return false;
		//}
		//if(!(isSfzhm(FormName.sfzhm, "���֤����"))) {
			//return false;
		//}
	

		if(	!radioChecked(FormName.sffk)) {
			alert("��ѡ��[ˮ�ʷ������Ƿ񷢷�]��");
			FormName.sffk[0].focus();
			return false;
		}
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("������[�Ǽǿ���]��");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("������[��������]��");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "��������"))) {
				return false;
			}
		}
		else{
			FormName.djkh.value="";
			FormName.fkrq.value="";
		}
		<%
	}
%>
	
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	!selectChecked(FormName.xxlybm)) {
		alert("������[��Ϣ��Դ]��");
		FormName.xxlybm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("������[������]��");
		FormName.fgflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hbqye)=="") {
		alert("������[������ĿǩԼ��]��");
		FormName.hbqye.focus();
		return false;
	}
	if(!(isFloat(FormName.hbqye, "������ĿǩԼ��"))) {
		return false;
	}
	if (FormName.sfcjq.value=="2" || FormName.sffby.value=="2")
	{
		if (FormName.hbqye.value=="0")
		{
			alert("������[������ĿǩԼ��]��");
			FormName.hbqye.select();
			return false;
		}
	}
	else{
		FormName.hbqye.value="0";
	}

	if(	javaTrim(FormName.ysbm)=="") {
		alert("������[��ɫ]��");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[���]����Ϊ0��");
		FormName.fwmj.select();
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}

	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("������[�Ż�����]��");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhyy)!="") {
			alert("��ѡ�������Ż�,��ɾ��[�Ż�����]��");
			FormName.yhyy.select();
			return false;
		}
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ֱ�ӷѣ���ǰ]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ֱ�ӷѣ���ǰ"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[����ֱ�ӷѣ���ǰ]����Ϊ0��");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[����ֱ�ӷѣ���ǰ]����С��[����ֱ�ӷѣ��ۺ�]��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ֱ�ӷѣ��ۺ�]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ֱ�ӷѣ��ۺ�"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[����ֱ�ӷѣ��ۺ�]����Ϊ0��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[��ͬ�ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "��ͬ�ۿ���"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[��ͬ�ۿ���]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}
	if(	javaTrim(FormName.zjxzkl)=="") {
		alert("������[�������ۿ���]��");
		FormName.zjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "�������ۿ���"))) {
		return false;
	}
	if (FormName.zjxzkl.value<0 || FormName.zjxzkl.value>10)
	{
		alert("����[�������ۿ���]Ӧ����0��10֮�䣡");
		FormName.zjxzkl.select();
		return false;
	}


	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("������[���̼����]��");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "���̼����"))) {
		return false;
	}
/*
	if (FormName.cdzwjmje.value<0 || FormName.cdzwjmje.value>100)
	{
		alert("����[���̼����]Ӧ����0��100֮�䣡");
		FormName.cdzwjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("������[����Ѽ����]��");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "����Ѽ����"))) {
		return false;
	}
/*
	if (FormName.glfjmje.value<0 || FormName.glfjmje.value>100)
	{
		alert("����[����Ѽ����]Ӧ����0��100֮�䣡");
		FormName.glfjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("������[˰������]��");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "˰������"))) {
		return false;
	}

/*	
	if (FormName.sjjmje.value<0 || FormName.sjjmje.value>100)
	{
		alert("����[˰������]Ӧ����0��100֮�䣡");
		FormName.sjjmje.select();
		return false;
	}
*/

	
	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("������[˰��ٷֱ�]��");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "˰��ٷֱ�"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("����[˰��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("������[˰��]��");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[�����]��");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "�����"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("������[����Ѱٷֱ�]��");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "����Ѱٷֱ�"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("����[����Ѱٷֱ�]Ӧ����0��100֮�䣡");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("������[��ǰ�����]��");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "��ǰ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("������[�ۺ�����]��");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "�ۺ�����"))) {
		return false;
	}


	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("������[��ǰ�����շѣ���ǰ]��");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "��ǰ�����շѣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("������[�ۺ������շѣ���ǰ]��");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "�ۺ������շѣ���ǰ"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("������[�����շ���Ŀ]��");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("������[ÿƽ�׾���]��");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "ÿƽ�׾���"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("��ѡ��[�Ƿ�ȯ]��");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("������[�����ܽ��]��");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "�����ܽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("������[��˾�е������]��");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "��˾�е������"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[�����ܽ��]����С��[��˾�е������]��");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("��ѡ��[�Ƿ�����֤]��");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("������[��֤�г�]��");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[ǩԼ����]���ܴ���[����]��");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("������[���齻������]��");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "��ͬ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "��ͬ��������"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[���齻������]Ӧ����[ǩԼ����]��");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[���齻������]��");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[���齻������]��");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";
		FormName.hdsgd.value="";
		FormName.hdsgbz.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
		FormName.hdsgd.disabled=true;
		FormName.hdsgbz.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("������[�ص�װ�޵�ַ]��");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("������[�ص����ضӳ�]��");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("������[�ص����ذ೤]��");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "��Ա��Чʱ��ʼ"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "��Ա��Чʱ��ֹ"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}

	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("����Ʒѡ�¼�����ʵ����Ʒѡ�<%=sssjf%>��δ�ﵽ��˾ʵ�ձ�׼��<%=sjjryjbfb%>��%�涨");
		FormName.sjf.select();
		return false;
	}

	if(	javaTrim(FormName.gqts)=="") {
		alert("��ѡ��[��������]��");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "��������"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_khxx.jsp";
	FormName.submit();

	return true;
}

function f_ck(FormName)//����FormName:Form������
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
 
</CENTER>
</body>
</html>



 
</CENTER>
</body>
</html>


