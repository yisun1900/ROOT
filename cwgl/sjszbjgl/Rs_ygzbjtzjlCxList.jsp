<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String sqygbh=(String)session.getAttribute("ygbh");
String sqfgs=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";



	String dwbh=null;
	String ssfgs=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	String rs_ygzbjtzjl_xuhao=null;
	String rs_ygzbjtzjl_ygbh=null;
	String rs_ygzbjtzjl_yhmc=null;
	String sq_yhxx_xzzwbm=null;
	String rs_ygzbjtzjl_je=null;
	String rs_ygzbjtzjl_jlh=null;
	String rs_ygzbjtzjl_lrr=null;
	String rs_ygzbjtzjl_lrsj=null;
	rs_ygzbjtzjl_xuhao=request.getParameter("rs_ygzbjtzjl_xuhao");
	if (rs_ygzbjtzjl_xuhao!=null)
	{
		rs_ygzbjtzjl_xuhao=rs_ygzbjtzjl_xuhao.trim();
		if (!(rs_ygzbjtzjl_xuhao.equals("")))	wheresql+=" and (rs_ygzbjtzjl.xuhao="+rs_ygzbjtzjl_xuhao+") ";
	}
	rs_ygzbjtzjl_ygbh=request.getParameter("rs_ygzbjtzjl_ygbh");
	if (rs_ygzbjtzjl_ygbh!=null)
	{
		rs_ygzbjtzjl_ygbh=rs_ygzbjtzjl_ygbh.trim();
		if (!(rs_ygzbjtzjl_ygbh.equals("")))	wheresql+=" and (rs_ygzbjtzjl.ygbh="+rs_ygzbjtzjl_ygbh+") ";
	}
	rs_ygzbjtzjl_yhmc=request.getParameter("rs_ygzbjtzjl_yhmc");
	if (rs_ygzbjtzjl_yhmc!=null)
	{
		rs_ygzbjtzjl_yhmc=cf.GB2Uni(rs_ygzbjtzjl_yhmc);
		if (!(rs_ygzbjtzjl_yhmc.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.yhmc='"+rs_ygzbjtzjl_yhmc+"')";
	}
	sq_yhxx_xzzwbm=request.getParameter("sq_yhxx_xzzwbm");
	if (sq_yhxx_xzzwbm!=null)
	{
		sq_yhxx_xzzwbm=cf.GB2Uni(sq_yhxx_xzzwbm);
		if (!(sq_yhxx_xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+sq_yhxx_xzzwbm+"')";
	}
	rs_ygzbjtzjl_je=request.getParameter("rs_ygzbjtzjl_je");
	if (rs_ygzbjtzjl_je!=null)
	{
		rs_ygzbjtzjl_je=rs_ygzbjtzjl_je.trim();
		if (!(rs_ygzbjtzjl_je.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.je="+rs_ygzbjtzjl_je+") ";
	}
	rs_ygzbjtzjl_jlh=request.getParameter("rs_ygzbjtzjl_jlh");
	if (rs_ygzbjtzjl_jlh!=null)
	{
		rs_ygzbjtzjl_jlh=cf.GB2Uni(rs_ygzbjtzjl_jlh);
		if (!(rs_ygzbjtzjl_jlh.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.jlh='"+rs_ygzbjtzjl_jlh+"')";
	}
	rs_ygzbjtzjl_lrr=request.getParameter("rs_ygzbjtzjl_lrr");
	if (rs_ygzbjtzjl_lrr!=null)
	{
		rs_ygzbjtzjl_lrr=cf.GB2Uni(rs_ygzbjtzjl_lrr);
		if (!(rs_ygzbjtzjl_lrr.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.lrr='"+rs_ygzbjtzjl_lrr+"')";
	}
	rs_ygzbjtzjl_lrsj=request.getParameter("rs_ygzbjtzjl_lrsj");
	if (rs_ygzbjtzjl_lrsj!=null)
	{
		rs_ygzbjtzjl_lrsj=rs_ygzbjtzjl_lrsj.trim();
		if (!(rs_ygzbjtzjl_lrsj.equals("")))	wheresql+="  and (rs_ygzbjtzjl.lrsj>=TO_DATE('"+rs_ygzbjtzjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ygzbjtzjl_lrsj=request.getParameter("rs_ygzbjtzjl_lrsj2");
	if (rs_ygzbjtzjl_lrsj!=null)
	{
		rs_ygzbjtzjl_lrsj=rs_ygzbjtzjl_lrsj.trim();
		if (!(rs_ygzbjtzjl_lrsj.equals("")))	wheresql+="  and (rs_ygzbjtzjl.lrsj<=TO_DATE('"+rs_ygzbjtzjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT TO_CHAR(rs_ygzbjtzjl.xuhao) xuhao,TO_CHAR(rs_ygzbjtzjl.ygbh),rs_ygzbjtzjl.yhmc,sq_yhxx.xzzwbm,b.dwmc bm,rs_ygzbjtzjl.je,rs_ygzbjtzjl.jlh,rs_ygzbjtzjl.lrr,rs_ygzbjtzjl.lrsj,a.dwmc,rs_ygzbjtzjl.bz  ";
	ls_sql+=" FROM sq_yhxx,rs_ygzbjtzjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_ygzbjtzjl.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=" and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=" and sq_yhxx.dwbh=b.dwbh(+)";
 	if (sqfgs.equals("1") || sqfgs.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+sqygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+sqygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ygzbjtzjl.xuhao desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ygzbjtzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","rs_ygzbjtzjl_ygbh","rs_ygzbjtzjl_yhmc","sq_yhxx_xzzwbm","rs_ygzbjtzjl_je","rs_ygzbjtzjl_jlh","rs_ygzbjtzjl_lrr","rs_ygzbjtzjl_lrsj","rs_ygzbjtzjl_bz"};
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
  <B><font size="3">���ʦ�ʱ��𣭲�ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="6%">Ա�����</td>
	<td  width="6%">Ա������</td>
	<td  width="8%">����ְ��</td>
	<td  width="9%">����</td>
	<td  width="9%">���</td>
	<td  width="9%">������¼��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="9%">�ֹ�˾</td>
	<td  width="27%">��ע</td>
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