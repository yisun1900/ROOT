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
	String mmdglxbm=null;
	String mmdglxmc=null;
	String tdjjl=null;
	mmdglxbm=request.getParameter("mmdglxbm");
	if (mmdglxbm!=null)
	{
		mmdglxbm=cf.GB2Uni(mmdglxbm);
		if (!(mmdglxbm.equals("")))	wheresql+=" and  (mmdglxbm='"+mmdglxbm+"')";
	}
	mmdglxmc=request.getParameter("mmdglxmc");
	if (mmdglxmc!=null)
	{
		mmdglxmc=cf.GB2Uni(mmdglxmc);
		if (!(mmdglxmc.equals("")))	wheresql+=" and  (mmdglxmc='"+mmdglxmc+"')";
	}
	tdjjl=request.getParameter("tdjjl");
	if (tdjjl!=null)
	{
		tdjjl=tdjjl.trim();
		if (!(tdjjl.equals("")))	wheresql+=" and  (tdjjl="+tdjjl+") ";
	}
	ls_sql="SELECT mmdglxbm,mmdglxmc,DECODE(jjfs,'11','ľ��','12','˫���ƿ�','13','˫�ڴ���','14','�����ƿ�','15','���ڴ���','21','������','22','�Ŷ���','31','��Ʈ������','32','��Ʈ��ƽ̨�Ͽ�','41','ƽ���׼Ƽ�','42','���׼Ƽ�','43','�ֶ�ƽ���׼Ƽ�','44','�ֶ����׼Ƽ�','45','�ֶΰ����ȼƼ�'),tdjjl||'%',bz  ";
	ls_sql+=" FROM jc_mmdglx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by mmdglxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmdglxList.jsp","SelectJc_mmdglx.jsp","","EditJc_mmdglx.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"mmdglxbm","mmdglxmc","tdjjl","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"mmdglxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mmdglxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] mmdglxbm = request.getParameterValues("mmdglxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(mmdglxbm,"mmdglxbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mmdglx where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="12%">ľ�Ŷ������ͱ���</td>
	<td  width="22%">ľ�Ŷ�����������</td>
	<td  width="14%">�Ƽ۷�ʽ</td>
	<td  width="10%">�ص��Ӽ���</td>
	<td  width="20%">��ע</td>
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