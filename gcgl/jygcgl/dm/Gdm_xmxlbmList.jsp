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
	String gdm_xmxlbm_xmxlbm=null;
	String gdm_xmxlbm_xmxlmc=null;
	String gdm_xmxlbm_xmdlbm=null;
	String gdm_xmdlbm_xmdlmc=null;
	gdm_xmxlbm_xmxlbm=request.getParameter("gdm_xmxlbm_xmxlbm");
	if (gdm_xmxlbm_xmxlbm!=null)
	{
		gdm_xmxlbm_xmxlbm=cf.GB2Uni(gdm_xmxlbm_xmxlbm);
		if (!(gdm_xmxlbm_xmxlbm.equals("")))	wheresql+=" and  (gdm_xmxlbm.xmxlbm='"+gdm_xmxlbm_xmxlbm+"')";
	}
	gdm_xmxlbm_xmxlmc=request.getParameter("gdm_xmxlbm_xmxlmc");
	if (gdm_xmxlbm_xmxlmc!=null)
	{
		gdm_xmxlbm_xmxlmc=cf.GB2Uni(gdm_xmxlbm_xmxlmc);
		if (!(gdm_xmxlbm_xmxlmc.equals("")))	wheresql+=" and  (gdm_xmxlbm.xmxlmc='"+gdm_xmxlbm_xmxlmc+"')";
	}
	gdm_xmxlbm_xmdlbm=request.getParameter("gdm_xmxlbm_xmdlbm");
	if (gdm_xmxlbm_xmdlbm!=null)
	{
		gdm_xmxlbm_xmdlbm=cf.GB2Uni(gdm_xmxlbm_xmdlbm);
		if (!(gdm_xmxlbm_xmdlbm.equals("")))	wheresql+=" and  (gdm_xmxlbm.xmdlbm='"+gdm_xmxlbm_xmdlbm+"')";
	}
	gdm_xmdlbm_xmdlmc=request.getParameter("gdm_xmdlbm_xmdlmc");
	if (gdm_xmdlbm_xmdlmc!=null)
	{
		gdm_xmdlbm_xmdlmc=cf.GB2Uni(gdm_xmdlbm_xmdlmc);
		if (!(gdm_xmdlbm_xmdlmc.equals("")))	wheresql+=" and  (gdm_xmdlbm.xmdlmc='"+gdm_xmdlbm_xmdlmc+"')";
	}
	ls_sql="SELECT gdm_xmxlbm.xmxlbm,gdm_xmxlbm.xmxlmc,gdm_xmxlbm.xmdlbm,gdm_xmdlbm.xmdlmc  ";
	ls_sql+=" FROM gdm_xmdlbm,gdm_xmxlbm  ";
    ls_sql+=" where gdm_xmxlbm.xmdlbm=gdm_xmdlbm.xmdlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_xmxlbm.xmdlbm,gdm_xmxlbm.xmxlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_xmxlbmList.jsp","","","EditGdm_xmxlbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmxlbm","gdm_xmxlbm_xmxlmc","gdm_xmxlbm_xmdlbm","gdm_xmdlbm_xmdlmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmxlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Gdm_xmxlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xmxlbm = request.getParameterValues("xmxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmxlbm,"xmxlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from gdm_xmxlbm where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="22%">��ĿС�����</td>
	<td  width="22%">��ĿС������</td>
	<td  width="22%">��Ŀ�������</td>
	<td  width="22%">��Ŀ��������</td>
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