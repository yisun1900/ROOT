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
	String gdm_cfry_wgjbbm=null;
	String gdm_wgjbbm_wgjbmc=null;
	String gdm_cfry_xzzwbm=null;
	gdm_cfry_wgjbbm=request.getParameter("gdm_cfry_wgjbbm");
	if (gdm_cfry_wgjbbm!=null)
	{
		gdm_cfry_wgjbbm=cf.GB2Uni(gdm_cfry_wgjbbm);
		if (!(gdm_cfry_wgjbbm.equals("")))	wheresql+=" and  (gdm_cfry.wgjbbm='"+gdm_cfry_wgjbbm+"')";
	}
	gdm_wgjbbm_wgjbmc=request.getParameter("gdm_wgjbbm_wgjbmc");
	if (gdm_wgjbbm_wgjbmc!=null)
	{
		gdm_wgjbbm_wgjbmc=cf.GB2Uni(gdm_wgjbbm_wgjbmc);
		if (!(gdm_wgjbbm_wgjbmc.equals("")))	wheresql+=" and  (gdm_wgjbbm.wgjbmc='"+gdm_wgjbbm_wgjbmc+"')";
	}
	gdm_cfry_xzzwbm=request.getParameter("gdm_cfry_xzzwbm");
	if (gdm_cfry_xzzwbm!=null)
	{
		gdm_cfry_xzzwbm=cf.GB2Uni(gdm_cfry_xzzwbm);
		if (!(gdm_cfry_xzzwbm.equals("")))	wheresql+=" and  (gdm_cfry.xzzwbm='"+gdm_cfry_xzzwbm+"')";
	}
	ls_sql="SELECT gdm_cfry.wgjbbm,gdm_wgjbbm.wgjbmc,gdm_cfry.xzzwbm  ";
	ls_sql+=" FROM gdm_wgjbbm,gdm_cfry  ";
    ls_sql+=" where gdm_cfry.wgjbbm=gdm_wgjbbm.wgjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_cfry.wgjbbm,gdm_cfry.xzzwbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_cfryList.jsp","","","EditGdm_cfry.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"wgjbbm","gdm_wgjbbm_wgjbmc","xzzwbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"wgjbbm","xzzwbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Gdm_cfryList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from gdm_cfry where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="29%">Υ�漶�����</td>
	<td  width="29%">Υ�漶������</td>
	<td  width="29%">������Աְ��</td>
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