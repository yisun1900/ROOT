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
	String wheresql1="";
	String cw_jsjl_jsjlh=null;
	String cw_jsjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_qyrq=null;

	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String cw_jsjl_jsr=null;
	String cw_jsjl_jssj=null;

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_jsjl.scbz='"+scbz+"')";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_jsjl.jsdw in(select dwbh from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+fgs+"'))";

	String jsdw=null;
	jsdw=request.getParameter("jsdw");
	if (jsdw!=null)
	{
		if (!(jsdw.equals("")))	wheresql+=" and  (cw_jsjl.jsdw='"+jsdw+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	cw_jsjl_jsjlh=request.getParameter("cw_jsjl_jsjlh");
	if (cw_jsjl_jsjlh!=null)
	{
		cw_jsjl_jsjlh=cf.GB2Uni(cw_jsjl_jsjlh);
		if (!(cw_jsjl_jsjlh.equals("")))	wheresql+=" and  (cw_jsjl.jsjlh='"+cw_jsjl_jsjlh+"')";
	}
	cw_jsjl_khbh=request.getParameter("cw_jsjl_khbh");
	if (cw_jsjl_khbh!=null)
	{
		cw_jsjl_khbh=cf.GB2Uni(cw_jsjl_khbh);
		if (!(cw_jsjl_khbh.equals("")))	wheresql+=" and  (cw_jsjl.khbh='"+cw_jsjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
		if (!(crm_khxx_khxm.equals("")))	wheresql1+=" and  (khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
		if (!(crm_khxx_fwdz.equals("")))	wheresql1+=" and  (fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
		if (!(crm_khxx_lxfs.equals("")))	wheresql1+=" and  (lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
		if (!(crm_khxx_hth.equals("")))	wheresql1+=" and  (hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}

	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_jsjl_jsr=request.getParameter("cw_jsjl_jsr");
	if (cw_jsjl_jsr!=null)
	{
		cw_jsjl_jsr=cf.GB2Uni(cw_jsjl_jsr);
		if (!(cw_jsjl_jsr.equals("")))	wheresql+=" and  (cw_jsjl.jsr='"+cw_jsjl_jsr+"')";
	}
	cw_jsjl_jssj=request.getParameter("cw_jsjl_jssj");
	if (cw_jsjl_jssj!=null)
	{
		cw_jsjl_jssj=cw_jsjl_jssj.trim();
		if (!(cw_jsjl_jssj.equals("")))	wheresql+="  and (cw_jsjl.jssj>=TO_DATE('"+cw_jsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_jsjl_jssj=request.getParameter("cw_jsjl_jssj2");
	if (cw_jsjl_jssj!=null)
	{
		cw_jsjl_jssj=cw_jsjl_jssj.trim();
		if (!(cw_jsjl_jssj.equals("")))	wheresql+="  and (cw_jsjl.jssj<=TO_DATE('"+cw_jsjl_jssj+"','YYYY/MM/DD'))";
	}

	
	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,TO_CHAR(cw_jsjl.qye) qye,cw_jsjl.jsjlh,DECODE(scbz,'N','δɾ��','Y','<font color=\"#FF0000\">��ɾ��</font>'),cw_jsjl.zjje,cw_jsjl.jsl||'%',cw_jsjl.bqyfkze,cw_jsjl.jsr,cw_jsjl.jssj,b.dwmc jsdw,cw_jsjl.scr,cw_jsjl.scsj,cw_jsjl.bz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc sgd  ";
	ls_sql+=" FROM cw_jsjl,crm_khxx,sq_sgd,sq_dwxx b  ";
    ls_sql+=" where cw_jsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and cw_jsjl.jsdw=b.dwbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by jsjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jsjlCxList.jsp","SelectCxCw_jsjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm","cw_jsjl_fkqx","cw_jsjl_fkbz","cw_jsjl_yfkze","cw_jsjl_ljyfkze","cw_jsjl_bqyfkze","cw_jsjl_jsr","cw_jsjl_jssj","cw_jsjl_bqljyfkze","cw_jsjl_bqyfkbl","cw_jsjl_bz","cw_jsjl_jslx","cw_jsjl_qye","cw_jsjl_zjje","cw_jsjl_jxje","cw_jsjl_jsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/fkjs/ViewCw_jsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCwHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("zjxm","1");//�в����������Hash��
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("qye","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="5%">ǩԼ��</td>
	<td  width="4%">�����¼��</td>
	<td  width="4%">ɾ����־</td>
	<td  width="5%">�����������</td>
	<td  width="4%">���ڽ�����</td>
	<td  width="6%">����Ӧ�տ��ܶ�</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="7%">���㵥λ</td>
	<td  width="4%">ɾ����</td>
	<td  width="6%">ɾ��ʱ��</td>
	<td  width="9%">��ע</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">�ʼ�</td>
	<td  width="4%">ʩ����</td>
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