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
	String cw_cxhdxgjl_xgjlh=null;
	String cw_cxhdxgjl_khbh=null;
	String cw_cxhdxgjl_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_cxhdxgjl_fgsbh=null;
	String cw_cxhdxgjl_lrr=null;
	String cw_cxhdxgjl_lrsj=null;
	String cw_cxhdxgjl_lrbm=null;
	cw_cxhdxgjl_xgjlh=request.getParameter("cw_cxhdxgjl_xgjlh");
	if (cw_cxhdxgjl_xgjlh!=null)
	{
		cw_cxhdxgjl_xgjlh=cf.GB2Uni(cw_cxhdxgjl_xgjlh);
		if (!(cw_cxhdxgjl_xgjlh.equals("")))	wheresql+=" and  (cw_cxhdxgjl.xgjlh='"+cw_cxhdxgjl_xgjlh+"')";
	}
	cw_cxhdxgjl_khbh=request.getParameter("cw_cxhdxgjl_khbh");
	if (cw_cxhdxgjl_khbh!=null)
	{
		cw_cxhdxgjl_khbh=cf.GB2Uni(cw_cxhdxgjl_khbh);
		if (!(cw_cxhdxgjl_khbh.equals("")))	wheresql+=" and  (cw_cxhdxgjl.khbh='"+cw_cxhdxgjl_khbh+"')";
	}
	cw_cxhdxgjl_khxm=request.getParameter("cw_cxhdxgjl_khxm");
	if (cw_cxhdxgjl_khxm!=null)
	{
		cw_cxhdxgjl_khxm=cf.GB2Uni(cw_cxhdxgjl_khxm);
		if (!(cw_cxhdxgjl_khxm.equals("")))	wheresql+=" and  (cw_cxhdxgjl.khxm='"+cw_cxhdxgjl_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_cxhdxgjl_fgsbh=request.getParameter("cw_cxhdxgjl_fgsbh");
	if (cw_cxhdxgjl_fgsbh!=null)
	{
		cw_cxhdxgjl_fgsbh=cf.GB2Uni(cw_cxhdxgjl_fgsbh);
		if (!(cw_cxhdxgjl_fgsbh.equals("")))	wheresql+=" and  (cw_cxhdxgjl.fgsbh='"+cw_cxhdxgjl_fgsbh+"')";
	}
	cw_cxhdxgjl_lrr=request.getParameter("cw_cxhdxgjl_lrr");
	if (cw_cxhdxgjl_lrr!=null)
	{
		cw_cxhdxgjl_lrr=cf.GB2Uni(cw_cxhdxgjl_lrr);
		if (!(cw_cxhdxgjl_lrr.equals("")))	wheresql+=" and  (cw_cxhdxgjl.lrr='"+cw_cxhdxgjl_lrr+"')";
	}
	cw_cxhdxgjl_lrsj=request.getParameter("cw_cxhdxgjl_lrsj");
	if (cw_cxhdxgjl_lrsj!=null)
	{
		cw_cxhdxgjl_lrsj=cw_cxhdxgjl_lrsj.trim();
		if (!(cw_cxhdxgjl_lrsj.equals("")))	wheresql+="  and (cw_cxhdxgjl.lrsj>=TO_DATE('"+cw_cxhdxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_cxhdxgjl_lrsj=request.getParameter("cw_cxhdxgjl_lrsj2");
	if (cw_cxhdxgjl_lrsj!=null)
	{
		cw_cxhdxgjl_lrsj=cw_cxhdxgjl_lrsj.trim();
		if (!(cw_cxhdxgjl_lrsj.equals("")))	wheresql+="  and (cw_cxhdxgjl.lrsj<=TO_DATE('"+cw_cxhdxgjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	cw_cxhdxgjl_lrbm=request.getParameter("cw_cxhdxgjl_lrbm");
	if (cw_cxhdxgjl_lrbm!=null)
	{
		cw_cxhdxgjl_lrbm=cf.GB2Uni(cw_cxhdxgjl_lrbm);
		if (!(cw_cxhdxgjl_lrbm.equals("")))	wheresql+=" and  (cw_cxhdxgjl.lrbm='"+cw_cxhdxgjl_lrbm+"')";
	}
	ls_sql="SELECT cw_cxhdxgjl.xgjlh,cw_cxhdxgjl.khbh,cw_cxhdxgjl.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc fgsbh,cw_cxhdxgjl.xgqcxhd,cw_cxhdxgjl.xgqcxhdbmxq,cw_cxhdxgjl.xgqcxhdbmzh,cw_cxhdxgjl.xghcxhd,cw_cxhdxgjl.xghcxhdbmxq,cw_cxhdxgjl.xghcxhdbmzh,cw_cxhdxgjl.xgqwdzgce,cw_cxhdxgjl.xgqqye,cw_cxhdxgjl.xgqpmjj,cw_cxhdxgjl.xgqsuijin,cw_cxhdxgjl.xgqguanlif,cw_cxhdxgjl.xghwdzgce,cw_cxhdxgjl.xghqye,cw_cxhdxgjl.xghpmjj,cw_cxhdxgjl.xghsuijin,cw_cxhdxgjl.xghguanlif,cw_cxhdxgjl.lrr,cw_cxhdxgjl.lrsj,b.dwmc lrbm,cw_cxhdxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_cxhdxgjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_cxhdxgjl.khbh=crm_khxx.khbh(+) and cw_cxhdxgjl.fgsbh=a.dwbh(+) and cw_cxhdxgjl.lrbm=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_cxhdxgjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_cxhdxgjlCxList.jsp","SelectCxCw_cxhdxgjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xgjlh","cw_cxhdxgjl_khbh","cw_cxhdxgjl_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_cxhdxgjl_fgsbh","cw_cxhdxgjl_xgqcxhd","cw_cxhdxgjl_xgqcxhdbmxq","cw_cxhdxgjl_xgqcxhdbmzh","cw_cxhdxgjl_xghcxhd","cw_cxhdxgjl_xghcxhdbmxq","cw_cxhdxgjl_xghcxhdbmzh","cw_cxhdxgjl_xgqwdzgce","cw_cxhdxgjl_xgqqye","cw_cxhdxgjl_xgqpmjj","cw_cxhdxgjl_xgqsuijin","cw_cxhdxgjl_xgqguanlif","cw_cxhdxgjl_xghwdzgce","cw_cxhdxgjl_xghqye","cw_cxhdxgjl_xghpmjj","cw_cxhdxgjl_xghsuijin","cw_cxhdxgjl_xghguanlif","cw_cxhdxgjl_lrr","cw_cxhdxgjl_lrsj","cw_cxhdxgjl_lrbm","cw_cxhdxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xgjlh"};
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
  <B><font size="3">��ѯ���޸Ĵ������¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�޸ļ�¼��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="6%"><strong>�޸�ǰ��˾�����</strong></td>
	<td  width="6%"><strong>�޸�ǰС�������</strong></td>
	<td  width="6%"><strong>�޸�ǰչ������</strong></td>
	<td  width="6%"><font color="#0000FF"><strong>�޸ĺ�˾�����</strong></font></td>
	<td  width="6%"><font color="#0000FF"><strong>�޸ĺ�С�������</strong></font></td>
	<td  width="6%"><font color="#0000FF"><strong>�޸ĺ�չ������</strong></font></td>
	<td  width="3%"><strong>�޸�ǰ����ԭ����</strong></td>
	<td  width="3%"><strong>�޸�ǰǩԼ��</strong></td>
	<td  width="2%"><strong>�޸�ǰÿƽ�׾���</strong></td>
	<td  width="3%"><strong>�޸�ǰ˰��</strong></td>
	<td  width="3%"><strong>�޸�ǰ�ۺ�����</strong></td>
	<td  width="3%"><font color="#0000FF"><strong>�޸ĺ󹤳�ԭ����</strong></font></td>
	<td  width="3%"><font color="#0000FF"><strong>�޸ĺ�ǩԼ��</strong></font></td>
	<td  width="2%"><font color="#0000FF"><strong>�޸ĺ�ÿƽ�׾���</strong></font></td>
	<td  width="3%"><font color="#0000FF"><strong>�޸ĺ�˰��</strong></font></td>
	<td  width="3%"><font color="#0000FF"><strong>�޸ĺ��ۺ�����</strong></font></td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="8%">��ע</td>
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