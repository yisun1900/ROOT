<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_blydmx.yddbh as yddbh,jc_blydmx.blxhbm as blxhbm,jc_blbj.blxh as jc_blbj_blxh,TO_CHAR(jc_blydmx.dj) as jc_blydmx_dj,jc_blydmx.sl as jc_blydmx_sl,jc_blydmx.dj*jc_blydmx.sl je,jc_blydmx.bz as jc_blydmx_bz  ";
	ls_sql+=" FROM jc_blbj,jc_blydmx  ";
    ls_sql+=" where jc_blydmx.blxhbm=jc_blbj.blxhbm";
    ls_sql+=" and jc_blydmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_blydmx.blxhbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_blydmxList.jsp?yddbh="+yddbh,"","","EditJc_blydmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_blbj_blxh","jc_blydmx_dj","jc_blydmx_sl","je","jc_blydmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"yddbh","blxhbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_blydmxList.jsp?yddbh="+yddbh};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[3];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jc_blydmx where "+chooseitem;

		sql[1]="update jc_mmydd set yddblje=NVL((select sum(dj*sl) from  jc_blydmx where yddbh='"+yddbh+"'),0)";
		sql[1]+=" where yddbh='"+yddbh+"'";

		sql[2]="update jc_mmydd set yddbzje=yddmmje+yddwjje+yddblje,yddze=yddmmje*mmzkl/10+yddwjje*wjzkl/10+yddblje*blzkl/10";
		sql[2]+=" where yddbh='"+yddbh+"'";

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
  <B><font size="3">����Ԥ����ϸ�����ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="40%">�����ͺ�</td>
	<td  width="10%">����</td>
	<td  width="10%">��������</td>
	<td  width="10%">���</td>
	<td  width="20%">��ע</td>
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