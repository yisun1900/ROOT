<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}

	String gdm_gdjcjl_xjr=null;
	String gdm_gdjcjl_xjsj=null;
	String gdm_gdjcjl_xxlybm=null;
	String gdm_gdjcjl_jclxbm=null;
	String gdm_gdjcjl_jcjgbm=null;
	String gdm_gdjcjl_jcwtflbm=null;
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj>=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj2");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj<=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xxlybm=request.getParameter("gdm_gdjcjl_xxlybm");
	if (gdm_gdjcjl_xxlybm!=null)
	{
		gdm_gdjcjl_xxlybm=cf.GB2Uni(gdm_gdjcjl_xxlybm);
		if (!(gdm_gdjcjl_xxlybm.equals("")))	wheresql+=" and  (gdm_gdjcjl.xxlybm='"+gdm_gdjcjl_xxlybm+"')";
	}
	gdm_gdjcjl_jclxbm=request.getParameter("gdm_gdjcjl_jclxbm");
	if (gdm_gdjcjl_jclxbm!=null)
	{
		gdm_gdjcjl_jclxbm=cf.GB2Uni(gdm_gdjcjl_jclxbm);
		if (!(gdm_gdjcjl_jclxbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jclxbm='"+gdm_gdjcjl_jclxbm+"')";
	}
	gdm_gdjcjl_jcjgbm=request.getParameter("gdm_gdjcjl_jcjgbm");
	if (gdm_gdjcjl_jcjgbm!=null)
	{
		gdm_gdjcjl_jcjgbm=cf.GB2Uni(gdm_gdjcjl_jcjgbm);
		if (!(gdm_gdjcjl_jcjgbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjgbm='"+gdm_gdjcjl_jcjgbm+"')";
	}
	gdm_gdjcjl_jcwtflbm=request.getParameter("gdm_gdjcjl_jcwtflbm");
	if (gdm_gdjcjl_jcwtflbm!=null)
	{
		gdm_gdjcjl_jcwtflbm=cf.GB2Uni(gdm_gdjcjl_jcwtflbm);
		if (!(gdm_gdjcjl_jcwtflbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcwtflbm='"+gdm_gdjcjl_jcwtflbm+"')";
	}


	String gdm_gdjcjl_lrr=null;
	String gdm_gdjcjl_lrsj=null;
	gdm_gdjcjl_lrr=request.getParameter("gdm_gdjcjl_lrr");
	if (gdm_gdjcjl_lrr!=null)
	{
		gdm_gdjcjl_lrr=cf.GB2Uni(gdm_gdjcjl_lrr);
		if (!(gdm_gdjcjl_lrr.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrr='"+gdm_gdjcjl_lrr+"')";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj>=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj2");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj<=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	String clsj=null;
	clsj=request.getParameter("clsj");
	if (clsj!=null)
	{
		clsj=cf.GB2Uni(clsj);
		if (!(clsj.equals("")))	wheresql+="  and (gdm_zgcljl.clsj>=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}
	clsj=request.getParameter("clsj2");
	if (clsj!=null)
	{
		clsj=cf.GB2Uni(clsj);
		if (!(clsj.equals("")))	wheresql+="  and (gdm_zgcljl.clsj<=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT gdm_zgcljl.cljlh,gdm_zgcljl.clr,gdm_zgcljl.clsj,gdm_zgcljl.clqk,gdm_gdjcjl.jcjlh ";
	ls_sql+=" ,DECODE(gdm_gdjcjl.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as clzt ";
	ls_sql+=" ,khxm,fwdz,xxlymc,jclxmc,jcjgmc,jcwtflmc,gdm_gdjcjl.fkze,sgdmc,zjxm,sjs,sq_dwxx.dwmc,gdm_gdjcjl.khbh ";
	ls_sql+=" FROM crm_khxx,gdm_gdjcjl,sq_dwxx,sq_sgd,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm,gdm_zgcljl ";
    ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) and gdm_gdjcjl.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjlh=gdm_zgcljl.jcjlh ";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by gdm_zgcljl.clsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��

	pageObj.initPage("Gdm_zgcljlCxList.jsp","","","");
	pageObj.setPageRow(25);//����ÿҳ��ʾ��¼��
//	pageObj.setEditStr("����");

//��������
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);



//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�����¼��</td>
	<td  width="3%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="15%">�������</td>
	<td  width="4%">����¼��</td>
	<td  width="4%">����״̬</td>
	<td  width="4%">����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">��Ϣ��Դ</td>
	<td  width="6%">�������</td>
	<td  width="9%">�����</td>
	<td  width="7%">�������</td>
	<td  width="4%">�����ܶ�</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">���̵���</td>
	<td  width="3%">���ʦ</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="4%">�ͻ����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>