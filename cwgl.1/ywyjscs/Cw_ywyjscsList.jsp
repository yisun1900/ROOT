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
	String cw_ywyjscs_fgsbh=null;
	String cw_ywyjscs_csbm=null;
	String cw_ywyjscs_csmc=null;
	String cw_ywyjscs_csz=null;
	cw_ywyjscs_fgsbh=request.getParameter("cw_ywyjscs_fgsbh");
	if (cw_ywyjscs_fgsbh!=null)
	{
		cw_ywyjscs_fgsbh=cf.GB2Uni(cw_ywyjscs_fgsbh);
		if (!(cw_ywyjscs_fgsbh.equals("")))	wheresql+=" and  (cw_ywyjscs.fgsbh='"+cw_ywyjscs_fgsbh+"')";
	}
	cw_ywyjscs_csbm=request.getParameter("cw_ywyjscs_csbm");
	if (cw_ywyjscs_csbm!=null)
	{
		cw_ywyjscs_csbm=cf.GB2Uni(cw_ywyjscs_csbm);
		if (!(cw_ywyjscs_csbm.equals("")))	wheresql+=" and  (cw_ywyjscs.csbm='"+cw_ywyjscs_csbm+"')";
	}
	cw_ywyjscs_csmc=request.getParameter("cw_ywyjscs_csmc");
	if (cw_ywyjscs_csmc!=null)
	{
		cw_ywyjscs_csmc=cf.GB2Uni(cw_ywyjscs_csmc);
		if (!(cw_ywyjscs_csmc.equals("")))	wheresql+=" and  (cw_ywyjscs.csmc='"+cw_ywyjscs_csmc+"')";
	}
	cw_ywyjscs_csz=request.getParameter("cw_ywyjscs_csz");
	if (cw_ywyjscs_csz!=null)
	{
		cw_ywyjscs_csz=cw_ywyjscs_csz.trim();
		if (!(cw_ywyjscs_csz.equals("")))	wheresql+=" and  (cw_ywyjscs.csz="+cw_ywyjscs_csz+") ";
	}
	ls_sql="SELECT cw_ywyjscs.fgsbh,sq_dwxx.dwmc,cw_ywyjscs.csbm,cw_ywyjscs.csmc,cw_ywyjscs.csz  ";
	ls_sql+=" FROM sq_dwxx,cw_ywyjscs  ";
    ls_sql+=" where cw_ywyjscs.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_ywyjscsList.jsp","SelectCw_ywyjscs.jsp","","EditCw_ywyjscs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fgsbh","sq_dwxx_dwmc","csbm","cw_ywyjscs_csmc","cw_ywyjscs_csz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fgsbh","csbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_ywyjscsList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from cw_ywyjscs where "+chooseitem;
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