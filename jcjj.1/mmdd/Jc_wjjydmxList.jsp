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

	ls_sql="SELECT jc_wjjydmx.yddbh as yddbh,jc_wjjydmx.xh as xh,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjbj.xinghao as jc_wjjbj_xinghao,TO_CHAR(jc_wjjydmx.dj) as jc_wjjydmx_dj,jc_wjjydmx.sl as jc_wjjydmx_sl,jc_wjjydmx.dj*jc_wjjydmx.sl je,jc_wjjydmx.bz as jc_wjjydmx_bz  ";
	ls_sql+=" FROM jc_wjjbj,jc_wjjydmx,jdm_wjjbm  ";
    ls_sql+=" where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.xh=jc_wjjydmx.xh";
    ls_sql+=" and jc_wjjydmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_wjjydmx.yddbh,jc_wjjydmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_wjjydmxList.jsp?yddbh="+yddbh,"","","EditJc_wjjydmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_wjjbm_wjjmc","jc_wjjbj_xinghao","jc_wjjydmx_dj","jc_wjjydmx_sl","je","jc_wjjydmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"yddbh","xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_wjjydmxList.jsp?yddbh="+yddbh};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from jc_wjjydmx where "+chooseitem;

		sql[1]="update jc_mmydd set yddwjje=NVL((select sum(dj*sl) from  jc_wjjydmx where yddbh='"+yddbh+"'),0)";
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
	<td  width="10%">&nbsp;</td>
	<td  width="12%">��������</td>
	<td  width="22%">�ͺ�</td>
	<td  width="8%">����</td>
	<td  width="10%">��������</td>
	<td  width="12%">�ܽ��</td>
	<td  width="30%">��ע</td>
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