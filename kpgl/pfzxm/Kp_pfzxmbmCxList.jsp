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
	String kp_pfzxmbm_pfxmbm=null;
	String kp_pfzxmbm_xjlxbm=null;
	String kp_pfzxmbm_fz=null;
	kp_pfzxmbm_pfxmbm=request.getParameter("kp_pfzxmbm_pfxmbm");
	if (kp_pfzxmbm_pfxmbm!=null)
	{
		kp_pfzxmbm_pfxmbm=cf.GB2Uni(kp_pfzxmbm_pfxmbm);
		if (!(kp_pfzxmbm_pfxmbm.equals("")))	wheresql+=" and  (kp_pfzxmbm.pfxmbm='"+kp_pfzxmbm_pfxmbm+"')";
	}
	kp_pfzxmbm_xjlxbm=request.getParameter("kp_pfzxmbm_xjlxbm");
	if (kp_pfzxmbm_xjlxbm!=null)
	{
		kp_pfzxmbm_xjlxbm=cf.GB2Uni(kp_pfzxmbm_xjlxbm);
		if (!(kp_pfzxmbm_xjlxbm.equals("")))	wheresql+=" and  (kp_pfzxmbm.xjlxbm='"+kp_pfzxmbm_xjlxbm+"')";
	}
	kp_pfzxmbm_fz=request.getParameter("kp_pfzxmbm_fz");
	if (kp_pfzxmbm_fz!=null)
	{
		kp_pfzxmbm_fz=kp_pfzxmbm_fz.trim();
		if (!(kp_pfzxmbm_fz.equals("")))	wheresql+=" and (kp_pfzxmbm.fz="+kp_pfzxmbm_fz+") ";
	}
	ls_sql="SELECT kp_pfzxmbm.pfxmbm,kp_pfxmbm.pfxmmc,kp_pfzxmbm.xjlxbm,kp_xjlxbm.xjlxmc,kp_pfzxmbm.fz  ";
	ls_sql+=" FROM kp_xjlxbm,kp_pfxmbm,kp_pfzxmbm  ";
    ls_sql+=" where kp_pfzxmbm.xjlxbm=kp_xjlxbm.xjlxbm(+) and kp_pfzxmbm.pfxmbm=kp_pfxmbm.pfxmbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pfzxmbm.pfxmbm,kp_pfzxmbm.xjlxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_pfzxmbmCxList.jsp","SelectCxKp_pfzxmbm.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pfxmbm","kp_pfxmbm_pfxmmc","xjlxbm","kp_xjlxbm_xjlxmc","kp_pfzxmbm_fz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pfxmbm","xjlxbm"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pfxmbm","1");//�в����������Hash��
	spanColHash.put("pfxmmc","1");//�в����������Hash��
	spanColHash.put("xjlxbm","1");//�в����������Hash��
	spanColHash.put("xjlxmc","1");//�в����������Hash��
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
	<td  width="10%">������Ŀ����</td>
	<td  width="30%">������Ŀ����</td>
	<td  width="10%">Ѳ�����ͱ���</td>
	<td  width="30%">Ѳ����������</td>
	<td  width="10%">��ֵ</td>
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