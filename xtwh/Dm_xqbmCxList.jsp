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
	String dm_xqbm_xqbm=null;
	String dm_xqbm_xqmc=null;
	String dm_xqbm_cqbm=null;
	String dm_xqbm_dqbm=null;
	String dm_xqbm_yhdlm=null;
	String dm_xqbm_kfs=null;
	String dm_xqbm_sldh=null;
	String dm_xqbm_mpmjj=null;
	String dm_xqbm_rzsj=null;
	dm_xqbm_xqbm=request.getParameter("dm_xqbm_xqbm");
	if (dm_xqbm_xqbm!=null)
	{
		dm_xqbm_xqbm=cf.GB2Uni(dm_xqbm_xqbm);
		if (!(dm_xqbm_xqbm.equals("")))	wheresql+=" and  (dm_xqbm.xqbm='"+dm_xqbm_xqbm+"')";
	}
	dm_xqbm_xqmc=request.getParameter("dm_xqbm_xqmc");
	if (dm_xqbm_xqmc!=null)
	{
		dm_xqbm_xqmc=cf.GB2Uni(dm_xqbm_xqmc);
		if (!(dm_xqbm_xqmc.equals("")))	wheresql+=" and  (dm_xqbm.xqmc='"+dm_xqbm_xqmc+"')";
	}
	dm_xqbm_cqbm=request.getParameter("dm_xqbm_cqbm");
	if (dm_xqbm_cqbm!=null)
	{
		dm_xqbm_cqbm=cf.GB2Uni(dm_xqbm_cqbm);
		if (!(dm_xqbm_cqbm.equals("")))	wheresql+=" and  (dm_xqbm.cqbm='"+dm_xqbm_cqbm+"')";
	}
	dm_xqbm_dqbm=request.getParameter("dm_xqbm_dqbm");
	if (dm_xqbm_dqbm!=null)
	{
		dm_xqbm_dqbm=cf.GB2Uni(dm_xqbm_dqbm);
		if (!(dm_xqbm_dqbm.equals("")))	wheresql+=" and  (dm_xqbm.dqbm='"+dm_xqbm_dqbm+"')";
	}
	dm_xqbm_yhdlm=request.getParameter("dm_xqbm_yhdlm");
	if (dm_xqbm_yhdlm!=null)
	{
		dm_xqbm_yhdlm=cf.GB2Uni(dm_xqbm_yhdlm);
		if (!(dm_xqbm_yhdlm.equals("")))	wheresql+=" and  (dm_xqbm.yhdlm='"+dm_xqbm_yhdlm+"')";
	}
	dm_xqbm_kfs=request.getParameter("dm_xqbm_kfs");
	if (dm_xqbm_kfs!=null)
	{
		dm_xqbm_kfs=cf.GB2Uni(dm_xqbm_kfs);
		if (!(dm_xqbm_kfs.equals("")))	wheresql+=" and  (dm_xqbm.kfs like '%"+dm_xqbm_kfs+"%')";
	}
	dm_xqbm_sldh=request.getParameter("dm_xqbm_sldh");
	if (dm_xqbm_sldh!=null)
	{
		dm_xqbm_sldh=cf.GB2Uni(dm_xqbm_sldh);
		if (!(dm_xqbm_sldh.equals("")))	wheresql+=" and  (dm_xqbm.sldh like '%"+dm_xqbm_sldh+"%')";
	}
	dm_xqbm_mpmjj=request.getParameter("dm_xqbm_mpmjj");
	if (dm_xqbm_mpmjj!=null)
	{
		dm_xqbm_mpmjj=dm_xqbm_mpmjj.trim();
		if (!(dm_xqbm_mpmjj.equals("")))	wheresql+=" and (dm_xqbm.mpmjj>="+dm_xqbm_mpmjj+") ";
	}
	dm_xqbm_mpmjj=request.getParameter("dm_xqbm_mpmjj2");
	if (dm_xqbm_mpmjj!=null)
	{
		dm_xqbm_mpmjj=dm_xqbm_mpmjj.trim();
		if (!(dm_xqbm_mpmjj.equals("")))	wheresql+=" and (dm_xqbm.mpmjj<="+dm_xqbm_mpmjj+") ";
	}
	dm_xqbm_rzsj=request.getParameter("dm_xqbm_rzsj");
	if (dm_xqbm_rzsj!=null)
	{
		dm_xqbm_rzsj=dm_xqbm_rzsj.trim();
		if (!(dm_xqbm_rzsj.equals("")))	wheresql+="  and (dm_xqbm.rzsj>=TO_DATE('"+dm_xqbm_rzsj+"','YYYY/MM/DD'))";
	}
	dm_xqbm_rzsj=request.getParameter("dm_xqbm_rzsj2");
	if (dm_xqbm_rzsj!=null)
	{
		dm_xqbm_rzsj=dm_xqbm_rzsj.trim();
		if (!(dm_xqbm_rzsj.equals("")))	wheresql+="  and (dm_xqbm.rzsj<=TO_DATE('"+dm_xqbm_rzsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT dm_xqbm.xqbm,dm_xqbm.xqmc,dm_xqbm.cqbm,dm_cqbm.cqmc,dm_xqbm.dqbm,dm_dqbm.dqmc,dm_xqbm.yhdlm,dm_xqbm.kfs,dm_xqbm.sldh,dm_xqbm.mpmjj,dm_xqbm.rzsj,dm_xqbm.bz  ";
	ls_sql+=" FROM dm_cqbm,dm_dqbm,dm_xqbm  ";
    ls_sql+=" where dm_xqbm.dqbm=dm_dqbm.dqbm and dm_xqbm.cqbm=dm_cqbm.cqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_xqbm.dqbm,dm_xqbm.cqbm,dm_xqbm.xqbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_xqbmCxList.jsp","SelectCxDm_xqbm.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xqbm","dm_xqbm_xqmc","dm_xqbm_cqbm","dm_cqbm_cqmc","dm_xqbm_dqbm","dm_dqbm_dqmc","dm_xqbm_yhdlm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xqbm"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">С������</td>
	<td  width="12%">С������</td>
	<td  width="5%">��������</td>
	<td  width="7%">��������</td>
	<td  width="5%">��������</td>
	<td  width="7%">��������</td>
	<td  width="5%">�û���½��</td>
	<td  width="14%">������</td>
	<td  width="16%">��¥�绰</td>
	<td  width="5%">ÿƽ�׾���</td>
	<td  width="7%">��סʱ��</td>
	<td  width="12%">��ע</td>
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