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
	String crm_dgqk_khbh=null;
	String crm_dgqk_cpbm=null;
	String crm_dgqk_clgw=null;
	String crm_dgqk_pp=null;
	String crm_dgqk_gys=null;
	String crm_dgqk_yazrq=null;
	String crm_dgqk_sazrq=null;
	String crm_dgqk_lrr=null;
	String crm_dgqk_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_dgqk_azbz=null;
	crm_dgqk_khbh=request.getParameter("crm_dgqk_khbh");
	if (crm_dgqk_khbh!=null)
	{
		crm_dgqk_khbh=cf.GB2Uni(crm_dgqk_khbh);
		if (!(crm_dgqk_khbh.equals("")))	wheresql+=" and  (crm_dgqk.khbh='"+crm_dgqk_khbh+"')";
	}
	crm_dgqk_cpbm=request.getParameter("crm_dgqk_cpbm");
	if (crm_dgqk_cpbm!=null)
	{
		crm_dgqk_cpbm=cf.GB2Uni(crm_dgqk_cpbm);
		if (!(crm_dgqk_cpbm.equals("")))	wheresql+=" and  (crm_dgqk.cpbm='"+crm_dgqk_cpbm+"')";
	}
	crm_dgqk_clgw=request.getParameter("crm_dgqk_clgw");
	if (crm_dgqk_clgw!=null)
	{
		crm_dgqk_clgw=cf.GB2Uni(crm_dgqk_clgw);
		if (!(crm_dgqk_clgw.equals("")))	wheresql+=" and  (crm_dgqk.clgw='"+crm_dgqk_clgw+"')";
	}
	crm_dgqk_pp=request.getParameter("crm_dgqk_pp");
	if (crm_dgqk_pp!=null)
	{
		crm_dgqk_pp=cf.GB2Uni(crm_dgqk_pp);
		if (!(crm_dgqk_pp.equals("")))	wheresql+=" and  (crm_dgqk.pp='"+crm_dgqk_pp+"')";
	}
	crm_dgqk_gys=request.getParameter("crm_dgqk_gys");
	if (crm_dgqk_gys!=null)
	{
		crm_dgqk_gys=cf.GB2Uni(crm_dgqk_gys);
		if (!(crm_dgqk_gys.equals("")))	wheresql+=" and  (crm_dgqk.gys='"+crm_dgqk_gys+"')";
	}
	crm_dgqk_yazrq=request.getParameter("crm_dgqk_yazrq");
	if (crm_dgqk_yazrq!=null)
	{
		crm_dgqk_yazrq=crm_dgqk_yazrq.trim();
		if (!(crm_dgqk_yazrq.equals("")))	wheresql+="  and (crm_dgqk.yazrq>=TO_DATE('"+crm_dgqk_yazrq+"','YYYY/MM/DD'))";
	}
	crm_dgqk_yazrq=request.getParameter("crm_dgqk_yazrq2");
	if (crm_dgqk_yazrq!=null)
	{
		crm_dgqk_yazrq=crm_dgqk_yazrq.trim();
		if (!(crm_dgqk_yazrq.equals("")))	wheresql+="  and (crm_dgqk.yazrq<=TO_DATE('"+crm_dgqk_yazrq+"','YYYY/MM/DD'))";
	}
	crm_dgqk_sazrq=request.getParameter("crm_dgqk_sazrq");
	if (crm_dgqk_sazrq!=null)
	{
		crm_dgqk_sazrq=crm_dgqk_sazrq.trim();
		if (!(crm_dgqk_sazrq.equals("")))	wheresql+="  and (crm_dgqk.sazrq>=TO_DATE('"+crm_dgqk_sazrq+"','YYYY/MM/DD'))";
	}
	crm_dgqk_sazrq=request.getParameter("crm_dgqk_sazrq2");
	if (crm_dgqk_sazrq!=null)
	{
		crm_dgqk_sazrq=crm_dgqk_sazrq.trim();
		if (!(crm_dgqk_sazrq.equals("")))	wheresql+="  and (crm_dgqk.sazrq<=TO_DATE('"+crm_dgqk_sazrq+"','YYYY/MM/DD'))";
	}
	crm_dgqk_lrr=request.getParameter("crm_dgqk_lrr");
	if (crm_dgqk_lrr!=null)
	{
		crm_dgqk_lrr=cf.GB2Uni(crm_dgqk_lrr);
		if (!(crm_dgqk_lrr.equals("")))	wheresql+=" and  (crm_dgqk.lrr='"+crm_dgqk_lrr+"')";
	}
	crm_dgqk_lrsj=request.getParameter("crm_dgqk_lrsj");
	if (crm_dgqk_lrsj!=null)
	{
		crm_dgqk_lrsj=crm_dgqk_lrsj.trim();
		if (!(crm_dgqk_lrsj.equals("")))	wheresql+="  and (crm_dgqk.lrsj>=TO_DATE('"+crm_dgqk_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dgqk_lrsj=request.getParameter("crm_dgqk_lrsj2");
	if (crm_dgqk_lrsj!=null)
	{
		crm_dgqk_lrsj=crm_dgqk_lrsj.trim();
		if (!(crm_dgqk_lrsj.equals("")))	wheresql+="  and (crm_dgqk.lrsj<=TO_DATE('"+crm_dgqk_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
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
	crm_dgqk_azbz=request.getParameter("crm_dgqk_azbz");
	if (crm_dgqk_azbz!=null)
	{
		crm_dgqk_azbz=cf.GB2Uni(crm_dgqk_azbz);
		if (!(crm_dgqk_azbz.equals("")))	wheresql+=" and  (crm_dgqk.azbz='"+crm_dgqk_azbz+"')";
	}
	ls_sql="SELECT crm_dgqk.khbh as khbh,crm_dgqk.cpbm as cpbm,dm_cpbm.cpmc as dm_cpbm_cpmc,crm_dgqk.sjfy as crm_dgqk_sjfy,crm_dgqk.yazrq as crm_dgqk_yazrq,crm_dgqk.sazrq as crm_dgqk_sazrq,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_dwxx.dwdh as sq_dwxx_dwdh, DECODE(crm_dgqk.azbz,'N','δ��װ','Y','�Ѱ�װ') as crm_dgqk_azbz  ";
	ls_sql+=" FROM crm_dgqk,crm_khxx,dm_cpbm,sq_dwxx  ";
    ls_sql+=" where crm_dgqk.cpbm=dm_cpbm.cpbm and crm_dgqk.khbh=crm_khxx.khbh and crm_dgqk.gys=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_dgqkCxList.jsp","SelectCxCrm_dgqk.jsp","ViewCrm_dgqk.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","dm_cpbm_cpmc","crm_dgqk_sjfy","crm_dgqk_yazrq","crm_dgqk_sazrq","sq_dwxx_dwmc","sq_dwxx_dwdh","crm_dgqk_azbz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"khbh","cpbm"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("crm_khxx_khxm","1");//�в����������Hash��
	spanColHash.put("crm_khxx_fwdz","1");//�в����������Hash��
	spanColHash.put("crm_khxx_lxfs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="7%">�ͻ����</td>
	<td  width="7%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="7%">�ͻ��绰</td>
	<td  width="7%">��Ʒ</td>
	<td  width="7%">ʵ�ʷ���</td>
	<td  width="9%">Ӧ��װ����</td>
	<td  width="9%">ʵ��װ����</td>
	<td  width="9%">��Ӧ��</td>
	<td  width="7%">��Ӧ�̵绰</td>
	<td  width="7%">��װ</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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