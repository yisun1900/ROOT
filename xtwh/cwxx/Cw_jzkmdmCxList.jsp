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
	String cw_jzkmdm_xuhao=null;
	String cw_jzkmdm_kmdm=null;
	String cw_jzkmdm_kmmc=null;
	String cw_jzkmdm_kmlb=null;
	String cw_jzkmdm_yefx=null;
	String cw_jzkmdm_qm=null;
	String cw_jzkmdm_xmfzhs=null;
	String cw_jzkmdm_fklxbm=null;
	String cw_jzkmdm_fkcs=null;
	String cw_jzkmdm_jdbz=null;
	String cw_jzkmdm_fgsbh=null;
	cw_jzkmdm_xuhao=request.getParameter("cw_jzkmdm_xuhao");
	if (cw_jzkmdm_xuhao!=null)
	{
		cw_jzkmdm_xuhao=cw_jzkmdm_xuhao.trim();
		if (!(cw_jzkmdm_xuhao.equals("")))	wheresql+=" and (cw_jzkmdm.xuhao="+cw_jzkmdm_xuhao+") ";
	}
	cw_jzkmdm_kmdm=request.getParameter("cw_jzkmdm_kmdm");
	if (cw_jzkmdm_kmdm!=null)
	{
		cw_jzkmdm_kmdm=cf.GB2Uni(cw_jzkmdm_kmdm);
		if (!(cw_jzkmdm_kmdm.equals("")))	wheresql+=" and  (cw_jzkmdm.kmdm='"+cw_jzkmdm_kmdm+"')";
	}
	cw_jzkmdm_kmmc=request.getParameter("cw_jzkmdm_kmmc");
	if (cw_jzkmdm_kmmc!=null)
	{
		cw_jzkmdm_kmmc=cf.GB2Uni(cw_jzkmdm_kmmc);
		if (!(cw_jzkmdm_kmmc.equals("")))	wheresql+=" and  (cw_jzkmdm.kmmc='"+cw_jzkmdm_kmmc+"')";
	}
	cw_jzkmdm_kmlb=request.getParameter("cw_jzkmdm_kmlb");
	if (cw_jzkmdm_kmlb!=null)
	{
		cw_jzkmdm_kmlb=cf.GB2Uni(cw_jzkmdm_kmlb);
		if (!(cw_jzkmdm_kmlb.equals("")))	wheresql+=" and  (cw_jzkmdm.kmlb='"+cw_jzkmdm_kmlb+"')";
	}
	cw_jzkmdm_yefx=request.getParameter("cw_jzkmdm_yefx");
	if (cw_jzkmdm_yefx!=null)
	{
		cw_jzkmdm_yefx=cf.GB2Uni(cw_jzkmdm_yefx);
		if (!(cw_jzkmdm_yefx.equals("")))	wheresql+=" and  (cw_jzkmdm.yefx='"+cw_jzkmdm_yefx+"')";
	}
	cw_jzkmdm_qm=request.getParameter("cw_jzkmdm_qm");
	if (cw_jzkmdm_qm!=null)
	{
		cw_jzkmdm_qm=cf.GB2Uni(cw_jzkmdm_qm);
		if (!(cw_jzkmdm_qm.equals("")))	wheresql+=" and  (cw_jzkmdm.qm='"+cw_jzkmdm_qm+"')";
	}
	cw_jzkmdm_xmfzhs=request.getParameter("cw_jzkmdm_xmfzhs");
	if (cw_jzkmdm_xmfzhs!=null)
	{
		cw_jzkmdm_xmfzhs=cf.GB2Uni(cw_jzkmdm_xmfzhs);
		if (!(cw_jzkmdm_xmfzhs.equals("")))	wheresql+=" and  (cw_jzkmdm.xmfzhs='"+cw_jzkmdm_xmfzhs+"')";
	}
	cw_jzkmdm_fklxbm=request.getParameter("cw_jzkmdm_fklxbm");
	if (cw_jzkmdm_fklxbm!=null)
	{
		cw_jzkmdm_fklxbm=cf.GB2Uni(cw_jzkmdm_fklxbm);
		if (!(cw_jzkmdm_fklxbm.equals("")))	wheresql+=" and  (cw_jzkmdm.fklxbm='"+cw_jzkmdm_fklxbm+"')";
	}
	cw_jzkmdm_fkcs=request.getParameter("cw_jzkmdm_fkcs");
	if (cw_jzkmdm_fkcs!=null)
	{
		cw_jzkmdm_fkcs=cw_jzkmdm_fkcs.trim();
		if (!(cw_jzkmdm_fkcs.equals("")))	wheresql+=" and (cw_jzkmdm.fkcs="+cw_jzkmdm_fkcs+") ";
	}
	cw_jzkmdm_jdbz=request.getParameter("cw_jzkmdm_jdbz");
	if (cw_jzkmdm_jdbz!=null)
	{
		cw_jzkmdm_jdbz=cf.GB2Uni(cw_jzkmdm_jdbz);
		if (!(cw_jzkmdm_jdbz.equals("")))	wheresql+=" and  (cw_jzkmdm.jdbz='"+cw_jzkmdm_jdbz+"')";
	}
	cw_jzkmdm_fgsbh=request.getParameter("cw_jzkmdm_fgsbh");
	if (cw_jzkmdm_fgsbh!=null)
	{
		cw_jzkmdm_fgsbh=cf.GB2Uni(cw_jzkmdm_fgsbh);
		if (!(cw_jzkmdm_fgsbh.equals("")))	wheresql+=" and  (cw_jzkmdm.fgsbh='"+cw_jzkmdm_fgsbh+"')";
	}

	ls_sql="SELECT cw_jzkmdm.xuhao,sq_dwxx.dwmc ,cw_jzkmdm.kmdm,cw_jzkmdm.kmmc,fklxmc,fkcsmc, DECODE(cw_jzkmdm.jdbz,'1','�裨�˿','0','�����տ') ,cw_jzkmdm.kmlb,cw_jzkmdm.yefx,cw_jzkmdm.qm,cw_jzkmdm.xmfzhs";
	ls_sql+=" FROM cw_jzkmdm,sq_dwxx,cw_fklxbm,cw_fkcs  ";
    ls_sql+=" where cw_jzkmdm.fgsbh=sq_dwxx.dwbh";
    ls_sql+=" and cw_jzkmdm.fklxbm=cw_fklxbm.fklxbm(+) and cw_jzkmdm.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jzkmdm.fgsbh,cw_jzkmdm.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jzkmdmCxList.jsp","SelectCxCw_jzkmdm.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","cw_jzkmdm_kmdm","cw_jzkmdm_kmmc","cw_jzkmdm_kmlb","cw_jzkmdm_yefx","cw_jzkmdm_qm","cw_jzkmdm_xmfzhs","cw_jzkmdm_fklxbm","cw_jzkmdm_fkcs","cw_jzkmdm_jdbz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);

	pageObj.alignStr[2]="align='left'";
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="9%">�ֹ�˾����</td>
	<td  width="10%">��Ŀ����</td>
	<td  width="12%">��Ŀ����</td>
	<td  width="9%">�տ�����</td>
	<td  width="6%">�տ�����</td>
	<td  width="7%">�����־</td>
	<td  width="7%">��Ŀ���</td>
	<td  width="5%">����</td>
	<td  width="21%">ȫ��</td>
	<td  width="10%">��Ŀ��������</td>
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