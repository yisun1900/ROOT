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
	String shbh=null;
	String sqbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	shbh=request.getParameter("shbh");
	if (shbh!=null)
	{
		shbh=shbh.trim();
		if (!(shbh.equals("")))	wheresql+=" and (rs_ryzbsq.shbh="+shbh+") ";
	}
	sqbh=request.getParameter("sqbh");
	if (sqbh!=null)
	{
		sqbh=cf.GB2Uni(sqbh);
		if (!(sqbh.equals("")))	wheresql+=" and  (rs_ryzbsq.sqbh='"+sqbh+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (rs_ryzbsq.shjl='"+shjl+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (rs_ryzbsq.shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_ryzbsq.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_ryzbsq.shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_ryzbsq.shbh shbh,rs_ryzbsq.sqbh sqbh,rs_ryzbsqbm.shjlmc shjl,rs_ryzbsq.shr shr,rs_ryzbsq.shsj shsj,rs_ryzbsq.shyj shyj ";
	ls_sql+=" FROM rs_ryzbsq,rs_ryzbsqbm,rs_zpjh  ";
    ls_sql+=" where rs_ryzbsq.shjl=rs_ryzbsqbm.shjl and rs_zpjh.shbh=rs_ryzbsq.shbh and rs_zpjh.jhzt!='3'";
	ls_sql+=wheresql;

    ls_sql+=wheresql;
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("rs_ryzbsqList.jsp","Selectrs_ryzbsq.jsp","","Editrs_ryzbsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shbh","sqbh","shjl","shr","shsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"shbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_deleteSh.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
//	String[] shbh = request.getParameterValues("shbh");
//	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shbh,"shbh"));
//	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
//	{
//		String[] sql=new String[1];//Ҫִ�е�SQL
//		boolean needCommit=false;//����Ҫ������
//		sql[0]="delete from rs_ryzbsq where "+chooseitem;
//		pageObj.execDelete(sql,needCommit);
//	}
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
	<td  width="10%">��˱��</td>
	<td  width="12%">����������</td>
	<td  width="10%">��˽���</td>
	<td  width="10%">�����</td>
	<td  width="10%">���ʱ��</td>
	<td  width="40%">������</td>
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