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
	String jc_qhcbjjb_mmdglxbm=null;
	String jc_qhcbjjb_qhjgqjbm=null;
	String jc_qhcbjjb_mmjjl=null;
	jc_qhcbjjb_mmdglxbm=request.getParameter("jc_qhcbjjb_mmdglxbm");
	if (jc_qhcbjjb_mmdglxbm!=null)
	{
		jc_qhcbjjb_mmdglxbm=cf.GB2Uni(jc_qhcbjjb_mmdglxbm);
		if (!(jc_qhcbjjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_qhcbjjb.mmdglxbm='"+jc_qhcbjjb_mmdglxbm+"')";
	}
	jc_qhcbjjb_qhjgqjbm=request.getParameter("jc_qhcbjjb_qhjgqjbm");
	if (jc_qhcbjjb_qhjgqjbm!=null)
	{
		jc_qhcbjjb_qhjgqjbm=cf.GB2Uni(jc_qhcbjjb_qhjgqjbm);
		if (!(jc_qhcbjjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_qhcbjjb.qhjgqjbm='"+jc_qhcbjjb_qhjgqjbm+"')";
	}
	jc_qhcbjjb_mmjjl=request.getParameter("jc_qhcbjjb_mmjjl");
	if (jc_qhcbjjb_mmjjl!=null)
	{
		jc_qhcbjjb_mmjjl=jc_qhcbjjb_mmjjl.trim();
		if (!(jc_qhcbjjb_mmjjl.equals("")))	wheresql+=" and  (jc_qhcbjjb.mmjjl="+jc_qhcbjjb_mmjjl+") ";
	}
	ls_sql="SELECT jc_qhcbjjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_qhcbjjb.qhjgqjbm as qhjgqjbm,jdm_qhjgqj.qhjgqj as jdm_qhjgqj_qhjgqj,jc_qhcbjjb.mmjjl||'%' jc_qhcbjjb_mmjjl  ";
	ls_sql+=" FROM jdm_qhjgqj,jc_mmdglx,jc_qhcbjjb  ";
    ls_sql+=" where jc_qhcbjjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_qhcbjjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_qhcbjjb.qhjgqjbm,jc_qhcbjjb.mmdglxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_qhcbjjbCxList.jsp","SelectCxJc_qhcbjjb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_mmdglx_mmdglxmc","jdm_qhjgqj_qhjgqj","jc_qhcbjjb_mmjjl"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mmdglxbm","qhjgqjbm"};
	pageObj.setKey(keyName);
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
	<td  width="20%">ľ�Ŷ�������</td>
	<td  width="20%">ǽ��۸�����</td>
	<td  width="10%">ÿ�׼Ӽ���</td>
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