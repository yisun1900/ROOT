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
	String jxc_hwmc_hwbh=null;
	String jxc_hwmc_hwmc=null;
	String jxc_hwmc_hjbh=null;
	String jxc_hwmc_ckbh=null;
	String jxc_hwmc_dqbm=null;
	jxc_hwmc_ckbh=request.getParameter("jxc_hwmc_ckbh");
	if (jxc_hwmc_ckbh!=null)
	{
		jxc_hwmc_ckbh=cf.GB2Uni(jxc_hwmc_ckbh);
		if (!(jxc_hwmc_ckbh.equals("")))	wheresql+=" and  (jxc_hjmc.ckbh='"+jxc_hwmc_ckbh+"')";
	}
	jxc_hwmc_dqbm=request.getParameter("jxc_hwmc_dqbm");
	if (jxc_hwmc_dqbm!=null)
	{
		jxc_hwmc_dqbm=cf.GB2Uni(jxc_hwmc_dqbm);
		if (!(jxc_hwmc_dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+jxc_hwmc_dqbm+"')";
	}

	jxc_hwmc_hwbh=request.getParameter("jxc_hwmc_hwbh");
	if (jxc_hwmc_hwbh!=null)
	{
		jxc_hwmc_hwbh=cf.GB2Uni(jxc_hwmc_hwbh);
		if (!(jxc_hwmc_hwbh.equals("")))	wheresql+=" and  (jxc_hwmc.hwbh='"+jxc_hwmc_hwbh+"')";
	}
	jxc_hwmc_hwmc=request.getParameter("jxc_hwmc_hwmc");
	if (jxc_hwmc_hwmc!=null)
	{
		jxc_hwmc_hwmc=cf.GB2Uni(jxc_hwmc_hwmc);
		if (!(jxc_hwmc_hwmc.equals("")))	wheresql+=" and  (jxc_hwmc.hwmc='"+jxc_hwmc_hwmc+"')";
	}
	jxc_hwmc_hjbh=request.getParameter("jxc_hwmc_hjbh");
	if (jxc_hwmc_hjbh!=null)
	{
		jxc_hwmc_hjbh=cf.GB2Uni(jxc_hwmc_hjbh);
		if (!(jxc_hwmc_hjbh.equals("")))	wheresql+=" and  (jxc_hwmc.hjbh='"+jxc_hwmc_hjbh+"')";
	}
	ls_sql="SELECT dm_dqbm.dqmc dqmc,jxc_ckmc.ckmc ckmc,jxc_hjmc.hjmc hjmc,jxc_hwmc.hwmc hwmc,hwbh  ";
	ls_sql+=" FROM jxc_hwmc,jxc_hjmc,jxc_ckmc,dm_dqbm  ";
    ls_sql+=" where jxc_hwmc.hjbh=jxc_hjmc.hjbh and jxc_hjmc.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
	ls_sql+=" order by dqmc,ckmc,hjmc,hwmc ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_hwmcCxList.jsp","SelectCxJxc_hwmc.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hwbh","jxc_hwmc_hwmc","jxc_hwmc_hjbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hwbh"};
	pageObj.setKey(keyName);
	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("ckmc","1");//�в����������Hash��
	spanColHash.put("hjmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
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
	<td  width="20%">��������</td>
	<td  width="20%">�����ֿ�</td>
	<td  width="20%">��������</td>
	<td  width="20%">��λ����</td>
	<td  width="20%">��λ���</td>
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