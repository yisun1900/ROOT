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
	String cw_zjjscs_fgsbh=null;
	String cw_zjjscs_csbm=null;
	String cw_zjjscs_csmc=null;
	String cw_zjjscs_csz=null;
	cw_zjjscs_fgsbh=request.getParameter("cw_zjjscs_fgsbh");
	if (cw_zjjscs_fgsbh!=null)
	{
		cw_zjjscs_fgsbh=cf.GB2Uni(cw_zjjscs_fgsbh);
		if (!(cw_zjjscs_fgsbh.equals("")))	wheresql+=" and  (cw_zjjscs.fgsbh='"+cw_zjjscs_fgsbh+"')";
	}
	cw_zjjscs_csbm=request.getParameter("cw_zjjscs_csbm");
	if (cw_zjjscs_csbm!=null)
	{
		cw_zjjscs_csbm=cf.GB2Uni(cw_zjjscs_csbm);
		if (!(cw_zjjscs_csbm.equals("")))	wheresql+=" and  (cw_zjjscs.csbm='"+cw_zjjscs_csbm+"')";
	}
	cw_zjjscs_csmc=request.getParameter("cw_zjjscs_csmc");
	if (cw_zjjscs_csmc!=null)
	{
		cw_zjjscs_csmc=cf.GB2Uni(cw_zjjscs_csmc);
		if (!(cw_zjjscs_csmc.equals("")))	wheresql+=" and  (cw_zjjscs.csmc='"+cw_zjjscs_csmc+"')";
	}
	cw_zjjscs_csz=request.getParameter("cw_zjjscs_csz");
	if (cw_zjjscs_csz!=null)
	{
		cw_zjjscs_csz=cw_zjjscs_csz.trim();
		if (!(cw_zjjscs_csz.equals("")))	wheresql+=" and  (cw_zjjscs.csz="+cw_zjjscs_csz+") ";
	}
	ls_sql="SELECT cw_zjjscs.fgsbh,sq_dwxx.dwmc,cw_zjjscs.csbm,cw_zjjscs.csmc,cw_zjjscs.csz  ";
	ls_sql+=" FROM sq_dwxx,cw_zjjscs  ";
    ls_sql+=" where cw_zjjscs.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zjjscsList.jsp","SelectCw_zjjscs.jsp","","EditCw_zjjscs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fgsbh","sq_dwxx_dwmc","csbm","cw_zjjscs_csmc","cw_zjjscs_csz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fgsbh","csbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_zjjscsList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from cw_zjjscs where "+chooseitem;
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
	<td  width="17%">�ֹ�˾</td>
	<td  width="17%">�ֹ�˾</td>
	<td  width="17%">��������</td>
	<td  width="17%">��������</td>
	<td  width="17%">����ֵ</td>
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