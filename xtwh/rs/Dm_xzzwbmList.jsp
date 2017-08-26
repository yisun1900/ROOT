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
	String xzzwbm=null;
	String xzzwmc=null;
	String gzbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (dm_xzzwbm.xzzwbm='"+xzzwbm+"')";
	}
	xzzwmc=request.getParameter("xzzwmc");
	if (xzzwmc!=null)
	{
		xzzwmc=cf.GB2Uni(xzzwmc);
		if (!(xzzwmc.equals("")))	wheresql+=" and  (dm_xzzwbm.xzzwmc='"+xzzwmc+"')";
	}
	gzbm=request.getParameter("gzbm");
	if (gzbm!=null)
	{
		gzbm=cf.GB2Uni(gzbm);
		if (!(gzbm.equals("")))	wheresql+=" and  (dm_xzzwbm.gzbm='"+gzbm+"')";
	}
	ls_sql="SELECT xzzwbm,xzzwmc,zwmc,zwflmc,gwzz  ";
	ls_sql+=" FROM dm_xzzwbm,dm_zwbm,dm_zwflbm  ";
    ls_sql+=" where dm_xzzwbm.gzbm=dm_zwbm.zwbm and dm_xzzwbm.zwflbm=dm_zwflbm.zwflbm(+)";
    ls_sql+=wheresql;
     ls_sql+=" order by xzzwbm";
   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_xzzwbmList.jsp","SelectDm_xzzwbm.jsp","","EditDm_xzzwbm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xzzwbm","xzzwmc","gzbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xzzwbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_xzzwbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xzzwbm = request.getParameterValues("xzzwbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xzzwbm,"xzzwbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_xzzwbm where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="8%">ְ�����</td>
	<td  width="12%">ְ������</td>
	<td  width="12%">����</td>
	<td  width="12%">ְ�����</td>
	<td  width="48%">��λְ��</td>
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