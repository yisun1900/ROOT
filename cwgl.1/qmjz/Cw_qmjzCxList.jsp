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
	String jzrq=null;
	String jzr=null;
	String sqjzrq=null;
	jzrq=request.getParameter("jzrq");
	if (jzrq!=null)
	{
		jzrq=jzrq.trim();
		if (!(jzrq.equals("")))	wheresql+="  and (cw_qmjz.jzrq=TO_DATE('"+jzrq+"','YYYY/MM/DD'))";
	}
	jzr=request.getParameter("jzr");
	if (jzr!=null)
	{
		jzr=cf.GB2Uni(jzr);
		if (!(jzr.equals("")))	wheresql+=" and  (cw_qmjz.jzr='"+jzr+"')";
	}
	sqjzrq=request.getParameter("sqjzrq");
	if (sqjzrq!=null)
	{
		sqjzrq=sqjzrq.trim();
		if (!(sqjzrq.equals("")))	wheresql+="  and (sqjzrq=TO_DATE('"+sqjzrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT TO_CHAR(jzrq,'YYYY-MM-DD') jzrq,cw_qmjz.dwbh,dwmc,jzr,czsj,TO_CHAR(sqjzrq,'YYYY-MM-DD') sqjzrq,khzs,qyze,tdkhzs,tdqyze,qyze-tdqyze je";
	ls_sql+=" FROM cw_qmjz,sq_dwxx  ";
	ls_sql+=" where cw_qmjz.dwbh=sq_dwxx.dwbh  ";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_qmjz.dwbh,cw_qmjz.jzrq desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_qmjzCxList.jsp","","dmcztjb.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"jzrq","dwmc","jzr","czsj","sqjzrq","khzs","qyze","tdkhzs","tdqyze","je"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"jzrq","dwbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("ͳ��");
	pageObj.setDateType("long");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jzrq","dwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_qmjz.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jzrq",coluParm);//�в����������Hash��
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">ҵ����תʱ��</td>
	<td  width="9%">�ֹ�˾</td>
	<td  width="5%">��ת��</td>
	<td  width="13%">����ʱ��</td>
	<td  width="8%">���ڽ�ת����</td>
	<td  width="8%">ǩԼ����</td>
	<td  width="13%">ǩԼҵ���ܶ�</td>
	<td  width="8%">�˵�����</td>
	<td  width="11%">�˵�ҵ���ܶ�</td>
	<td  width="13%">ҵ���ܶ�</td>
</tr>
<%
	pageObj.displayDateSum();
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