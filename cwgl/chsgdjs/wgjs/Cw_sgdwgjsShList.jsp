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
	String cw_chsgdjs_jsjlh=null;
	String cw_chsgdjs_khbh=null;
	String cw_chsgdjs_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_chsgdjs_sgbz=null;
	String cw_chsgdjs_htjcbj=null;
	String cw_chsgdjs_zjxjcbj=null;
	String cw_chsgdjs_ljqyf=null;
	String cw_chsgdjs_djazf=null;
	String cw_chsgdjs_jsjs=null;
	String cw_chsgdjs_jsbl=null;
	String cw_chsgdjs_tzjsbl=null;
	String cw_chsgdjs_sdlje=null;
	String cw_chsgdjs_sdljsbl=null;
	String cw_chsgdjs_jsje=null;
	String cw_chsgdjs_clf=null;
	String cw_chsgdjs_clyf=null;
	String cw_chsgdjs_gdyp=null;
	String cw_chsgdjs_yfgck=null;
	String cw_chsgdjs_kzbjjbl=null;
	String cw_chsgdjs_kzbj=null;
	String cw_chsgdjs_clfk=null;
	String cw_chsgdjs_jfje=null;
	String cw_chsgdjs_yfje=null;
	String cw_chsgdjs_jsrq=null;
	String cw_chsgdjs_clzt=null;
	String cw_chsgdjs_lrr=null;
	String cw_chsgdjs_lrsj=null;
	String cw_chsgdjs_lrbm=null;
	cw_chsgdjs_jsjlh=request.getParameter("cw_chsgdjs_jsjlh");
	if (cw_chsgdjs_jsjlh!=null)
	{
		cw_chsgdjs_jsjlh=cf.GB2Uni(cw_chsgdjs_jsjlh);
		if (!(cw_chsgdjs_jsjlh.equals("")))	wheresql+=" and  (cw_chsgdjs.jsjlh='"+cw_chsgdjs_jsjlh+"')";
	}
	cw_chsgdjs_khbh=request.getParameter("cw_chsgdjs_khbh");
	if (cw_chsgdjs_khbh!=null)
	{
		cw_chsgdjs_khbh=cf.GB2Uni(cw_chsgdjs_khbh);
		if (!(cw_chsgdjs_khbh.equals("")))	wheresql+=" and  (cw_chsgdjs.khbh='"+cw_chsgdjs_khbh+"')";
	}
	cw_chsgdjs_sgd=request.getParameter("cw_chsgdjs_sgd");
	if (cw_chsgdjs_sgd!=null)
	{
		cw_chsgdjs_sgd=cf.GB2Uni(cw_chsgdjs_sgd);
		if (!(cw_chsgdjs_sgd.equals("")))	wheresql+=" and  (cw_chsgdjs.sgd='"+cw_chsgdjs_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_chsgdjs_sgbz=request.getParameter("cw_chsgdjs_sgbz");
	if (cw_chsgdjs_sgbz!=null)
	{
		cw_chsgdjs_sgbz=cf.GB2Uni(cw_chsgdjs_sgbz);
		if (!(cw_chsgdjs_sgbz.equals("")))	wheresql+=" and  (cw_chsgdjs.sgbz='"+cw_chsgdjs_sgbz+"')";
	}
	cw_chsgdjs_htjcbj=request.getParameter("cw_chsgdjs_htjcbj");
	if (cw_chsgdjs_htjcbj!=null)
	{
		cw_chsgdjs_htjcbj=cw_chsgdjs_htjcbj.trim();
		if (!(cw_chsgdjs_htjcbj.equals("")))	wheresql+=" and  (cw_chsgdjs.htjcbj="+cw_chsgdjs_htjcbj+") ";
	}
	cw_chsgdjs_zjxjcbj=request.getParameter("cw_chsgdjs_zjxjcbj");
	if (cw_chsgdjs_zjxjcbj!=null)
	{
		cw_chsgdjs_zjxjcbj=cw_chsgdjs_zjxjcbj.trim();
		if (!(cw_chsgdjs_zjxjcbj.equals("")))	wheresql+=" and  (cw_chsgdjs.zjxjcbj="+cw_chsgdjs_zjxjcbj+") ";
	}
	cw_chsgdjs_ljqyf=request.getParameter("cw_chsgdjs_ljqyf");
	if (cw_chsgdjs_ljqyf!=null)
	{
		cw_chsgdjs_ljqyf=cw_chsgdjs_ljqyf.trim();
		if (!(cw_chsgdjs_ljqyf.equals("")))	wheresql+=" and  (cw_chsgdjs.ljqyf="+cw_chsgdjs_ljqyf+") ";
	}
	cw_chsgdjs_djazf=request.getParameter("cw_chsgdjs_djazf");
	if (cw_chsgdjs_djazf!=null)
	{
		cw_chsgdjs_djazf=cw_chsgdjs_djazf.trim();
		if (!(cw_chsgdjs_djazf.equals("")))	wheresql+=" and  (cw_chsgdjs.djazf="+cw_chsgdjs_djazf+") ";
	}
	cw_chsgdjs_jsjs=request.getParameter("cw_chsgdjs_jsjs");
	if (cw_chsgdjs_jsjs!=null)
	{
		cw_chsgdjs_jsjs=cw_chsgdjs_jsjs.trim();
		if (!(cw_chsgdjs_jsjs.equals("")))	wheresql+=" and  (cw_chsgdjs.jsjs="+cw_chsgdjs_jsjs+") ";
	}
	cw_chsgdjs_jsbl=request.getParameter("cw_chsgdjs_jsbl");
	if (cw_chsgdjs_jsbl!=null)
	{
		cw_chsgdjs_jsbl=cw_chsgdjs_jsbl.trim();
		if (!(cw_chsgdjs_jsbl.equals("")))	wheresql+=" and  (cw_chsgdjs.jsbl="+cw_chsgdjs_jsbl+") ";
	}
	cw_chsgdjs_tzjsbl=request.getParameter("cw_chsgdjs_tzjsbl");
	if (cw_chsgdjs_tzjsbl!=null)
	{
		cw_chsgdjs_tzjsbl=cw_chsgdjs_tzjsbl.trim();
		if (!(cw_chsgdjs_tzjsbl.equals("")))	wheresql+=" and  (cw_chsgdjs.tzjsbl="+cw_chsgdjs_tzjsbl+") ";
	}
	cw_chsgdjs_sdlje=request.getParameter("cw_chsgdjs_sdlje");
	if (cw_chsgdjs_sdlje!=null)
	{
		cw_chsgdjs_sdlje=cw_chsgdjs_sdlje.trim();
		if (!(cw_chsgdjs_sdlje.equals("")))	wheresql+=" and  (cw_chsgdjs.sdlje="+cw_chsgdjs_sdlje+") ";
	}
	cw_chsgdjs_sdljsbl=request.getParameter("cw_chsgdjs_sdljsbl");
	if (cw_chsgdjs_sdljsbl!=null)
	{
		cw_chsgdjs_sdljsbl=cw_chsgdjs_sdljsbl.trim();
		if (!(cw_chsgdjs_sdljsbl.equals("")))	wheresql+=" and  (cw_chsgdjs.sdljsbl="+cw_chsgdjs_sdljsbl+") ";
	}
	cw_chsgdjs_jsje=request.getParameter("cw_chsgdjs_jsje");
	if (cw_chsgdjs_jsje!=null)
	{
		cw_chsgdjs_jsje=cw_chsgdjs_jsje.trim();
		if (!(cw_chsgdjs_jsje.equals("")))	wheresql+=" and  (cw_chsgdjs.jsje="+cw_chsgdjs_jsje+") ";
	}
	cw_chsgdjs_clf=request.getParameter("cw_chsgdjs_clf");
	if (cw_chsgdjs_clf!=null)
	{
		cw_chsgdjs_clf=cw_chsgdjs_clf.trim();
		if (!(cw_chsgdjs_clf.equals("")))	wheresql+=" and  (cw_chsgdjs.clf="+cw_chsgdjs_clf+") ";
	}
	cw_chsgdjs_clyf=request.getParameter("cw_chsgdjs_clyf");
	if (cw_chsgdjs_clyf!=null)
	{
		cw_chsgdjs_clyf=cw_chsgdjs_clyf.trim();
		if (!(cw_chsgdjs_clyf.equals("")))	wheresql+=" and  (cw_chsgdjs.clyf="+cw_chsgdjs_clyf+") ";
	}
	cw_chsgdjs_gdyp=request.getParameter("cw_chsgdjs_gdyp");
	if (cw_chsgdjs_gdyp!=null)
	{
		cw_chsgdjs_gdyp=cw_chsgdjs_gdyp.trim();
		if (!(cw_chsgdjs_gdyp.equals("")))	wheresql+=" and  (cw_chsgdjs.gdyp="+cw_chsgdjs_gdyp+") ";
	}
	cw_chsgdjs_yfgck=request.getParameter("cw_chsgdjs_yfgck");
	if (cw_chsgdjs_yfgck!=null)
	{
		cw_chsgdjs_yfgck=cw_chsgdjs_yfgck.trim();
		if (!(cw_chsgdjs_yfgck.equals("")))	wheresql+=" and  (cw_chsgdjs.yfgck="+cw_chsgdjs_yfgck+") ";
	}
	cw_chsgdjs_kzbjjbl=request.getParameter("cw_chsgdjs_kzbjjbl");
	if (cw_chsgdjs_kzbjjbl!=null)
	{
		cw_chsgdjs_kzbjjbl=cw_chsgdjs_kzbjjbl.trim();
		if (!(cw_chsgdjs_kzbjjbl.equals("")))	wheresql+=" and  (cw_chsgdjs.kzbjbl="+cw_chsgdjs_kzbjjbl+") ";
	}
	cw_chsgdjs_kzbj=request.getParameter("cw_chsgdjs_kzbj");
	if (cw_chsgdjs_kzbj!=null)
	{
		cw_chsgdjs_kzbj=cw_chsgdjs_kzbj.trim();
		if (!(cw_chsgdjs_kzbj.equals("")))	wheresql+=" and  (cw_chsgdjs.kzbj="+cw_chsgdjs_kzbj+") ";
	}
	cw_chsgdjs_clfk=request.getParameter("cw_chsgdjs_clfk");
	if (cw_chsgdjs_clfk!=null)
	{
		cw_chsgdjs_clfk=cw_chsgdjs_clfk.trim();
		if (!(cw_chsgdjs_clfk.equals("")))	wheresql+=" and  (cw_chsgdjs.clfk="+cw_chsgdjs_clfk+") ";
	}
	cw_chsgdjs_jfje=request.getParameter("cw_chsgdjs_jfje");
	if (cw_chsgdjs_jfje!=null)
	{
		cw_chsgdjs_jfje=cw_chsgdjs_jfje.trim();
		if (!(cw_chsgdjs_jfje.equals("")))	wheresql+=" and  (cw_chsgdjs.jfje="+cw_chsgdjs_jfje+") ";
	}
	cw_chsgdjs_yfje=request.getParameter("cw_chsgdjs_yfje");
	if (cw_chsgdjs_yfje!=null)
	{
		cw_chsgdjs_yfje=cw_chsgdjs_yfje.trim();
		if (!(cw_chsgdjs_yfje.equals("")))	wheresql+=" and  (cw_chsgdjs.yfje="+cw_chsgdjs_yfje+") ";
	}
	cw_chsgdjs_jsrq=request.getParameter("cw_chsgdjs_jsrq");
	if (cw_chsgdjs_jsrq!=null)
	{
		cw_chsgdjs_jsrq=cw_chsgdjs_jsrq.trim();
		if (!(cw_chsgdjs_jsrq.equals("")))	wheresql+="  and (cw_chsgdjs.jsrq=TO_DATE('"+cw_chsgdjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_chsgdjs_clzt=request.getParameter("cw_chsgdjs_clzt");
	if (cw_chsgdjs_clzt!=null)
	{
		cw_chsgdjs_clzt=cf.GB2Uni(cw_chsgdjs_clzt);
		if (!(cw_chsgdjs_clzt.equals("")))	wheresql+=" and  (cw_chsgdjs.clzt='"+cw_chsgdjs_clzt+"')";
	}
	cw_chsgdjs_lrr=request.getParameter("cw_chsgdjs_lrr");
	if (cw_chsgdjs_lrr!=null)
	{
		cw_chsgdjs_lrr=cf.GB2Uni(cw_chsgdjs_lrr);
		if (!(cw_chsgdjs_lrr.equals("")))	wheresql+=" and  (cw_chsgdjs.lrr='"+cw_chsgdjs_lrr+"')";
	}
	cw_chsgdjs_lrsj=request.getParameter("cw_chsgdjs_lrsj");
	if (cw_chsgdjs_lrsj!=null)
	{
		cw_chsgdjs_lrsj=cw_chsgdjs_lrsj.trim();
		if (!(cw_chsgdjs_lrsj.equals("")))	wheresql+="  and (cw_chsgdjs.lrsj=TO_DATE('"+cw_chsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_chsgdjs_lrbm=request.getParameter("cw_chsgdjs_lrbm");
	if (cw_chsgdjs_lrbm!=null)
	{
		cw_chsgdjs_lrbm=cf.GB2Uni(cw_chsgdjs_lrbm);
		if (!(cw_chsgdjs_lrbm.equals("")))	wheresql+=" and  (cw_chsgdjs.lrbm='"+cw_chsgdjs_lrbm+"')";
	}
	ls_sql="SELECT cw_chsgdjs.jsjlh,DECODE(cw_chsgdjs.clzt,'1','δ����','2','����'),cw_chsgdjs.jsrq,cw_chsgdjs.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_chsgdjs.sgbz, DECODE(cw_chsgdjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),cw_chsgdjs.jsjsze,cw_chsgdjs.jsbl||'%',cw_chsgdjs.tzjsbl||'%',DECODE(cw_chsgdjs.sdljsfs,'1','ͳһ��������','2','������������','3','�ֹ�¼�������','9','������'),cw_chsgdjs.sdlje,cw_chsgdjs.sdljsbl||'%',cw_chsgdjs.sdljsje,cw_chsgdjs.jsje, DECODE(cw_chsgdjs.sfkclk,'Y','��','N','��'),cw_chsgdjs.clf,cw_chsgdjs.clyf,cw_chsgdjs.clfk, DECODE(cw_chsgdjs.sfkgdyp,'Y','��','N','��'),cw_chsgdjs.gdyp, DECODE(cw_chsgdjs.sfkyfgf,'Y','��','N','��'),cw_chsgdjs.yfgck, DECODE(cw_chsgdjs.sfkzbj,'Y','��','N','��'), DECODE(cw_chsgdjs.kzbjjs,'1','�������','2','�����ܶ�'),cw_chsgdjs.kzbjbl||'%',cw_chsgdjs.kzbj,cw_chsgdjs.fkje,cw_chsgdjs.jlje,cw_chsgdjs.qtje,cw_chsgdjs.yfje,cw_chsgdjs.htje,cw_chsgdjs.zjxje,cw_chsgdjs.qtf,cw_chsgdjs.qtfsm,cw_chsgdjs.ssk, cw_chsgdjs.lrr,cw_chsgdjs.lrsj,dwmc,cw_chsgdjs.bz  ";
	ls_sql+=" FROM sq_sgd,cw_chsgdjs,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_chsgdjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_chsgdjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_chsgdjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_chsgdjs.clzt='1'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_chsgdjs.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_chsgdjsList.jsp","","","ShCw_chsgdjs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_chsgdjs_khbh","sq_sgd_sgdmc","cw_chsgdjs_sgbz","cw_chsgdjs_htjcbj","cw_chsgdjs_zjxjcbj","cw_chsgdjs_ljqyf","cw_chsgdjs_djazf","cw_chsgdjs_jsjs","cw_chsgdjs_jsbl","cw_chsgdjs_tzjsbl","cw_chsgdjs_sdlje","cw_chsgdjs_sdljsbl","cw_chsgdjs_jsje","cw_chsgdjs_clf","cw_chsgdjs_clyf","cw_chsgdjs_gdyp","cw_chsgdjs_yfgck","cw_chsgdjs_kzbjjbl","cw_chsgdjs_kzbj","cw_chsgdjs_clfk","cw_chsgdjs_jfje","cw_chsgdjs_yfje","cw_chsgdjs_jsrq","cw_chsgdjs_clzt","cw_chsgdjs_lrr","cw_chsgdjs_lrsj","cw_chsgdjs_lrbm","cw_chsgdjs_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_chsgdjs.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
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
  <B><font size="3">ʩ�����깤���㣭���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�����¼��</td>
	<td  width="2%">����״̬</td>
	<td  width="3%">��������</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ֳ�������</td>
	<td  width="4%">�������</td>
	<td  width="2%">��������ܶ�</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����������</td>
	<td  width="3%">ˮ��·���㷽ʽ</td>
	<td  width="2%">ˮ��·���</td>
	<td  width="2%">ˮ��·�������</td>
	<td  width="2%">ˮ��·������</td>
	<td  width="2%">�����ܶ�</td>
	<td  width="2%">�Ƿ�۲��Ͽ�</td>
	<td  width="2%">���Ϸ�</td>
	<td  width="2%">�����˷�</td>
	<td  width="2%">���Ϸ���</td>
	<td  width="2%">�Ƿ�۹�����Ʒ</td>
	<td  width="2%">������Ʒ</td>
	<td  width="2%">�Ƿ���Ѹ�����</td>
	<td  width="2%">�Ѹ����̿�</td>
	<td  width="2%">�Ƿ���ʱ���</td>
	<td  width="2%">���ʱ������</td>
	<td  width="2%">Ӧ���ʱ������</td>
	<td  width="2%">���ʱ���</td>
	<td  width="2%">������</td>
	<td  width="2%">�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">Ӧ�����</td>
	<td  width="2%">���̺�ͬ��</td>
	<td  width="2%">����������</td>
	<td  width="2%">������</td>
	<td  width="7%">������˵��</td>
	<td  width="2%">ʵ�տ�</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="118%">��ע</td>
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