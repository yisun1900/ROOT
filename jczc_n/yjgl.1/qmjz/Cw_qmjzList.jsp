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
	String yjjzsj=null;
	String jzr=null;
	String sqjzrq=null;
	yjjzsj=request.getParameter("yjjzsj");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (yjjzsj=TO_DATE('"+yjjzsj+"','YYYY/MM/DD'))";
	}
	jzr=request.getParameter("jzr");
	if (jzr!=null)
	{
		jzr=cf.GB2Uni(jzr);
		if (!(jzr.equals("")))	wheresql+=" and  (jzr='"+jzr+"')";
	}
	sqjzrq=request.getParameter("sqjzrq");
	if (sqjzrq!=null)
	{
		sqjzrq=sqjzrq.trim();
		if (!(sqjzrq.equals("")))	wheresql+="  and (sqjzrq=TO_DATE('"+sqjzrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT yjjzsj,jzr,sqjzrq,khzs,qyze,tdkhzs,tdqyze,qyze-tdqyze";
	ls_sql+=" FROM cw_qmjz  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by yjjzsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_qmjzList.jsp","SelectCw_qmjz.jsp","","DeleteCw_qmjz.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yjjzsj","jzr","sqjzrq","khzs","qyze"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"yjjzsj"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("ɾ����ת");


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"yjjzsj"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_qmjz.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yjjzsj",coluParm);//�в����������Hash��
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
  <B><font size="3">ҵ����ĩ��ת</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="11%">ҵ����תʱ��</td>
	<td  width="9%">��ת��</td>
	<td  width="11%">���ڽ�ת����</td>
	<td  width="10%">ǩԼ����</td>
	<td  width="14%">ǩԼҵ���ܶ�</td>
	<td  width="10%">�˵�����</td>
	<td  width="14%">�˵�ҵ���ܶ�</td>
	<td  width="14%">ҵ���ܶ�</td>
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