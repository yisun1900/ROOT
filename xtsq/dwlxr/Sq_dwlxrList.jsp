<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=request.getParameter("dwbh");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT sq_dwlxr.lxrxm as lxrxm,sq_dwlxr.zw as sq_dwlxr_zw,sq_dwlxr.sj as sq_dwlxr_sj,sq_dwlxr.bgdh as sq_dwlxr_bgdh,sq_dwlxr.cz as sq_dwlxr_cz, DECODE(sq_dwlxr.sflz,'Y','��','N','��') as sq_dwlxr_sflz,sq_dwlxr.bz as sq_dwlxr_bz  ";
	ls_sql+=" FROM sq_dwlxr  ";
    ls_sql+=" where sq_dwlxr.dwbh='"+dwbh+"'";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Sq_dwlxrList.jsp?dwbh="+dwbh,"","","EditSq_dwlxr.jsp?dwbh="+dwbh);
	pageObj.setPageRow(20);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwbh","sq_dwxx_dwmc","lxrxm","sq_dwlxr_zw","sq_dwlxr_sj","sq_dwlxr_bgdh","sq_dwlxr_cz","sq_dwlxr_sflz","sq_dwlxr_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lxrxm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Sq_dwlxrList.jsp?dwbh="+dwbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] lxrxm = request.getParameterValues("lxrxm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lxrxm,"lxrxm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from sq_dwlxr where dwbh='"+dwbh+"' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ϵ����Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">��ϵ������</td>
	<td  width="10%">ְ��</td>
	<td  width="14%">�ֻ�</td>
	<td  width="22%">�칫�绰</td>
	<td  width="12%">����</td>
	<td  width="8%">�Ƿ���ְ</td>
	<td  width="10%">��ע</td>
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