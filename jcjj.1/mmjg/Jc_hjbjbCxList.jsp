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
	String jc_hjbjb_mmdglxbm=null;
	String jc_hjbjb_kdjgqjbm=null;
	String jc_hjbjb_ysbm=null;
	String jc_hjbjb_dj=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_hjbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_hjbjb.dqbm='"+dqbm+"')";

	jc_hjbjb_mmdglxbm=request.getParameter("jc_hjbjb_mmdglxbm");
	if (jc_hjbjb_mmdglxbm!=null)
	{
		jc_hjbjb_mmdglxbm=cf.GB2Uni(jc_hjbjb_mmdglxbm);
		if (!(jc_hjbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_hjbjb.mmdglxbm='"+jc_hjbjb_mmdglxbm+"')";
	}
	jc_hjbjb_kdjgqjbm=request.getParameter("jc_hjbjb_kdjgqjbm");
	if (jc_hjbjb_kdjgqjbm!=null)
	{
		jc_hjbjb_kdjgqjbm=cf.GB2Uni(jc_hjbjb_kdjgqjbm);
		if (!(jc_hjbjb_kdjgqjbm.equals("")))	wheresql+=" and  (jc_hjbjb.kdjgqjbm='"+jc_hjbjb_kdjgqjbm+"')";
	}
	jc_hjbjb_ysbm=request.getParameter("jc_hjbjb_ysbm");
	if (jc_hjbjb_ysbm!=null)
	{
		jc_hjbjb_ysbm=cf.GB2Uni(jc_hjbjb_ysbm);
		if (!(jc_hjbjb_ysbm.equals("")))	wheresql+=" and  (jc_hjbjb.ysbm='"+jc_hjbjb_ysbm+"')";
	}
	jc_hjbjb_dj=request.getParameter("jc_hjbjb_dj");
	if (jc_hjbjb_dj!=null)
	{
		jc_hjbjb_dj=jc_hjbjb_dj.trim();
		if (!(jc_hjbjb_dj.equals("")))	wheresql+=" and  (jc_hjbjb.dj="+jc_hjbjb_dj+") ";
	}
	ls_sql="SELECT jc_hjbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_hjbjb.kdjgqjbm as kdjgqjbm,jdm_kdjgqj.kdjgqj as jdm_kdjgqj_kdjgqj,jc_hjbjb.ysbm as ysbm,mmczmc,jc_hjbjb.dj as jc_hjbjb_dj,jc_hjbjb.lrr,jc_hjbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_mmczbm,jdm_kdjgqj,jc_mmdglx,jc_hjbjb,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_hjbjb.ysbm=jdm_mmczbm.mmczbm(+) and jc_hjbjb.kdjgqjbm=jdm_kdjgqj.kdjgqjbm(+) and jc_hjbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=" and jc_hjbjb.dqbm=dm_dqbm.dqbm(+) and jc_hjbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('43','44','45')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_hjbjb.dqbm,jc_hjbjb.mmdglxbm,jc_hjbjb.kdjgqjbm,jc_hjbjb.ysbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_hjbjbCxList.jsp","SelectCxJc_hjbjb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_mmdglx_mmdglxmc","jdm_kdjgqj_kdjgqj","mmczmc","jc_hjbjb_dj","lrr","lrsj","dwmc","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mmdglxbm","kdjgqjbm","ysbm"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//�в����������Hash��
	spanColHash.put("jdm_kdjgqj_kdjgqj","1");//�в����������Hash��
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="17%">��������</td>
	<td  width="15%">��ȼ۸�����</td>
	<td  width="15%">����</td>
	<td  width="10%">����</td>
	<td  width="8%">¼����</td>
	<td  width="11%">¼��ʱ��</td>
	<td  width="15%">¼�벿��</td>
	<td  width="9%">��������</td>
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