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
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ�����������ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_sgdzqjs_jsjlh=null;
	String cw_sgdzqjs_khbh=null;
	String cw_sgdzqjs_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_sgdzqjs_sgbz=null;
	String cw_sgdzqjs_jsrq=null;
	String cw_sgdzqjs_jsbl=null;
	String cw_sgdzqjs_jsje=null;
	String cw_sgdzqjs_clf=null;
	String cw_sgdzqjs_gdyp=null;
	String cw_sgdzqjs_sjbk=null;
	String cw_sgdzqjs_lx=null;
	String cw_sgdzqjs_lrr=null;
	String cw_sgdzqjs_lrsj=null;
	String cw_sgdzqjs_lrbm=null;
	String cw_sgdzqjs_jsjs=null;
	cw_sgdzqjs_jsjlh=request.getParameter("cw_sgdzqjs_jsjlh");
	if (cw_sgdzqjs_jsjlh!=null)
	{
		cw_sgdzqjs_jsjlh=cf.GB2Uni(cw_sgdzqjs_jsjlh);
		if (!(cw_sgdzqjs_jsjlh.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsjlh='"+cw_sgdzqjs_jsjlh+"')";
	}
	cw_sgdzqjs_khbh=request.getParameter("cw_sgdzqjs_khbh");
	if (cw_sgdzqjs_khbh!=null)
	{
		cw_sgdzqjs_khbh=cf.GB2Uni(cw_sgdzqjs_khbh);
		if (!(cw_sgdzqjs_khbh.equals("")))	wheresql+=" and  (cw_sgdzqjs.khbh='"+cw_sgdzqjs_khbh+"')";
	}
	cw_sgdzqjs_sgd=request.getParameter("cw_sgdzqjs_sgd");
	if (cw_sgdzqjs_sgd!=null)
	{
		cw_sgdzqjs_sgd=cf.GB2Uni(cw_sgdzqjs_sgd);
		if (!(cw_sgdzqjs_sgd.equals("")))	wheresql+=" and  (cw_sgdzqjs.sgd='"+cw_sgdzqjs_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_sgdzqjs_sgbz=request.getParameter("cw_sgdzqjs_sgbz");
	if (cw_sgdzqjs_sgbz!=null)
	{
		cw_sgdzqjs_sgbz=cf.GB2Uni(cw_sgdzqjs_sgbz);
		if (!(cw_sgdzqjs_sgbz.equals("")))	wheresql+=" and  (cw_sgdzqjs.sgbz='"+cw_sgdzqjs_sgbz+"')";
	}
	cw_sgdzqjs_jsrq=request.getParameter("cw_sgdzqjs_jsrq");
	if (cw_sgdzqjs_jsrq!=null)
	{
		cw_sgdzqjs_jsrq=cw_sgdzqjs_jsrq.trim();
		if (!(cw_sgdzqjs_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjs.jsrq>=TO_DATE('"+cw_sgdzqjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_jsrq=request.getParameter("cw_sgdzqjs_jsrq2");
	if (cw_sgdzqjs_jsrq!=null)
	{
		cw_sgdzqjs_jsrq=cw_sgdzqjs_jsrq.trim();
		if (!(cw_sgdzqjs_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjs.jsrq<=TO_DATE('"+cw_sgdzqjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_jsbl=request.getParameter("cw_sgdzqjs_jsbl");
	if (cw_sgdzqjs_jsbl!=null)
	{
		cw_sgdzqjs_jsbl=cw_sgdzqjs_jsbl.trim();
		if (!(cw_sgdzqjs_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsbl="+cw_sgdzqjs_jsbl+") ";
	}
	cw_sgdzqjs_jsje=request.getParameter("cw_sgdzqjs_jsje");
	if (cw_sgdzqjs_jsje!=null)
	{
		cw_sgdzqjs_jsje=cw_sgdzqjs_jsje.trim();
		if (!(cw_sgdzqjs_jsje.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsje="+cw_sgdzqjs_jsje+") ";
	}
	cw_sgdzqjs_clf=request.getParameter("cw_sgdzqjs_clf");
	if (cw_sgdzqjs_clf!=null)
	{
		cw_sgdzqjs_clf=cw_sgdzqjs_clf.trim();
		if (!(cw_sgdzqjs_clf.equals("")))	wheresql+=" and  (cw_sgdzqjs.clf="+cw_sgdzqjs_clf+") ";
	}
	cw_sgdzqjs_gdyp=request.getParameter("cw_sgdzqjs_gdyp");
	if (cw_sgdzqjs_gdyp!=null)
	{
		cw_sgdzqjs_gdyp=cw_sgdzqjs_gdyp.trim();
		if (!(cw_sgdzqjs_gdyp.equals("")))	wheresql+=" and  (cw_sgdzqjs.gdyp="+cw_sgdzqjs_gdyp+") ";
	}
	cw_sgdzqjs_sjbk=request.getParameter("cw_sgdzqjs_sjbk");
	if (cw_sgdzqjs_sjbk!=null)
	{
		cw_sgdzqjs_sjbk=cw_sgdzqjs_sjbk.trim();
		if (!(cw_sgdzqjs_sjbk.equals("")))	wheresql+=" and  (cw_sgdzqjs.sjbk="+cw_sgdzqjs_sjbk+") ";
	}
	cw_sgdzqjs_lx=request.getParameter("cw_sgdzqjs_lx");
	if (cw_sgdzqjs_lx!=null)
	{
		cw_sgdzqjs_lx=cf.GB2Uni(cw_sgdzqjs_lx);
		if (!(cw_sgdzqjs_lx.equals("")))	wheresql+=" and  (cw_sgdzqjs.lx='"+cw_sgdzqjs_lx+"')";
	}
	cw_sgdzqjs_lrr=request.getParameter("cw_sgdzqjs_lrr");
	if (cw_sgdzqjs_lrr!=null)
	{
		cw_sgdzqjs_lrr=cf.GB2Uni(cw_sgdzqjs_lrr);
		if (!(cw_sgdzqjs_lrr.equals("")))	wheresql+=" and  (cw_sgdzqjs.lrr='"+cw_sgdzqjs_lrr+"')";
	}
	cw_sgdzqjs_lrsj=request.getParameter("cw_sgdzqjs_lrsj");
	if (cw_sgdzqjs_lrsj!=null)
	{
		cw_sgdzqjs_lrsj=cw_sgdzqjs_lrsj.trim();
		if (!(cw_sgdzqjs_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjs.lrsj>=TO_DATE('"+cw_sgdzqjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_lrsj=request.getParameter("cw_sgdzqjs_lrsj2");
	if (cw_sgdzqjs_lrsj!=null)
	{
		cw_sgdzqjs_lrsj=cw_sgdzqjs_lrsj.trim();
		if (!(cw_sgdzqjs_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjs.lrsj<=TO_DATE('"+cw_sgdzqjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_lrbm=request.getParameter("cw_sgdzqjs_lrbm");
	if (cw_sgdzqjs_lrbm!=null)
	{
		cw_sgdzqjs_lrbm=cf.GB2Uni(cw_sgdzqjs_lrbm);
		if (!(cw_sgdzqjs_lrbm.equals("")))	wheresql+=" and  (cw_sgdzqjs.lrbm='"+cw_sgdzqjs_lrbm+"')";
	}
	cw_sgdzqjs_jsjs=request.getParameter("cw_sgdzqjs_jsjs");
	if (cw_sgdzqjs_jsjs!=null)
	{
		cw_sgdzqjs_jsjs=cf.GB2Uni(cw_sgdzqjs_jsjs);
		if (!(cw_sgdzqjs_jsjs.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsjs='"+cw_sgdzqjs_jsjs+"')";
	}

	ls_sql="SELECT cw_sgdzqjs.jsjlh,cw_sgdzqjs.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_sgdzqjs.sgbz,gdjsjdmc,cw_sgdzqjs.jsrq,cw_sgdzqjs.htje,cw_sgdzqjs.zjxje, DECODE(cw_sgdzqjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),cw_sgdzqjs.jsjsze,cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,cw_sgdzqjs.clf,cw_sgdzqjs.gdyp,cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.lrsj,dwmc,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,sq_sgd,dm_gdjsjd,sq_dwxx,crm_khxx  ";
    ls_sql+=" where cw_sgdzqjs.sgd=sq_sgd.sgd(+) and cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) and cw_sgdzqjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdzqjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdzqjs.lx='H'";//0:δ����
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sgdzqjsList.jsp","","","EditCw_sgdzqjs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_sgdzqjs_khbh","sq_sgd_sgdmc","cw_sgdzqjs_sgbz","cw_sgdzqjs_jsrq","cw_sgdzqjs_jsbl","cw_sgdzqjs_jsje","cw_sgdzqjs_clf","cw_sgdzqjs_gdyp","cw_sgdzqjs_sjbk","cw_sgdzqjs_lx","cw_sgdzqjs_lrr","cw_sgdzqjs_lrsj","cw_sgdzqjs_lrbm","cw_sgdzqjs_bz","cw_sgdzqjs_jsjs","cw_sgdzqjs_htje","cw_sgdzqjs_zjxje","cw_sgdzqjs_jsjsze"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_sgdzqjs.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_sgdzqjs.jsp";//Ϊ�в�����coluParm.link���ó�������
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
else//�ǵ����ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">�����¼��</td>
	<td  width="3%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ֳ�������</td>
	<td  width="6%">����</td>
	<td  width="4%">��������</td>
	<td  width="5%">��ͬ���</td>
	<td  width="4%">��������</td>
	<td  width="5%">�������</td>
	<td  width="5%">��������ܶ�</td>
	<td  width="3%">�������</td>
	<td  width="5%">������</td>
	<td  width="4%">���Ϸ�</td>
	<td  width="4%">������Ʒ</td>
	<td  width="5%">ʵ�ʲ���</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="54%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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