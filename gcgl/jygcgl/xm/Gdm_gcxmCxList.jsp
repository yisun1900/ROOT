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
	String gdm_gcxm_xmbm=null;
	String gdm_gcxm_xmmc=null;
	String gdm_gcxm_xmdlbm=null;
	String gdm_gcxm_xmxlbm=null;
	String gdm_gcxmcfbz_wgjbbm=null;
	String gdm_gcxmcfbz_xzzwbm=null;
	String gdm_gcxmcfbz_zgyq=null;
	gdm_gcxm_xmbm=request.getParameter("gdm_gcxm_xmbm");
	if (gdm_gcxm_xmbm!=null)
	{
		gdm_gcxm_xmbm=cf.GB2Uni(gdm_gcxm_xmbm);
		if (!(gdm_gcxm_xmbm.equals("")))	wheresql+=" and  (gdm_gcxm.xmbm='"+gdm_gcxm_xmbm+"')";
	}
	gdm_gcxm_xmmc=request.getParameter("gdm_gcxm_xmmc");
	if (gdm_gcxm_xmmc!=null)
	{
		gdm_gcxm_xmmc=cf.GB2Uni(gdm_gcxm_xmmc);
		if (!(gdm_gcxm_xmmc.equals("")))	wheresql+=" and  (gdm_gcxm.xmmc='"+gdm_gcxm_xmmc+"')";
	}
	gdm_gcxm_xmdlbm=request.getParameter("gdm_gcxm_xmdlbm");
	if (gdm_gcxm_xmdlbm!=null)
	{
		gdm_gcxm_xmdlbm=cf.GB2Uni(gdm_gcxm_xmdlbm);
		if (!(gdm_gcxm_xmdlbm.equals("")))	wheresql+=" and  (gdm_gcxm.xmdlbm='"+gdm_gcxm_xmdlbm+"')";
	}
	gdm_gcxm_xmxlbm=request.getParameter("gdm_gcxm_xmxlbm");
	if (gdm_gcxm_xmxlbm!=null)
	{
		gdm_gcxm_xmxlbm=cf.GB2Uni(gdm_gcxm_xmxlbm);
		if (!(gdm_gcxm_xmxlbm.equals("")))	wheresql+=" and  (gdm_gcxm.xmxlbm='"+gdm_gcxm_xmxlbm+"')";
	}
	gdm_gcxmcfbz_wgjbbm=request.getParameter("gdm_gcxmcfbz_wgjbbm");
	if (gdm_gcxmcfbz_wgjbbm!=null)
	{
		gdm_gcxmcfbz_wgjbbm=cf.GB2Uni(gdm_gcxmcfbz_wgjbbm);
		if (!(gdm_gcxmcfbz_wgjbbm.equals("")))	wheresql+=" and  (gdm_gcxmcfbz.wgjbbm='"+gdm_gcxmcfbz_wgjbbm+"')";
	}
	gdm_gcxmcfbz_xzzwbm=request.getParameter("gdm_gcxmcfbz_xzzwbm");
	if (gdm_gcxmcfbz_xzzwbm!=null)
	{
		gdm_gcxmcfbz_xzzwbm=cf.GB2Uni(gdm_gcxmcfbz_xzzwbm);
		if (!(gdm_gcxmcfbz_xzzwbm.equals("")))	wheresql+=" and  (gdm_gcxmcfbz.xzzwbm='"+gdm_gcxmcfbz_xzzwbm+"')";
	}
	gdm_gcxmcfbz_zgyq=request.getParameter("gdm_gcxmcfbz_zgyq");
	if (gdm_gcxmcfbz_zgyq!=null)
	{
		gdm_gcxmcfbz_zgyq=cf.GB2Uni(gdm_gcxmcfbz_zgyq);
		if (!(gdm_gcxmcfbz_zgyq.equals("")))	wheresql+=" and  (gdm_gcxmcfbz.zgyq='"+gdm_gcxmcfbz_zgyq+"')";
	}
	ls_sql="SELECT gdm_gcxm.xmbm,gdm_gcxm.xmmc,gdm_xmdlbm.xmdlmc,gdm_xmxlbm.xmxlmc,gdm_gcxm.bz aa,gdm_wgjbbm.wgjbmc,gdm_gcxmcfbz.xzzwbm,gdm_gcxmcfbz.zgyq,gdm_gcxmcfbz.sgdkf,gdm_gcxmcfbz.sgdfkje,gdm_gcxmcfbz.ygkf,gdm_gcxmcfbz.ygfkje,gdm_gcxmcfbz.bz  ";
	ls_sql+=" FROM gdm_gcxmcfbz,gdm_gcxm,gdm_xmdlbm,gdm_xmxlbm,gdm_wgjbbm  ";
    ls_sql+=" where gdm_gcxm.xmbm=gdm_gcxmcfbz.xmbm(+)";
    ls_sql+=" and gdm_gcxm.xmdlbm=gdm_xmdlbm.xmdlbm(+)";
    ls_sql+=" and gdm_gcxm.xmxlbm=gdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and gdm_gcxmcfbz.wgjbbm=gdm_wgjbbm.wgjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_gcxm.xmdlbm,gdm_gcxm.xmxlbm,gdm_gcxm.xmbm,gdm_gcxmcfbz.wgjbbm,gdm_gcxmcfbz.xzzwbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_gcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmbm","gdm_gcxm_xmmc","gdm_gcxm_xmdlbm","gdm_gcxm_xmxlbm","gdm_gcxm_bz","gdm_gcxmcfbz_wgjbbm","gdm_gcxmcfbz_xzzwbm","gdm_gcxmcfbz_zgyq","gdm_gcxmcfbz_sgdkf","gdm_gcxmcfbz_sgdfkje","gdm_gcxmcfbz_ygkf","gdm_gcxmcfbz_ygfkje","gdm_gcxmcfbz_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmbm"};
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��Ŀ����</td>
	<td  width="9%">��Ŀ����</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="7%">��ĿС��</td>
	<td  width="7%">��Ŀ��ע</td>
	<td  width="7%">Υ�漶��</td>
	<td  width="7%">������Աְ��</td>
	<td  width="7%">����Ҫ��</td>
	<td  width="7%">ʩ���ӿ۷�</td>
	<td  width="7%">ʩ���ӷ�����</td>
	<td  width="7%">Ա���۷�</td>
	<td  width="7%">Ա��������</td>
	<td  width="7%">������ע</td>
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