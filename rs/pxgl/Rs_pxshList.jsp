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
	String pxjhbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	shbh=request.getParameter("shbh");
	if (shbh!=null)
	{
		shbh=shbh.trim();
		if (!(shbh.equals("")))	wheresql+=" and (rs_pxsh.shbh="+shbh+") ";
	}
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (rs_pxsh.pxjhbh='"+pxjhbh+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (rs_pxsh.shjl='"+shjl+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (rs_pxsh.shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_pxsh.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (rs_pxsh.shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_pxsh.shbh shbh,rs_pxsh.pxjhbh pxjhbh,rs_pxshbm.shjlmc shjl,rs_pxsh.shr shr,rs_pxsh.shsj shsj,rs_pxsh.shyj shyj ";
	ls_sql+=" FROM rs_pxsh,rs_pxshbm,rs_pxjh  ";
    ls_sql+=" where rs_pxsh.shjl=rs_pxshbm.shjl and rs_pxjh.shbh=rs_pxsh.shbh and rs_pxjh.jhzt!='3'";
	ls_sql+=wheresql;

    ls_sql+=wheresql;
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_pxshList.jsp","SelectRs_pxsh.jsp","","EditRs_pxsh.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shbh","pxjhbh","shjl","shr","shsj"};
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
//		sql[0]="delete from rs_pxsh where "+chooseitem;
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
	<td  width="12%">��Ƹ�ƻ����</td>
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