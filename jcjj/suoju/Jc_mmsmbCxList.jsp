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
	String jc_mmsmb_wjjbm=null;
	String jc_mmsmb_mmsmbbm=null;
	String jc_mmsmb_bm=null;
	jc_mmsmb_wjjbm=request.getParameter("jc_mmsmb_wjjbm");
	if (jc_mmsmb_wjjbm!=null)
	{
		jc_mmsmb_wjjbm=cf.GB2Uni(jc_mmsmb_wjjbm);
		if (!(jc_mmsmb_wjjbm.equals("")))	wheresql+=" and  (jc_mmsmb.wjjbm='"+jc_mmsmb_wjjbm+"')";
	}
	jc_mmsmb_mmsmbbm=request.getParameter("jc_mmsmb_mmsmbbm");
	if (jc_mmsmb_mmsmbbm!=null)
	{
		jc_mmsmb_mmsmbbm=cf.GB2Uni(jc_mmsmb_mmsmbbm);
		if (!(jc_mmsmb_mmsmbbm.equals("")))	wheresql+=" and  (jc_mmsmb.mmsmbbm='"+jc_mmsmb_mmsmbbm+"')";
	}
	jc_mmsmb_bm=request.getParameter("jc_mmsmb_bm");
	if (jc_mmsmb_bm!=null)
	{
		jc_mmsmb_bm=cf.GB2Uni(jc_mmsmb_bm);
		if (!(jc_mmsmb_bm.equals("")))	wheresql+=" and  (jc_mmsmb.bm='"+jc_mmsmb_bm+"')";
	}
	ls_sql="SELECT jc_mmsmb.wjjbm as wjjbm,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_mmsmb.mmsmbbm as mmsmbbm,jdm_mmsmbbm.mmsmbmc as jdm_mmsmbbm_mmsmbmc,jc_mmsmb.bm as jc_mmsmb_bm  ";
	ls_sql+=" FROM jdm_wjjbm,jdm_mmsmbbm,jc_mmsmb  ";
    ls_sql+=" where jc_mmsmb.wjjbm=jdm_wjjbm.wjjbm and jc_mmsmb.mmsmbbm=jdm_mmsmbbm.mmsmbbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmsmb.wjjbm,jc_mmsmb.mmsmbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmsmbCxList.jsp","SelectCxJc_mmsmb.jsp","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_wjjbm_wjjmc","jdm_mmsmbbm_mmsmbmc","jc_mmsmb_bm"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"wjjbm","mmsmbbm"};
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
	<td  width="20%">�����</td>
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