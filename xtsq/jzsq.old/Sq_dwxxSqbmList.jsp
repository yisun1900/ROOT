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

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssfgs) ssdwmc,DECODE(dwlx,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','F3','����С��','J0','������') as dwlx,sq_dwxx.cwdm,sq_dwxx.hthqz,DECODE(sfjms,'Y','������','N','��'),DECODE(sq_dwxx.cxbz,'Y','����','N',''),sq_dwxx.kdsj,sq_dwxx.gdsj";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where sq_dwxx.dwlx in('F2') and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.dwbh";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_dwxxSqbmList.jsp","","","PlOneDmSq.jsp");

/*
//������ʾ��
	String[] disColName={"dwbh","dwmc","dwfzr","dwdh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("������Ȩ");
	pageObj.setEditBolt("");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_dwxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("dwbh",coluParm);//�в����������Hash��
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
  <B><font size="3">������������Ȩ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="7%">��λ���</td>
	<td  width="17%">��λ����</td>
	<td  width="13%">�����ֹ�˾</td>
	<td  width="7%">��λ����</td>
	<td  width="8%">�������</td>
	<td  width="8%">��ͬ��ǰ׺</td>
	<td  width="7%">�Ƿ������</td>
	<td  width="7%">������־</td>
	<td  width="9%">����ʱ��</td>
	<td  width="9%">�ص�ʱ��</td>
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