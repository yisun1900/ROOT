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
	String jc_mdcbjjb_mlx=null;
	String jc_mdcbjjb_mdjgqjbm=null;
	String jc_mdcbjjb_jjl=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mdcbjjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mdcbjjb.dqbm='"+dqbm+"')";

	jc_mdcbjjb_mlx=request.getParameter("jc_mdcbjjb_mlx");
	if (jc_mdcbjjb_mlx!=null)
	{
		jc_mdcbjjb_mlx=cf.GB2Uni(jc_mdcbjjb_mlx);
		if (!(jc_mdcbjjb_mlx.equals("")))	wheresql+=" and  (jc_mdcbjjb.mlx='"+jc_mdcbjjb_mlx+"')";
	}
	jc_mdcbjjb_mdjgqjbm=request.getParameter("jc_mdcbjjb_mdjgqjbm");
	if (jc_mdcbjjb_mdjgqjbm!=null)
	{
		jc_mdcbjjb_mdjgqjbm=cf.GB2Uni(jc_mdcbjjb_mdjgqjbm);
		if (!(jc_mdcbjjb_mdjgqjbm.equals("")))	wheresql+=" and  (jc_mdcbjjb.mdjgqjbm='"+jc_mdcbjjb_mdjgqjbm+"')";
	}
	jc_mdcbjjb_jjl=request.getParameter("jc_mdcbjjb_jjl");
	if (jc_mdcbjjb_jjl!=null)
	{
		jc_mdcbjjb_jjl=jc_mdcbjjb_jjl.trim();
		if (!(jc_mdcbjjb_jjl.equals("")))	wheresql+=" and  (jc_mdcbjjb.jjl="+jc_mdcbjjb_jjl+") ";
	}
	ls_sql="SELECT  jc_mdcbjjb.mlx as mlx,mlxmc,jc_mdcbjjb.mdjgqjbm as mdjgqjbm,jdm_mdjgqj.mdjgqj as jdm_mdjgqj_mdjgqj,jc_mdcbjjb.jjl||'%' as jc_mdcbjjb_jjl,jc_mdcbjjb.lrr,jc_mdcbjjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_mdjgqj,jc_mdcbjjb,jdm_mlx,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mdcbjjb.mdjgqjbm=jdm_mdjgqj.mdjgqjbm(+) and jc_mdcbjjb.mlx=jdm_mlx.mlx(+) ";
    ls_sql+=" and jc_mdcbjjb.dqbm=dm_dqbm.dqbm(+) and jc_mdcbjjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order  by jc_mdcbjjb.dqbm,jc_mdcbjjb.mlx,jc_mdcbjjb.mdjgqjbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mdcbjjbCxList.jsp","SelectCxJc_mdcbjjb.jsp","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"mlxmc","jdm_mdjgqj_mdjgqj","jc_mdcbjjb_jjl","lrr","lrsj","dwmc","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mlx","mdjgqjbm"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mlxmc","1");//�в����������Hash��
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
	<td  width="20%">������</td>
	<td  width="22%">�Ŷ��۸�����</td>
	<td  width="11%">ÿ���żӼ���</td>
	<td  width="10%">¼����</td>
	<td  width="12%">¼��ʱ��</td>
	<td  width="16%">¼�벿��</td>
	<td  width="10%">��������</td>
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