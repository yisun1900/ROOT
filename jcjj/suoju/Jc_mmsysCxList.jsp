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
	String jc_mmsys_wjjbm=null;
	String jc_mmsys_mmsysbm=null;
	String jc_mmsys_bm=null;
	jc_mmsys_wjjbm=request.getParameter("jc_mmsys_wjjbm");
	if (jc_mmsys_wjjbm!=null)
	{
		jc_mmsys_wjjbm=cf.GB2Uni(jc_mmsys_wjjbm);
		if (!(jc_mmsys_wjjbm.equals("")))	wheresql+=" and  (jc_mmsys.wjjbm='"+jc_mmsys_wjjbm+"')";
	}
	jc_mmsys_mmsysbm=request.getParameter("jc_mmsys_mmsysbm");
	if (jc_mmsys_mmsysbm!=null)
	{
		jc_mmsys_mmsysbm=cf.GB2Uni(jc_mmsys_mmsysbm);
		if (!(jc_mmsys_mmsysbm.equals("")))	wheresql+=" and  (jc_mmsys.mmsysbm='"+jc_mmsys_mmsysbm+"')";
	}
	jc_mmsys_bm=request.getParameter("jc_mmsys_bm");
	if (jc_mmsys_bm!=null)
	{
		jc_mmsys_bm=cf.GB2Uni(jc_mmsys_bm);
		if (!(jc_mmsys_bm.equals("")))	wheresql+=" and  (jc_mmsys.bm='"+jc_mmsys_bm+"')";
	}
	ls_sql="SELECT jc_mmsys.wjjbm as wjjbm,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_mmsys.mmsysbm as mmsysbm,jdm_mmsysbm.mmsysmc as jdm_mmsysbm_mmsysmc,jc_mmsys.bm as jc_mmsys_bm  ";
	ls_sql+=" FROM jdm_wjjbm,jdm_mmsysbm,jc_mmsys  ";
    ls_sql+=" where jc_mmsys.wjjbm=jdm_wjjbm.wjjbm and jc_mmsys.mmsysbm=jdm_mmsysbm.mmsysbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmsys.wjjbm,jc_mmsys.mmsysbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmsysCxList.jsp","SelectCxJc_mmsys.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_wjjbm_wjjmc","jdm_mmsysbm_mmsysmc","jc_mmsys_bm"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"wjjbm","mmsysbm"};
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
	<td  width="20%">����</td>
	<td  width="20%">����ɫ</td>
	<td  width="20%">����</td>
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