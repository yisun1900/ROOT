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
	String xh=null;
	String ssfgs=null;
	String gzfw=null;
	String gzxx=null;
	String gzsx=null;
	String gsbl=null;
	String gdsj=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ssfgs='"+ssfgs+"')";
	}
	gzfw=request.getParameter("gzfw");
	if (gzfw!=null)
	{
		gzfw=cf.GB2Uni(gzfw);
		if (!(gzfw.equals("")))	wheresql+=" and  (gzfw='"+gzfw+"')";
	}
	gzxx=request.getParameter("gzxx");
	if (gzxx!=null)
	{
		gzxx=gzxx.trim();
		if (!(gzxx.equals("")))	wheresql+=" and  (gzxx="+gzxx+") ";
	}
	gzsx=request.getParameter("gzsx");
	if (gzsx!=null)
	{
		gzsx=gzsx.trim();
		if (!(gzsx.equals("")))	wheresql+=" and  (gzsx="+gzsx+") ";
	}
	gsbl=request.getParameter("gsbl");
	if (gsbl!=null)
	{
		gsbl=gsbl.trim();
		if (!(gsbl.equals("")))	wheresql+=" and  (gsbl="+gsbl+") ";
	}
	gdsj=request.getParameter("gdsj");
	if (gdsj!=null)
	{
		gdsj=gdsj.trim();
		if (!(gdsj.equals("")))	wheresql+=" and  (gdsj="+gdsj+") ";
	}
	ls_sql="SELECT rs_ksbl.xh,dwmc,rs_ksbl.gzfw,rs_ksbl.gzxx,rs_ksbl.gzsx,rs_ksbl.gsbl,rs_ksbl.gdsj  ";
	ls_sql+=" FROM rs_ksbl,sq_dwxx  ";
    ls_sql+=" where rs_ksbl.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ksblList.jsp","","","EditRs_ksbl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ssfgs","gzfw","gzxx","gzsx","gsbl","gdsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_ksblList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_ksbl where "+chooseitem;
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
	<td  width="12%">���</td>
	<td  width="12%">�ֹ�˾</td>
	<td  width="12%">���ʷ�Χ</td>
	<td  width="12%">��������</td>
	<td  width="12%">��������</td>
	<td  width="12%">��˰����</td>
	<td  width="12%">�̶�˰��</td>
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