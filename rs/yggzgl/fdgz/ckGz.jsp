<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String xh=request.getParameter("xh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT dwmc,TO_CHAR(ygbh) ygbh,bianhao,yhmc,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz,rs_yggzb.bz";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("ckGz.jsp?xh="+xh,"","","EditRs_yggzb.jsp?xh="+xh);
	pageObj.setPageRow(2000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ygbh","bianhao","yhmc","dwbh","glgz","gwgz","jbgz","jtbt","cb","dhbt","yjsxe","jj","qtbt","qtkk","tc","ksk","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"ckGz.jsp?xh="+xh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] ygbh = request.getParameterValues("ygbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ygbh,"ygbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_yggzb where "+chooseitem;
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
  <B><font size="3">�鿴������Ϣ����ţ�<%=xh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">��������</td>
	<td  width="4%">Ա�����</td>
	<td  width="5%">����</td>
	<td  width="5%">Ա������</td>
	<td  width="5%">���乤��</td>
	<td  width="5%">��λ����</td>
	<td  width="5%">��н</td>
	<td  width="5%">��ͨ����</td>
	<td  width="4%">�Ͳ�</td>
	<td  width="4%">�绰��</td>
	<td  width="4%">�۱���</td>
	<td  width="5%">����</td>
	<td  width="5%">��������</td>
	<td  width="5%">�����ۿ�</td>
	<td  width="5%">���</td>
	<td  width="5%">˰ǰ����</td>
	<td  width="5%">��˰��</td>
	<td  width="5%">˰����</td>
	<td  width="7%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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