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
	String fdmc=null;
	String qd=null;
	String zd=null;
	String tcbfb=null;
	String fgsbh=null;
	String sjsjb=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	fdmc=request.getParameter("fdmc");
	if (fdmc!=null)
	{
		fdmc=cf.GB2Uni(fdmc);
		if (!(fdmc.equals("")))	wheresql+=" and  (fdmc='"+fdmc+"')";
	}
	qd=request.getParameter("qd");
	if (qd!=null)
	{
		qd=qd.trim();
		if (!(qd.equals("")))	wheresql+=" and  (qd="+qd+") ";
	}
	zd=request.getParameter("zd");
	if (zd!=null)
	{
		zd=zd.trim();
		if (!(zd.equals("")))	wheresql+=" and  (zd="+zd+") ";
	}
	tcbfb=request.getParameter("tcbfb");
	if (tcbfb!=null)
	{
		tcbfb=tcbfb.trim();
		if (!(tcbfb.equals("")))	wheresql+=" and  (tcbfb="+tcbfb+") ";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (fgsbh='"+fgsbh+"')";
	}
	sjsjb=request.getParameter("sjsjb");
	if (sjsjb!=null)
	{
		sjsjb=cf.GB2Uni(sjsjb);
		if (!(sjsjb.equals("")))	wheresql+=" and  (sjsjb='"+sjsjb+"')";
	}
	ls_sql="SELECT xh,fdmc,qd,zd,tcbfb,fgsbh,sjsjb  ";
	ls_sql+=" FROM rs_sjfectsbl  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_sjfectsblCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","fdmc","qd","zd","tcbfb","fgsbh","sjsjb"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
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
	<td  width="14%">���</td>
	<td  width="14%">�ֶ�����</td>
	<td  width="14%">���</td>
	<td  width="14%">�յ�</td>
	<td  width="14%">��ɰٷֱ�</td>
	<td  width="14%">�ֹ�˾���</td>
	<td  width="14%">���ʦ����</td>
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