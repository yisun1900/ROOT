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


	ls_sql="SELECT gdm_gcxm.xmbm,gdm_gcxm.xmmc,gdm_xmdlbm.xmdlmc,gdm_xmxlbm.xmxlmc,gdm_gcxm.bz ";
	ls_sql+=" FROM gdm_gcxm,gdm_xmdlbm,gdm_xmxlbm  ";
    ls_sql+=" where gdm_gcxm.xmdlbm=gdm_xmdlbm.xmdlbm(+)";
    ls_sql+=" and gdm_gcxm.xmxlbm=gdm_xmxlbm.xmxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_gcxm.xmdlbm,gdm_gcxm.xmxlbm,gdm_gcxm.xmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_gcxmList.jsp","","","EditGdm_gcxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmbm","gdm_gcxm_xmmc","gdm_gcxm_xmdlbm","gdm_gcxm_xmxlbm","gdm_gcxm_bz","gdm_gcxmcfbz_wgjbbm","gdm_gcxmcfbz_xzzwbm","gdm_gcxmcfbz_zgyq","gdm_gcxmcfbz_sgdkf","gdm_gcxmcfbz_sgdfkje","gdm_gcxmcfbz_ygkf","gdm_gcxmcfbz_ygfkje","gdm_gcxmcfbz_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Gdm_gcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] xmbm = request.getParameterValues("xmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmbm,"xmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from gdm_gcxm where "+chooseitem;
		sql[1]="delete from gdm_gcxmcfbz where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	<td  width="8%">&nbsp;</td>
	<td  width="10%">��Ŀ����</td>
	<td  width="25%">��Ŀ����</td>
	<td  width="15%">��Ŀ����</td>
	<td  width="15%">��ĿС��</td>
	<td  width="27%">��Ŀ��ע</td>
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