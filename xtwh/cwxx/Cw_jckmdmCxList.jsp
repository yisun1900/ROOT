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
	String cw_jckmdm_xuhao=null;
	String cw_jckmdm_kmdm=null;
	String cw_jckmdm_kmmc=null;
	String cw_jckmdm_yefx=null;
	String cw_jckmdm_fklxbm=null;
	String cw_jckmdm_gysbh=null;
	String cw_jckmdm_jdbz=null;
	String cw_jckmdm_fgsbh=null;
	cw_jckmdm_xuhao=request.getParameter("cw_jckmdm_xuhao");
	if (cw_jckmdm_xuhao!=null)
	{
		cw_jckmdm_xuhao=cw_jckmdm_xuhao.trim();
		if (!(cw_jckmdm_xuhao.equals("")))	wheresql+=" and (cw_jckmdm.xuhao="+cw_jckmdm_xuhao+") ";
	}
	cw_jckmdm_kmdm=request.getParameter("cw_jckmdm_kmdm");
	if (cw_jckmdm_kmdm!=null)
	{
		cw_jckmdm_kmdm=cf.GB2Uni(cw_jckmdm_kmdm);
		if (!(cw_jckmdm_kmdm.equals("")))	wheresql+=" and  (cw_jckmdm.kmdm='"+cw_jckmdm_kmdm+"')";
	}
	cw_jckmdm_kmmc=request.getParameter("cw_jckmdm_kmmc");
	if (cw_jckmdm_kmmc!=null)
	{
		cw_jckmdm_kmmc=cf.GB2Uni(cw_jckmdm_kmmc);
		if (!(cw_jckmdm_kmmc.equals("")))	wheresql+=" and  (cw_jckmdm.kmmc='"+cw_jckmdm_kmmc+"')";
	}
	cw_jckmdm_yefx=request.getParameter("cw_jckmdm_yefx");
	if (cw_jckmdm_yefx!=null)
	{
		cw_jckmdm_yefx=cf.GB2Uni(cw_jckmdm_yefx);
		if (!(cw_jckmdm_yefx.equals("")))	wheresql+=" and  (cw_jckmdm.yefx='"+cw_jckmdm_yefx+"')";
	}
	cw_jckmdm_fklxbm=request.getParameter("cw_jckmdm_fklxbm");
	if (cw_jckmdm_fklxbm!=null)
	{
		cw_jckmdm_fklxbm=cf.GB2Uni(cw_jckmdm_fklxbm);
		if (!(cw_jckmdm_fklxbm.equals("")))	wheresql+=" and  (cw_jckmdm.fklxbm='"+cw_jckmdm_fklxbm+"')";
	}
	cw_jckmdm_gysbh=request.getParameter("cw_jckmdm_gysbh");
	if (cw_jckmdm_gysbh!=null)
	{
		cw_jckmdm_gysbh=cf.GB2Uni(cw_jckmdm_gysbh);
		if (!(cw_jckmdm_gysbh.equals("")))	wheresql+=" and  (cw_jckmdm.gysbh='"+cw_jckmdm_gysbh+"')";
	}
	cw_jckmdm_jdbz=request.getParameter("cw_jckmdm_jdbz");
	if (cw_jckmdm_jdbz!=null)
	{
		cw_jckmdm_jdbz=cf.GB2Uni(cw_jckmdm_jdbz);
		if (!(cw_jckmdm_jdbz.equals("")))	wheresql+=" and  (cw_jckmdm.jdbz='"+cw_jckmdm_jdbz+"')";
	}
	cw_jckmdm_fgsbh=request.getParameter("cw_jckmdm_fgsbh");
	if (cw_jckmdm_fgsbh!=null)
	{
		cw_jckmdm_fgsbh=cf.GB2Uni(cw_jckmdm_fgsbh);
		if (!(cw_jckmdm_fgsbh.equals("")))	wheresql+=" and  (cw_jckmdm.fgsbh='"+cw_jckmdm_fgsbh+"')";
	}

	ls_sql="SELECT cw_jckmdm.xuhao,cw_jckmdm.kmdm,cw_jckmdm.kmmc,cw_jckmdm.cwdm,cw_jckmdm.yefx,DECODE(fklxbm,'21','ľ��','22','����','23','����','24','�Ҿ�','81','����'),cw_jckmdm.gysbh, DECODE(cw_jckmdm.jdbz,'1','�裨�˿','0','�����տ'),sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_jckmdm  ";
    ls_sql+=" where cw_jckmdm.fgsbh=sq_dwxx.dwbh ";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jckmdm.fgsbh,cw_jckmdm.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jckmdmCxList.jsp","SelectCxCw_jckmdm.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","cw_jckmdm_kmdm","cw_jckmdm_kmmc","cw_jckmdm_yefx","cw_jckmdm_fklxbm","cw_jckmdm_gysbh","cw_jckmdm_jdbz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);

	pageObj.alignStr[1]="align='left'";
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
	<td  width="6%">���</td>
	<td  width="14%">��Ŀ����</td>
	<td  width="16%">��Ŀ����</td>
	<td  width="11%">����</td>
	<td  width="5%">����</td>
	<td  width="8%">�տ�����</td>
	<td  width="19%">��Ӧ��</td>
	<td  width="10%">�����־</td>
	<td  width="11%">�ֹ�˾����</td>
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