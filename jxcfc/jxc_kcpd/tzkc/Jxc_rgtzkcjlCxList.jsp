<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String lsh=null;
	String xgsj=null;
	String xgr=null;
	String clbm=null;
	String clmc=null;
	String ykcsl=null;
	String xkcsl=null;
	String ssfgs=null;
	String dwbh=null;
	lsh=request.getParameter("lsh");
	if (lsh!=null)
	{
		lsh=cf.GB2Uni(lsh);
		if (!(lsh.equals("")))	wheresql+=" and  (lsh='"+lsh+"')";
	}
	xgsj=request.getParameter("xgsj");
	if (xgsj!=null)
	{
		xgsj=xgsj.trim();
		if (!(xgsj.equals("")))	wheresql+="  and (xgsj>=TO_DATE('"+xgsj+"','YYYY/MM/DD'))";
	}
	xgsj=request.getParameter("xgsj2");
	if (xgsj!=null)
	{
		xgsj=xgsj.trim();
		if (!(xgsj.equals("")))	wheresql+="  and (xgsj<=TO_DATE('"+xgsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	xgr=request.getParameter("xgr");
	if (xgr!=null)
	{
		xgr=cf.GB2Uni(xgr);
		if (!(xgr.equals("")))	wheresql+=" and  (xgr='"+xgr+"')";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (clmc like '%"+clmc+"%')";
	}
	ykcsl=request.getParameter("ykcsl");
	if (ykcsl!=null)
	{
		ykcsl=ykcsl.trim();
		if (!(ykcsl.equals("")))	wheresql+=" and  (ykcsl="+ykcsl+") ";
	}
	xkcsl=request.getParameter("xkcsl");
	if (xkcsl!=null)
	{
		xkcsl=xkcsl.trim();
		if (!(xkcsl.equals("")))	wheresql+=" and  (xkcsl="+xkcsl+") ";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ssfgs='"+ssfgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT lsh,xgsj,xgr,clbm,clmc,ykcsl,xkcsl,a.dwmc ssfgs,b.dwmc dwbh  ";
	ls_sql+=" FROM jxc_rgtzkcjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where jxc_rgtzkcjl.ssfgs=a.dwbh(+)";
    ls_sql+=" and jxc_rgtzkcjl.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_rgtzkcjl.ssfgs,xgsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_rgtzkcjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lsh","xgsj","xgr","clbm","clmc","ykcsl","xkcsl","ssfgs","dwbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lsh","xgsj"};
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
  <B><font size="3">�˹�������棭��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">��ˮ��</td>
	<td  width="11%">�޸�ʱ��</td>
	<td  width="7%">�޸���</td>
	<td  width="11%">���ϱ���</td>
	<td  width="24%">��������</td>
	<td  width="7%">ԭ�������</td>
	<td  width="7%">������������</td>
	<td  width="11%">�޸��˷ֹ�˾</td>
	<td  width="11%">�޸��˲���</td>
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