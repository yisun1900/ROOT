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
	String oa_lqsq_bgypbm=null;
	String oa_lqsq_slr=null;
	String oa_lqsq_sqrq=null;
	String oa_lqsq_jhlqsl=null;
	String oa_lqsq_jhlqrq=null;
	String oa_lqsq_lqzt=null;
	String oa_lqsq_slqsl=null;
	String oa_lqsq_blr=null;
	String oa_lqsq_lqsj=null;
	String oa_bgypbm_bgypmc=null;
	oa_lqsq_bgypbm=request.getParameter("oa_lqsq_bgypbm");
	if (oa_lqsq_bgypbm!=null)
	{
		oa_lqsq_bgypbm=cf.GB2Uni(oa_lqsq_bgypbm);
		if (!(oa_lqsq_bgypbm.equals("")))	wheresql+=" and  (oa_lqsq.bgypbm='"+oa_lqsq_bgypbm+"')";
	}
	oa_lqsq_slr=request.getParameter("oa_lqsq_slr");
	if (oa_lqsq_slr!=null)
	{
		oa_lqsq_slr=cf.GB2Uni(oa_lqsq_slr);
		if (!(oa_lqsq_slr.equals("")))	wheresql+=" and  (oa_lqsq.slr='"+oa_lqsq_slr+"')";
	}
	oa_lqsq_sqrq=request.getParameter("oa_lqsq_sqrq");
	if (oa_lqsq_sqrq!=null)
	{
		oa_lqsq_sqrq=oa_lqsq_sqrq.trim();
		if (!(oa_lqsq_sqrq.equals("")))	wheresql+="  and (oa_lqsq.sqrq>=TO_DATE('"+oa_lqsq_sqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_sqrq=request.getParameter("oa_lqsq_sqrq2");
	if (oa_lqsq_sqrq!=null)
	{
		oa_lqsq_sqrq=oa_lqsq_sqrq.trim();
		if (!(oa_lqsq_sqrq.equals("")))	wheresql+="  and (oa_lqsq.sqrq<=TO_DATE('"+oa_lqsq_sqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_jhlqsl=request.getParameter("oa_lqsq_jhlqsl");
	if (oa_lqsq_jhlqsl!=null)
	{
		oa_lqsq_jhlqsl=oa_lqsq_jhlqsl.trim();
		if (!(oa_lqsq_jhlqsl.equals("")))	wheresql+=" and (oa_lqsq.jhlqsl>="+oa_lqsq_jhlqsl+") ";
	}
	oa_lqsq_jhlqsl=request.getParameter("oa_lqsq_jhlqsl2");
	if (oa_lqsq_jhlqsl!=null)
	{
		oa_lqsq_jhlqsl=oa_lqsq_jhlqsl.trim();
		if (!(oa_lqsq_jhlqsl.equals("")))	wheresql+=" and (oa_lqsq.jhlqsl<="+oa_lqsq_jhlqsl+") ";
	}
	oa_lqsq_jhlqrq=request.getParameter("oa_lqsq_jhlqrq");
	if (oa_lqsq_jhlqrq!=null)
	{
		oa_lqsq_jhlqrq=oa_lqsq_jhlqrq.trim();
		if (!(oa_lqsq_jhlqrq.equals("")))	wheresql+="  and (oa_lqsq.jhlqrq>=TO_DATE('"+oa_lqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_jhlqrq=request.getParameter("oa_lqsq_jhlqrq2");
	if (oa_lqsq_jhlqrq!=null)
	{
		oa_lqsq_jhlqrq=oa_lqsq_jhlqrq.trim();
		if (!(oa_lqsq_jhlqrq.equals("")))	wheresql+="  and (oa_lqsq.jhlqrq<=TO_DATE('"+oa_lqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lqzt=request.getParameter("oa_lqsq_lqzt");
	if (oa_lqsq_lqzt!=null)
	{
		oa_lqsq_lqzt=cf.GB2Uni(oa_lqsq_lqzt);
		if (!(oa_lqsq_lqzt.equals("")))	wheresql+=" and  (oa_lqsq.lqzt='"+oa_lqsq_lqzt+"')";
	}
	oa_lqsq_slqsl=request.getParameter("oa_lqsq_slqsl");
	if (oa_lqsq_slqsl!=null)
	{
		oa_lqsq_slqsl=oa_lqsq_slqsl.trim();
		if (!(oa_lqsq_slqsl.equals("")))	wheresql+=" and (oa_lqsq.slqsl>="+oa_lqsq_slqsl+") ";
	}
	oa_lqsq_slqsl=request.getParameter("oa_lqsq_slqsl2");
	if (oa_lqsq_slqsl!=null)
	{
		oa_lqsq_slqsl=oa_lqsq_slqsl.trim();
		if (!(oa_lqsq_slqsl.equals("")))	wheresql+=" and (oa_lqsq.slqsl<="+oa_lqsq_slqsl+") ";
	}
	oa_lqsq_blr=request.getParameter("oa_lqsq_blr");
	if (oa_lqsq_blr!=null)
	{
		oa_lqsq_blr=cf.GB2Uni(oa_lqsq_blr);
		if (!(oa_lqsq_blr.equals("")))	wheresql+=" and  (oa_lqsq.blr='"+oa_lqsq_blr+"')";
	}
	oa_lqsq_lqsj=request.getParameter("oa_lqsq_lqsj");
	if (oa_lqsq_lqsj!=null)
	{
		oa_lqsq_lqsj=oa_lqsq_lqsj.trim();
		if (!(oa_lqsq_lqsj.equals("")))	wheresql+="  and (oa_lqsq.lqsj>=TO_DATE('"+oa_lqsq_lqsj+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lqsj=request.getParameter("oa_lqsq_lqsj2");
	if (oa_lqsq_lqsj!=null)
	{
		oa_lqsq_lqsj=oa_lqsq_lqsj.trim();
		if (!(oa_lqsq_lqsj.equals("")))	wheresql+="  and (oa_lqsq.lqsj<=TO_DATE('"+oa_lqsq_lqsj+"','YYYY/MM/DD'))";
	}
	oa_bgypbm_bgypmc=request.getParameter("oa_bgypbm_bgypmc");
	if (oa_bgypbm_bgypmc!=null)
	{
		oa_bgypbm_bgypmc=cf.GB2Uni(oa_bgypbm_bgypmc);
		if (!(oa_bgypbm_bgypmc.equals("")))	wheresql+=" and  (oa_bgypbm.bgypmc='"+oa_bgypbm_bgypmc+"')";
	}
	ls_sql="SELECT oa_lqsq.xh,oa_bgypbm.bgypmc,TO_CHAR(dj) dj,oa_lqsq.jhlqsl as oa_lqsq_jhlqsl,oa_lqsq.jhlqsl*dj jhje,oa_lqsq.slr as slr,oa_lqsq.sqrq as sqrq,oa_lqsq.jhlqrq as oa_lqsq_jhlqrq, DECODE(oa_lqsq.lqzt,'N','δ��ȡ','Y','����ȡ') as oa_lqsq_lqzt,oa_lqsq.slqsl as oa_lqsq_slqsl,oa_lqsq.slqsl*dj sjje,oa_lqsq.blr as oa_lqsq_blr,oa_lqsq.lqsj as oa_lqsq_lqsj";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq  ";
    ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Oa_lqsqLqCxList.jsp","SelectLqCxOa_lqsq.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"oa_bgypbm_bgypmc","dj","slr","sqrq","oa_lqsq_jhlqsl","jhje","oa_lqsq_jhlqrq","oa_lqsq_lqzt","oa_lqsq_slqsl","sjje","oa_lqsq_blr","oa_lqsq_lqsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewOa_lqsq.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�������</td>
	<td  width="10%">�칫��Ʒ</td>
	<td  width="5%">����</td>
	<td  width="5%">�ƻ�����</td>
	<td  width="7%">���</td>
	<td  width="5%">������</td>
	<td  width="12%">��������</td>
	<td  width="12%">�ƻ���ȡ����</td>
	<td  width="10%">��ȡ״̬</td>
	<td  width="5%">ʵ������</td>
	<td  width="7%">���</td>
	<td  width="5%">������</td>
	<td  width="12%">��ȡʱ��</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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