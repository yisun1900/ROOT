<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:useBean id="cwgl" scope="page" class="cwgl.Cwgl"/>
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

	String jsdw=null;
	jsdw=request.getParameter("jsdw");
	if (!(jsdw.equals("")))	wheresql+=" and  (cw_jsjl.jsdw='"+jsdw+"')";


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
	
	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc as sgd,cw_jsjl.jsjlh,TO_CHAR(cw_jsjl.qye),cw_jsjl.zjje,cw_jsjl.jsl||'%',cw_jsjl.bqyfkze,cw_jsjl.jsr,cw_jsjl.jssj,b.dwmc jsdw,cw_jsjl.bz  ";
	ls_sql+=" FROM cw_jsjl,crm_khxx,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_jsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and cw_jsjl.jsdw=b.dwbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by jsjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jsjlList.jsp","SelectCw_jsjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm","cw_jsjl_fkqx","cw_jsjl_fkbz","cw_jsjl_yfkze","cw_jsjl_ljyfkze","cw_jsjl_bqyfkze","cw_jsjl_jsr","cw_jsjl_jssj","cw_jsjl_bqljyfkze","cw_jsjl_bqyfkbl","cw_jsjl_bz","cw_jsjl_jslx","cw_jsjl_qye","cw_jsjl_zjje","cw_jsjl_jxje","cw_jsjl_jsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_jsjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_jsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
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
//	spanColHash.put("cw_jsjl_fkbz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] jsjlh = request.getParameterValues("jsjlh");
	try {
		if (jsjlh!=null && jsjlh.length>0)
		{
			String scr=(String)session.getAttribute("yhdlm");
			cwgl.deletejs(jsjlh,scr);
		}
	}
	catch (Exception e) {
		out.print("Exception: " + e);
	}

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
	<td  width="2%">&nbsp;</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ʼ�</td>
	<td  width="3%">ʩ����</td>
	<td  width="4%">�����¼��</td>
	<td  width="6%">ǩԼ��</td>
	<td  width="5%">����������</td>
	<td  width="3%">������</td>
	<td  width="6%">���ڽ�����ܶ�</td>
	<td  width="3%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="7%">���㵥λ</td>
	<td  width="12%">��ע</td>
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