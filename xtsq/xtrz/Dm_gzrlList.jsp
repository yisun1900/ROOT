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
	String rq=null;
	String nian=null;
	String yue=null;
	String ri=null;
	String jjrbz=null;
	String jjrlx=null;
	rq=request.getParameter("rq");
	if (rq!=null)
	{
		rq=rq.trim();
		if (!(rq.equals("")))	wheresql+="  and (rq>=TO_DATE('"+rq+"','YYYY/MM/DD'))";
	}
	rq=request.getParameter("rq2");
	if (rq!=null)
	{
		rq=rq.trim();
		if (!(rq.equals("")))	wheresql+="  and (rq<=TO_DATE('"+rq+"','YYYY/MM/DD'))";
	}
	nian=request.getParameter("nian");
	if (nian!=null)
	{
		nian=cf.GB2Uni(nian);
		if (!(nian.equals("")))	wheresql+=" and  (nian='"+nian+"')";
	}
	yue=request.getParameter("yue");
	if (yue!=null)
	{
		yue=cf.GB2Uni(yue);
		if (!(yue.equals("")))	wheresql+=" and  (yue='"+yue+"')";
	}
	ri=request.getParameter("ri");
	if (ri!=null)
	{
		ri=cf.GB2Uni(ri);
		if (!(ri.equals("")))	wheresql+=" and  (ri='"+ri+"')";
	}
	jjrbz=request.getParameter("jjrbz");
	if (jjrbz!=null)
	{
		jjrbz=cf.GB2Uni(jjrbz);
		if (!(jjrbz.equals("")))	wheresql+=" and  (jjrbz='"+jjrbz+"')";
	}
	jjrlx=request.getParameter("jjrlx");
	if (jjrlx!=null)
	{
		jjrlx=cf.GB2Uni(jjrlx);
		if (!(jjrlx.equals("")))	wheresql+=" and  (jjrlx='"+jjrlx+"')";
	}
	ls_sql="SELECT rq,nian,yue,ri, DECODE(jjrbz,'Y','�ڼ���','N','��'), DECODE(jjrlx,'1','��ĩ��������','2','��ĩ�����գ�','3','����','8','����')  ";
	ls_sql+=" FROM dm_gzrl  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by rq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_gzrlList.jsp","","","EditDm_gzrl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"rq","nian","yue","ri","jjrbz","jjrlx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"rq"};
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
  <B><font size="3">��������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="14%">����</td>
	<td  width="14%">��</td>
	<td  width="14%">��</td>
	<td  width="14%">��</td>
	<td  width="10%">�ڼ��ձ�־</td>
	<td  width="20%">�ڼ�������</td>
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