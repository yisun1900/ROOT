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
	pageObj.initPage("Jc_mmdglxCxList.jsp","SelectCxJc_mmdglx.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"mmdglxbm","mmdglxmc","tdjjl","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"mmdglxbm"};
	pageObj.setKey(keyName);
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
	<td  width="15%">ľ�Ŷ������ͱ���</td>
	<td  width="25%">ľ�Ŷ�����������</td>
	<td  width="15%">�Ƽ۷�ʽ</td>
	<td  width="12%">�ص��Ӽ���</td>
	<td  width="23%">��ע</td>
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