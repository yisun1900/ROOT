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
	String zqs=null;
	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	String lrr=null;
	String lrsj=null;
	zqs=request.getParameter("zqs");
	if (zqs!=null)
	{
		zqs=zqs.trim();
		if (!(zqs.equals("")))	wheresql+=" and (zqs="+zqs+") ";
	}
	yy_rqsd_szs=request.getParameter("yy_rqsd_szs");
	if (yy_rqsd_szs!=null)
	{
		yy_rqsd_szs=yy_rqsd_szs.trim();
		if (!(yy_rqsd_szs.equals("")))	wheresql+="  and (yy_rqsd_szs=TO_DATE('"+yy_rqsd_szs+"','YYYY/MM/DD'))";
	}
	yy_rqsd_sze=request.getParameter("yy_rqsd_sze");
	if (yy_rqsd_sze!=null)
	{
		yy_rqsd_sze=yy_rqsd_sze.trim();
		if (!(yy_rqsd_sze.equals("")))	wheresql+="  and (yy_rqsd_sze=TO_DATE('"+yy_rqsd_sze+"','YYYY/MM/DD'))";
	}
	yy_rqsd_bzs=request.getParameter("yy_rqsd_bzs");
	if (yy_rqsd_bzs!=null)
	{
		yy_rqsd_bzs=yy_rqsd_bzs.trim();
		if (!(yy_rqsd_bzs.equals("")))	wheresql+="  and (yy_rqsd_bzs=TO_DATE('"+yy_rqsd_bzs+"','YYYY/MM/DD'))";
	}
	yy_rqsd_bze=request.getParameter("yy_rqsd_bze");
	if (yy_rqsd_bze!=null)
	{
		yy_rqsd_bze=yy_rqsd_bze.trim();
		if (!(yy_rqsd_bze.equals("")))	wheresql+="  and (yy_rqsd_bze=TO_DATE('"+yy_rqsd_bze+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze,lrr,lrsj  ";
	ls_sql+=" FROM yy_rqsd  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_rqsd_szs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_rqsdList.jsp","","","EditYy_rqsd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zqs","yy_rqsd_szs","yy_rqsd_sze","yy_rqsd_bzs","yy_rqsd_bze","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_rqsdList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] zqs = request.getParameterValues("zqs");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zqs,"zqs"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from yy_rqsd where "+chooseitem;
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
	<td  width="12%">������</td>
	<td  width="14%">�������ڿ�ʼ</td>
	<td  width="14%">�������ڽ���</td>
	<td  width="14%">�������ڿ�ʼ</td>
	<td  width="14%">�������ڽ���</td>
	<td  width="12%">¼����</td>
	<td  width="12%">¼��ʱ��</td>
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