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
	String cw_zkxgjl_khbh=null;
	String cw_zkxgjl_xgsj=null;
	String cw_zkxgjl_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_zkxgjl_fgsbh=null;
	String cw_zkxgjl_xgr=null;
	String cw_zkxgjl_zklx=null;
	String cw_zkxgjl_gxqzkl=null;
	String cw_zkxgjl_gxhzkl=null;
	cw_zkxgjl_khbh=request.getParameter("cw_zkxgjl_khbh");
	if (cw_zkxgjl_khbh!=null)
	{
		cw_zkxgjl_khbh=cf.GB2Uni(cw_zkxgjl_khbh);
		if (!(cw_zkxgjl_khbh.equals("")))	wheresql+=" and  (cw_zkxgjl.khbh='"+cw_zkxgjl_khbh+"')";
	}
	cw_zkxgjl_xgsj=request.getParameter("cw_zkxgjl_xgsj");
	if (cw_zkxgjl_xgsj!=null)
	{
		cw_zkxgjl_xgsj=cw_zkxgjl_xgsj.trim();
		if (!(cw_zkxgjl_xgsj.equals("")))	wheresql+="  and (cw_zkxgjl.xgsj<=TO_DATE('"+cw_zkxgjl_xgsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	cw_zkxgjl_xgsj=request.getParameter("cw_zkxgjl_xgsj2");
	if (cw_zkxgjl_xgsj!=null)
	{
		cw_zkxgjl_xgsj=cw_zkxgjl_xgsj.trim();
		if (!(cw_zkxgjl_xgsj.equals("")))	wheresql+="  and (cw_zkxgjl.xgsj<=TO_DATE('"+cw_zkxgjl_xgsj+"','YYYY/MM/DD'))";
	}
	cw_zkxgjl_khxm=request.getParameter("cw_zkxgjl_khxm");
	if (cw_zkxgjl_khxm!=null)
	{
		cw_zkxgjl_khxm=cf.GB2Uni(cw_zkxgjl_khxm);
		if (!(cw_zkxgjl_khxm.equals("")))	wheresql+=" and  (cw_zkxgjl.khxm='"+cw_zkxgjl_khxm+"')";
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
	cw_zkxgjl_fgsbh=request.getParameter("cw_zkxgjl_fgsbh");
	if (cw_zkxgjl_fgsbh!=null)
	{
		cw_zkxgjl_fgsbh=cf.GB2Uni(cw_zkxgjl_fgsbh);
		if (!(cw_zkxgjl_fgsbh.equals("")))	wheresql+=" and  (cw_zkxgjl.fgsbh='"+cw_zkxgjl_fgsbh+"')";
	}
	cw_zkxgjl_xgr=request.getParameter("cw_zkxgjl_xgr");
	if (cw_zkxgjl_xgr!=null)
	{
		cw_zkxgjl_xgr=cf.GB2Uni(cw_zkxgjl_xgr);
		if (!(cw_zkxgjl_xgr.equals("")))	wheresql+=" and  (cw_zkxgjl.xgr='"+cw_zkxgjl_xgr+"')";
	}
	cw_zkxgjl_zklx=request.getParameter("cw_zkxgjl_zklx");
	if (cw_zkxgjl_zklx!=null)
	{
		cw_zkxgjl_zklx=cf.GB2Uni(cw_zkxgjl_zklx);
		if (!(cw_zkxgjl_zklx.equals("")))	wheresql+=" and  (cw_zkxgjl.zklx='"+cw_zkxgjl_zklx+"')";
	}
	cw_zkxgjl_gxqzkl=request.getParameter("cw_zkxgjl_gxqzkl");
	if (cw_zkxgjl_gxqzkl!=null)
	{
		cw_zkxgjl_gxqzkl=cw_zkxgjl_gxqzkl.trim();
		if (!(cw_zkxgjl_gxqzkl.equals("")))	wheresql+=" and  (cw_zkxgjl.gxqzkl="+cw_zkxgjl_gxqzkl+") ";
	}
	cw_zkxgjl_gxhzkl=request.getParameter("cw_zkxgjl_gxhzkl");
	if (cw_zkxgjl_gxhzkl!=null)
	{
		cw_zkxgjl_gxhzkl=cw_zkxgjl_gxhzkl.trim();
		if (!(cw_zkxgjl_gxhzkl.equals("")))	wheresql+=" and  (cw_zkxgjl.gxhzkl="+cw_zkxgjl_gxhzkl+") ";
	}
	ls_sql="SELECT cw_zkxgjl.khbh,cw_zkxgjl.xgsj,cw_zkxgjl.khxm,crm_khxx.fwdz,crm_khxx.hth,dwmc,cw_zkxgjl.xgr, DECODE(cw_zkxgjl.zklx,'1','ȫ���ۿ�','2','����'),cw_zkxgjl.gxqzkl,cw_zkxgjl.gxqzjxzkl,cw_zkxgjl.gxqcdzwjmje,cw_zkxgjl.gxqglfjmje,cw_zkxgjl.gxqsjjmje   ,cw_zkxgjl.gxhzkl,cw_zkxgjl.gxhzjxzkl,cw_zkxgjl.gxhcdzwjmje,cw_zkxgjl.gxhglfjmje,cw_zkxgjl.gxhsjjmje,cw_zkxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_zkxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zkxgjl.khbh=crm_khxx.khbh(+) and cw_zkxgjl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zkxgjl.xgsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zkxgjlCxList.jsp","SelectCxCw_zkxgjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","xgsj","cw_zkxgjl_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_zkxgjl_fgsbh","cw_zkxgjl_xgr","cw_zkxgjl_zklx","cw_zkxgjl_gxqzkl","cw_zkxgjl_gxhzkl","cw_zkxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","xgsj"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">��ѯ���ۿ��޸ļ�¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ͻ����</td>
	<td  width="4%">�޸�ʱ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="3%">�޸���</td>
	<td  width="4%">�ۿ�����</td>
	<td  width="4%"><font color="#0000CC"><strong>����ǰ��ͬ�ۿ�</strong></font></td>
	<td  width="4%"><font color="#0000CC"><strong>����ǰ�������ۿ�</strong></font></td>
	<td  width="5%"><font color="#0000CC"><strong>����ǰ��ͬ�����</strong></font></td>
	<td  width="5%"><font color="#0000CC"><strong>����ǰ����Ѽ����</strong></font></td>
	<td  width="5%"><font color="#0000CC"><strong>����ǰ˰������</strong></font></td>

	<td  width="4%"><font color="#990033"><strong>���º��ͬ�ۿ�</strong></font></td>
	<td  width="4%"><font color="#990033"><strong>���º��������ۿ�</strong></font></td>
	<td  width="5%"><font color="#990033"><strong>���º��ͬ�����</strong></font></td>
	<td  width="5%"><font color="#990033"><strong>���º����Ѽ����</strong></font></td>
	<td  width="5%"><font color="#990033"><strong>���º�˰������</strong></font></td>
	<td  width="18%">��ע</td>
</tr>

<%
	pageObj.printDate();
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