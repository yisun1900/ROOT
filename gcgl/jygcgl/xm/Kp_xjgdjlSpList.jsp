<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String gdm_gdjcjl_jcjlh=null;
	String gdm_gdjcjl_khbh=null;
	String gdm_gdjcjl_xjr=null;
	String gdm_gdjcjl_xjsj=null;
	String jclxbm=null;
	String gdm_gdjcjl_lrr=null;
	String gdm_gdjcjl_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String jcjgbm=null;
	jcjgbm=request.getParameter("jcjgbm");
	if (jcjgbm!=null)
	{
		if (!(jcjgbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjgbm='"+jcjgbm+"')";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.cfspbz='"+cfspbz+"')";
	}
	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.kpbz='"+kpbz+"')";
	}
	String fkze=null;
	fkze=request.getParameter("fkze");
	if (fkze!=null)
	{
		if (!(fkze.equals("")))	wheresql+=" and  (gdm_gdjcjl.fkze>"+fkze+")";
	}
	
	
	gdm_gdjcjl_jcjlh=request.getParameter("gdm_gdjcjl_jcjlh");
	if (gdm_gdjcjl_jcjlh!=null)
	{
		gdm_gdjcjl_jcjlh=cf.GB2Uni(gdm_gdjcjl_jcjlh);
		if (!(gdm_gdjcjl_jcjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjlh='"+gdm_gdjcjl_jcjlh+"')";
	}
	gdm_gdjcjl_khbh=request.getParameter("gdm_gdjcjl_khbh");
	if (gdm_gdjcjl_khbh!=null)
	{
		gdm_gdjcjl_khbh=cf.GB2Uni(gdm_gdjcjl_khbh);
		if (!(gdm_gdjcjl_khbh.equals("")))	wheresql+=" and  (gdm_gdjcjl.khbh='"+gdm_gdjcjl_khbh+"')";
	}
	gdm_gdjcjl_xjr=request.getParameter("gdm_gdjcjl_xjr");
	if (gdm_gdjcjl_xjr!=null)
	{
		gdm_gdjcjl_xjr=cf.GB2Uni(gdm_gdjcjl_xjr);
		if (!(gdm_gdjcjl_xjr.equals("")))	wheresql+=" and  (gdm_gdjcjl.xjr='"+gdm_gdjcjl_xjr+"')";
	}
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
	jclxbm=request.getParameter("jclxbm");
	if (jclxbm!=null)
	{
		jclxbm=cf.GB2Uni(jclxbm);
		if (!(jclxbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jclxbm='"+jclxbm+"')";
	}
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
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (gdm_gdjcjl.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	ls_sql="SELECT gdm_gdjcjl.jcjlh,DECODE(gdm_gdjcjl.cfspbz,'1','��������','2','δ����','3','����ͨ��','4','����δͨ��'),sgdmc,fkze,kfzs,gdm_gdjcjl.kcjdebl||'%',crm_khxx.hth,crm_khxx.khxm,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xjlxmc,xjjgmc,gdm_gdjcjl.bz,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm  ";
	ls_sql+=" FROM gdm_gdjcjl,crm_khxx,sq_sgd,kp_jclxbm,dm_jcjgbm  ";
    ls_sql+=" where gdm_gdjcjl.sgd=sq_sgd.sgd(+) and gdm_gdjcjl.jcjgbm=dm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh and gdm_gdjcjl.jclxbm=kp_jclxbm.jclxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_gdjcjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_gdjcjlSpList.jsp","SelectSpGdm_gdjcjl.jsp","","SpGdm_gdjcjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
/*
//������ʾ��
	String[] disColName={"jcjlh","gdm_gdjcjl_khbh","gdm_gdjcjl_xjr","gdm_gdjcjl_xjsj","jclxbm","dm_jcjgbm_xjjgmc","gdm_gdjcjl_lrr","gdm_gdjcjl_lrsj","gdm_gdjcjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"����ͬ��"};//��ť����ʾ����
	String[] buttonLink={"SavePlSpGdm_gdjcjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jcjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewGdm_gdjcjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jcjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">ʩ���Ӽ�����--��������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">����¼��</td>
	<td  width="4%">������־</td>
	<td  width="4%">ʩ����</td>
	<td  width="6%">�����ܶ�</td>
	<td  width="4%">�۷�</td>
	<td  width="4%">�۳��ӵ���ٷֱ�</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="6%">�������</td>
	<td  width="8%">�����</td>
	<td  width="17%">���˵��</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">���̵���</td>
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