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
	String clxlbm=null;
	String clxlmc=null;
	String cldlmc=null;
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clxlbm.clxlbm='"+clxlbm+"')";
	}
	clxlmc=request.getParameter("clxlmc");
	if (clxlmc!=null)
	{
		clxlmc=cf.GB2Uni(clxlmc);
		if (!(clxlmc.equals("")))	wheresql+=" and  (jxc_clxlbm.clxlmc='"+clxlmc+"')";
	}
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (jxc_clxlbm.cldlmc='"+cldlmc+"')";
	}

	String cldllb=null;
	cldllb=request.getParameter("cldllb");
	if (cldllb!=null)
	{
		cldllb=cf.GB2Uni(cldllb);
		if (!(cldllb.equals("")))	wheresql+=" and  (jxc_cldlbm.cldllb='"+cldllb+"')";
	}
	
	ls_sql="SELECT clxlbm,clxlmc,tcslxz,ccbfjj,jxc_clxlbm.cldlmc,decode(jxc_cldlbm.cldllb,'1','����','2','������','3','ͨ����') ";
	ls_sql+=" FROM jxc_clxlbm,jxc_cldlbm ";
    ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by jxc_cldlbm.cldllb,jxc_clxlbm.cldlmc,clxlbm ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clxlbmCxList.jsp","SelectCxJxc_clxlbm.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clxlbm","clxlmc","cldlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clxlbm"};
	pageObj.setKey(keyName);
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
	<td  width="10%">����С�����</td>
	<td  width="32%">����С������</td>
	<td  width="10%">�ײ���������</td>
	<td  width="10%">�������ּӼ�</td>
	<td  width="22%">���ϴ�������</td>
	<td  width="8%">���</td>
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