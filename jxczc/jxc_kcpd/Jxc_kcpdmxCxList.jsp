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
	String pdph=null;
	String pdxh=null;
	String dqbm=null;
	String ckbh=null;
	String hjbh=null;
	String hwbh=null;
	String clbm=null;
	String zljb=null;
	String kcsl=null;
	String pdsl=null;
	String pdlb=null;
	pdlb=request.getParameter("pdlb");
	if (pdlb!=null)
	{
		pdlb=pdlb.trim();
		if (!(pdlb.equals("")))	wheresql+=" and (pdlb="+pdlb+") ";
	}
	pdph=request.getParameter("pdph");
	if (pdph!=null)
	{
		pdph=pdph.trim();
		if (!(pdph.equals("")))	wheresql+=" and (pdph="+pdph+") ";
	}
	pdxh=request.getParameter("pdxh");
	if (pdxh!=null)
	{
		pdxh=pdxh.trim();
		if (!(pdxh.equals("")))	wheresql+=" and (pdxh="+pdxh+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (dqbm='"+dqbm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (ckbh='"+ckbh+"')";
	}
	hjbh=request.getParameter("hjbh");
	if (hjbh!=null)
	{
		hjbh=cf.GB2Uni(hjbh);
		if (!(hjbh.equals("")))	wheresql+=" and  (hjbh='"+hjbh+"')";
	}
	hwbh=request.getParameter("hwbh");
	if (hwbh!=null)
	{
		hwbh=cf.GB2Uni(hwbh);
		if (!(hwbh.equals("")))	wheresql+=" and  (hwbh='"+hwbh+"')";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (clbm='"+clbm+"')";
	}
	zljb=request.getParameter("zljb");
	if (zljb!=null)
	{
		zljb=cf.GB2Uni(zljb);
		if (!(zljb.equals("")))	wheresql+=" and  (zljb='"+zljb+"')";
	}
	kcsl=request.getParameter("kcsl");
	if (kcsl!=null)
	{
		kcsl=kcsl.trim();
		if (!(kcsl.equals("")))	wheresql+=" and  (kcsl="+kcsl+") ";
	}
	pdsl=request.getParameter("pdsl");
	if (pdsl!=null)
	{
		pdsl=pdsl.trim();
		if (!(pdsl.equals("")))	wheresql+=" and  (pdsl="+pdsl+") ";
	}
	ls_sql="SELECT pdph,pdxh,dqbm,ckbh,hjbh,hwbh,clbm,zljb,kcsl,pdsl  ";
	ls_sql+=" FROM jxc_kcpdmx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kcpdmxCxList.jsp","SelectCxJxc_kcpdmx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pdph","pdxh","dqbm","ckbh","hjbh","hwbh","clbm","zljb","kcsl","pdsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pdph","pdxh"};
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
	<td  width="10%">�̵�����</td>
	<td  width="10%">�̵����</td>
	<td  width="10%">�������</td>
	<td  width="10%">�ֿ���</td>
	<td  width="10%">���ܱ��</td>
	<td  width="10%">��λ���</td>
	<td  width="10%">���ϱ���</td>
	<td  width="10%">��������</td>
	<td  width="10%">�������</td>
	<td  width="10%">�̵�����</td>
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