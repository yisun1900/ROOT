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
	String cw_zbzjsjl_xuhao=null;
	String cw_zbzjsjl_sgd=null;
	String cw_zbzjsjl_je=null;
	String cw_zbzjsjl_lrr=null;
	String cw_zbzjsjl_lrsj=null;
	cw_zbzjsjl_xuhao=request.getParameter("cw_zbzjsjl_xuhao");
	if (cw_zbzjsjl_xuhao!=null)
	{
		cw_zbzjsjl_xuhao=cw_zbzjsjl_xuhao.trim();
		if (!(cw_zbzjsjl_xuhao.equals("")))	wheresql+=" and (cw_zbzjsjl.xuhao="+cw_zbzjsjl_xuhao+") ";
	}
	cw_zbzjsjl_sgd=request.getParameter("cw_zbzjsjl_sgd");
	if (cw_zbzjsjl_sgd!=null)
	{
		cw_zbzjsjl_sgd=cf.GB2Uni(cw_zbzjsjl_sgd);
		if (!(cw_zbzjsjl_sgd.equals("")))	wheresql+=" and  (cw_zbzjsjl.sgd='"+cw_zbzjsjl_sgd+"')";
	}
	cw_zbzjsjl_je=request.getParameter("cw_zbzjsjl_je");
	if (cw_zbzjsjl_je!=null)
	{
		cw_zbzjsjl_je=cw_zbzjsjl_je.trim();
		if (!(cw_zbzjsjl_je.equals("")))	wheresql+=" and  (cw_zbzjsjl.je="+cw_zbzjsjl_je+") ";
	}
	cw_zbzjsjl_lrr=request.getParameter("cw_zbzjsjl_lrr");
	if (cw_zbzjsjl_lrr!=null)
	{
		cw_zbzjsjl_lrr=cf.GB2Uni(cw_zbzjsjl_lrr);
		if (!(cw_zbzjsjl_lrr.equals("")))	wheresql+=" and  (cw_zbzjsjl.lrr='"+cw_zbzjsjl_lrr+"')";
	}
	cw_zbzjsjl_lrsj=request.getParameter("cw_zbzjsjl_lrsj");
	if (cw_zbzjsjl_lrsj!=null)
	{
		cw_zbzjsjl_lrsj=cw_zbzjsjl_lrsj.trim();
		if (!(cw_zbzjsjl_lrsj.equals("")))	wheresql+="  and (cw_zbzjsjl.lrsj=TO_DATE('"+cw_zbzjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_zbzjsjl.xuhao,sq_sgd.sgdmc,cw_zbzjsjl.je,cw_zbzjsjl.lrr,cw_zbzjsjl.lrsj,cw_zbzjsjl.bz  ";
	ls_sql+=" FROM sq_sgd,cw_zbzjsjl  ";
    ls_sql+=" where cw_zbzjsjl.sgd=sq_sgd.sgd";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zbzjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zbzjsjlCxList.jsp","SelectCxCw_zbzjsjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	pageObj.setPageRow(Integer.parseInt(myxssl));//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","sq_sgd_sgdmc","cw_zbzjsjl_je","cw_zbzjsjl_lrr","cw_zbzjsjl_lrsj","cw_zbzjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
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
	<td  width="8%">���</td>
	<td  width="10%">ʩ����</td>
	<td  width="14%">���</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="50%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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