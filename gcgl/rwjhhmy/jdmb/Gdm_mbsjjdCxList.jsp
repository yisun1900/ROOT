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
	String mbbm=null;
	String mbmc=null;
	String rwbm=null;
	String rwmc=null;
	String rwsfsj=null;
	String rwxh=null;
	mbbm=request.getParameter("mbbm");
	if (mbbm!=null)
	{
		mbbm=cf.GB2Uni(mbbm);
		if (!(mbbm.equals("")))	wheresql+=" and  (gdm_mbsjjd.mbbm='"+mbbm+"')";
	}
	mbmc=request.getParameter("mbmc");
	if (mbmc!=null)
	{
		mbmc=cf.GB2Uni(mbmc);
		if (!(mbmc.equals("")))	wheresql+=" and  (gdm_sgjdmb.mbmc='"+mbmc+"')";
	}
	rwbm=request.getParameter("rwbm");
	if (rwbm!=null)
	{
		rwbm=cf.GB2Uni(rwbm);
		if (!(rwbm.equals("")))	wheresql+=" and  (gdm_mbsjjd.rwbm='"+rwbm+"')";
	}
	rwmc=request.getParameter("rwmc");
	if (rwmc!=null)
	{
		rwmc=cf.GB2Uni(rwmc);
		if (!(rwmc.equals("")))	wheresql+=" and  (gdm_rwbm.rwmc='"+rwmc+"')";
	}
	rwsfsj=request.getParameter("rwsfsj");
	if (rwsfsj!=null)
	{
		rwsfsj=rwsfsj.trim();
		if (!(rwsfsj.equals("")))	wheresql+=" and (gdm_mbsjjd.rwsfsj="+rwsfsj+") ";
	}
	rwxh=request.getParameter("rwxh");
	if (rwxh!=null)
	{
		rwxh=rwxh.trim();
		if (!(rwxh.equals("")))	wheresql+=" and (gdm_mbsjjd.rwxh="+rwxh+") ";
	}
	ls_sql="SELECT gdm_mbsjjd.rwxh,gdm_mbsjjd.mbbm,gdm_sgjdmb.mbmc,gdm_mbsjjd.rwbm,gdm_rwbm.rwmc,gdm_mbsjjd.rwsfsj,gdm_mbsjjd.rwts  ";
	ls_sql+=" FROM gdm_mbsjjd,gdm_rwbm,gdm_sgjdmb  ";
    ls_sql+=" where gdm_mbsjjd.rwbm=gdm_rwbm.rwbm and gdm_mbsjjd.mbbm=gdm_sgjdmb.mbbm";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_mbsjjd.mbbm,gdm_mbsjjd.rwxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_mbsjjdCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"mbbm","mbmc","rwbm","rwmc","rwsfsj","rwxh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"mbbm","rwbm"};
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
	<td  width="8%">�������</td>
	<td  width="10%">ģ�����</td>
	<td  width="20%">ģ������</td>
	<td  width="10%">�������</td>
	<td  width="37%">��������</td>
	<td  width="8%">������ʱ��</td>
	<td  width="8%">��������</td>
</tr>
<%
	pageObj.printDate();
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