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
	String cw_dejsglfl_xh=null;
	String cw_dejsglfl_qsz=null;
	String cw_dejsglfl_jzz=null;
	String cw_dejsglfl_jsbl=null;
	String cw_dejsglfl_dqbm=null;
	cw_dejsglfl_xh=request.getParameter("cw_dejsglfl_xh");
	if (cw_dejsglfl_xh!=null)
	{
		cw_dejsglfl_xh=cw_dejsglfl_xh.trim();
		if (!(cw_dejsglfl_xh.equals("")))	wheresql+=" and (cw_dejsglfl.xh="+cw_dejsglfl_xh+") ";
	}
	cw_dejsglfl_qsz=request.getParameter("cw_dejsglfl_qsz");
	if (cw_dejsglfl_qsz!=null)
	{
		cw_dejsglfl_qsz=cw_dejsglfl_qsz.trim();
		if (!(cw_dejsglfl_qsz.equals("")))	wheresql+=" and  (cw_dejsglfl.qsz="+cw_dejsglfl_qsz+") ";
	}
	cw_dejsglfl_jzz=request.getParameter("cw_dejsglfl_jzz");
	if (cw_dejsglfl_jzz!=null)
	{
		cw_dejsglfl_jzz=cw_dejsglfl_jzz.trim();
		if (!(cw_dejsglfl_jzz.equals("")))	wheresql+=" and  (cw_dejsglfl.jzz="+cw_dejsglfl_jzz+") ";
	}
	cw_dejsglfl_jsbl=request.getParameter("cw_dejsglfl_jsbl");
	if (cw_dejsglfl_jsbl!=null)
	{
		cw_dejsglfl_jsbl=cw_dejsglfl_jsbl.trim();
		if (!(cw_dejsglfl_jsbl.equals("")))	wheresql+=" and  (cw_dejsglfl.jsbl="+cw_dejsglfl_jsbl+") ";
	}
	cw_dejsglfl_dqbm=request.getParameter("cw_dejsglfl_dqbm");
	if (cw_dejsglfl_dqbm!=null)
	{
		cw_dejsglfl_dqbm=cf.GB2Uni(cw_dejsglfl_dqbm);
		if (!(cw_dejsglfl_dqbm.equals("")))	wheresql+=" and  (cw_dejsglfl.dqbm='"+cw_dejsglfl_dqbm+"')";
	}
	ls_sql="SELECT cw_dejsglfl.xh,cw_dejsglfl.qsz,cw_dejsglfl.jzz,cw_dejsglfl.jsbl,cw_dejsglfl.dqbm,dm_dqbm.dqmc  ";
	ls_sql+=" FROM cw_dejsglfl,dm_dqbm  ";
    ls_sql+=" where cw_dejsglfl.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_dejsglfl.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_dejsglflList.jsp","SelectCw_dejsglfl.jsp","","EditCw_dejsglfl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","cw_dejsglfl_qsz","cw_dejsglfl_jzz","cw_dejsglfl_jsbl","cw_dejsglfl_dqbm","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_dejsglflList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_dejsglfl where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="10%">���</td>
	<td  width="20%">�ɱ������ʼֵ��>=��</td>
	<td  width="20%">�ɱ�����ֵֹ��<��</td>
	<td  width="15%">�������(0-100)</td>
	<td  width="10%">����</td>
	<td  width="15%">����</td>
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